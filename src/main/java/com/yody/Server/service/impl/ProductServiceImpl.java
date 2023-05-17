package com.yody.Server.service.impl;

import com.yody.Server.components.ProductMapper;
import com.yody.Server.components.VariantMapper;
import com.yody.Server.dto.image.ImageVariantDTO;
import com.yody.Server.dto.product.DataProductReqDTO;
import com.yody.Server.dto.product.ProductResAdminDTO;
import com.yody.Server.dto.product.ShowPageDTO;
import com.yody.Server.dto.variant.ProductVariantDTO;
import com.yody.Server.dto.variant.VariantResDTO;
import com.yody.Server.entities.Category;
import com.yody.Server.entities.Product;
import com.yody.Server.entities.ProductImage;
import com.yody.Server.entities.ProductVariant;
import com.yody.Server.exception.NotFondException;
import com.yody.Server.repositories.CategoryRepository;
import com.yody.Server.repositories.ProductImageReposiory;
import com.yody.Server.repositories.ProductRepository;
import com.yody.Server.repositories.ProductVariantRepository;
import com.yody.Server.service.IProductService;
import com.yody.Server.service.IStorageService;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
@Transactional
@Slf4j
public class ProductServiceImpl implements IProductService {
    private final ProductRepository productRepository;
    private final ProductVariantRepository productVariantRepository;
    private final CategoryRepository categoryRepository;
    private final ProductImageReposiory productImageReposiory;
    private final ProductMapper productMapper;
    private final VariantMapper variantMapper;
    private final ModelMapper modelMapper;
    private IStorageService storageService;

    @Override
    public List<VariantResDTO> searchByName(String name) {
        Pageable pageable = PageRequest.of(0, 5);
        return this.productRepository
                .findByNameContaining(pageable, name)
                .stream()
                .map(this.variantMapper::toVariantResDTO)
                .toList();
    }

    public List<ProductResAdminDTO> getAllProduct() {
        return this.productRepository
                .findAll()
                .stream()
                .map(Product -> this.modelMapper.map(Product, ProductResAdminDTO.class))
                .toList();
    }

    @Override
    public ShowPageDTO showPage(int page) {
        Pageable pageable = PageRequest.of(page, 10);
        Page<Product> products = this.productRepository.findAll(pageable);
        return ShowPageDTO.builder()
                .products(products.stream()
                        .map(Product -> this.modelMapper.map(Product, ProductResAdminDTO.class))
                        .toList())
                .totalPages(products.getTotalPages())
                .totalElements(products.getTotalElements())
                .build();
    }

    public ProductResAdminDTO getProductById(Long id) {
        Product product = this.productRepository.findById(id).orElseThrow(() -> new NotFondException("Not fond product"));
        return this.productMapper.toDto(product);
    }

    @Override
    public List<ProductVariant> getVariantsByProductId(Long id) {
        return productVariantRepository.findByProductId(id);
    }

    @Override
    public ProductResAdminDTO addProduct(DataProductReqDTO dataProductReqDTO) {
        Map<String, String> imageOfVariant = new HashMap<>();
        if (dataProductReqDTO.getImages().isEmpty()) throw new NotFondException("Images Not Empty.");
        if (dataProductReqDTO.getProductVariants().isEmpty()) throw new NotFondException("Option item Not Empty.");
        Category category = this.categoryRepository
                .findById(dataProductReqDTO.getProduct().getCategoryId())
                .orElseThrow(() -> new NotFondException("Category Not isExist in Database."));

        Product product = this.productRepository
                .save(this.productMapper.toEntity(dataProductReqDTO.getProduct(), category));

        for (ImageVariantDTO imageVariant : dataProductReqDTO.getImages()) {
            for (String path : imageVariant.getPaths()) {
                ProductImage productImage = productImageReposiory.save(ProductImage.builder()
                        .name(imageVariant.getSku())
                        .src(path)
                        .product(product)
                        .build());
                if (!imageOfVariant.containsKey(imageVariant.getSku()))
                    imageOfVariant.put(imageVariant.getSku(), productImage.getSrc());
                product.addProductImage(productImage);
            }
        }
        for (ProductVariantDTO variant : dataProductReqDTO.getProductVariants()) {
            ProductVariant productVariant = this.productVariantRepository.save(ProductVariant.builder()
                    .sku(variant.getSku())
                    .image(imageOfVariant.get(variant.getSku()))
                    .size(variant.getSize())
                    .color(variant.getColor())
                    .product(product)
                    .build());
            product.addProductVariant(productVariant);
        }
        return this.productMapper.toDto(this.productRepository.save(product));
    }

    @Override
    public List<ProductResAdminDTO> getProductByCategorySlug(Long cateId) {
        Category category = this.categoryRepository
                .findById(cateId).orElseThrow(() -> new NotFondException("Category not isExist in Database"));
        Pageable pageable = PageRequest.of(0, 8);
        return this.productRepository.findByCategoryId(pageable, category.getId())
                .stream()
                .map(Product -> this.modelMapper.map(Product, ProductResAdminDTO.class))
                .toList();
    }

    @Override
    public List<ProductResAdminDTO> getProductByCategoryId(Long cateId) {
        return this.productRepository
                .findByCategoryId(cateId)
                .stream()
                .map(Product -> this.modelMapper.map(Product, ProductResAdminDTO.class))
                .toList();
    }

    @Override
    public ProductResAdminDTO removeById(Long id) {
        Product product = this.productRepository.findById(id).orElseThrow(() -> new NotFondException("Not fond product"));
        product.getProductVariants().forEach(productVariant -> {
            String[] split = productVariant.getImage().split("/FileUpload/");
            this.storageService.deleteFile(split[split.length - 1]);
        });
        product.getProductImages().forEach(i -> {
            String[] split = i.getSrc().split("/FileUpload/");
            this.storageService.deleteFile(split[split.length - 1]);
        });
        this.productRepository.delete(product);
        return this.productMapper.toDto(product);
    }

    @Override
    public List<ProductResAdminDTO> getProductByFilter(List<String> slugs,
                                                       List<String> colors,
                                                       List<String> sizes,
                                                       int page,
                                                       String sortType) {
        Pageable pageable = null;
        switch (sortType.toUpperCase()) {
            case "TỪ A - Z": {
                pageable = PageRequest.of(page, 20, Sort.by("name").ascending());
                break;
            }
            case "TỪ Z - A": {
                pageable = PageRequest.of(page, 20, Sort.by("name").descending());
                break;
            }
            case "GIÁ GIẢM DẦN": {
                pageable = PageRequest.of(page, 20, Sort.by("price").descending());
                break;
            }
            case "GIÁ TĂNG DẦN": {
                pageable = PageRequest.of(page, 20, Sort.by("price").ascending());
                break;
            }
            default: {
                pageable = PageRequest.of(page, 20);
                break;
            }
        }
        Specification<Product> specification = SearchSpecification.getSpecification(slugs, colors, sizes);
        return this.productRepository.findAll(specification, pageable).stream().map(Product -> this.modelMapper.map(Product, ProductResAdminDTO.class))
                .toList();
    }
}

