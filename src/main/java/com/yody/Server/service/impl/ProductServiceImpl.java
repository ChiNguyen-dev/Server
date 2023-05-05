package com.yody.Server.service.impl;

import com.yody.Server.components.ProductMapper;
import com.yody.Server.dto.*;
import com.yody.Server.entities.Category;
import com.yody.Server.entities.Product;
import com.yody.Server.entities.ProductImage;
import com.yody.Server.entities.ProductVariant;
import com.yody.Server.exception.NotFondException;
import com.yody.Server.repositories.*;
import com.yody.Server.service.IProductService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.*;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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

    private final ModelMapper modelMapper;
    private final EntityManager em;
    public List<ProductResAdminDTO> getAllProduct() {
        return this.productRepository
                .findAll()
                .stream().map(Product -> this.modelMapper.map(Product, ProductResAdminDTO.class))
                .toList();
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
                product.addProductImage(productImage);
            }
        }
        for (ProductVariantDTO variant : dataProductReqDTO.getProductVariants()) {
            ProductVariant productVariant = this.productVariantRepository.save(ProductVariant.builder()
                    .sku(variant.getSku())
                    .image(product.getProductImages().get(0).getSrc())
                    .size(variant.getSize())
                    .color(variant.getColor())
                    .product(product)
                    .build());
            product.addProductVariant(productVariant);
        }
        return this.productMapper.toDto(this.productRepository.save(product));
    }

    @Override
    public List<Product> getProductByCategoryId(Long cateId) {
        return this.productRepository.findByCategoryId(cateId);
    }

    @Override
    public List<Product> getProductByFilter(List<Long> cateIds,
                                            List<String> colors,
                                            List<String> sizes,
                                            int page,
                                            String sortType) {
        Pageable pageable = null;
        switch (sortType.toUpperCase()) {
            case "NAME_ASC": {
                pageable = PageRequest.of(page, 20, Sort.by("name").ascending());
                break;
            }
            case "NAME_DESC":{
                pageable = PageRequest.of(page, 20, Sort.by("name").descending());
                break;
            }
            default: {
                pageable = PageRequest.of(page, 20);
                break;
            }
        }
        Specification<Product> specification = SearchSpecification.getSpecification(cateIds,colors,sizes);
        return this.productRepository.findAll(specification, pageable);
    }
}

