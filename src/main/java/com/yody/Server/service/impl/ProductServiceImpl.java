package com.yody.Server.service.impl;

import com.yody.Server.components.ProductMapper;
import com.yody.Server.dto.DataProductReqDTO;
import com.yody.Server.dto.ProductResAdminDTO;
import com.yody.Server.dto.ProductVariantDTO;
import com.yody.Server.entities.*;
import com.yody.Server.exception.NotFondException;
import com.yody.Server.repositories.*;
import com.yody.Server.service.IProductService;
import com.yody.Server.utils.GenerateSlug;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@Service
@Slf4j
public class ProductServiceImpl implements IProductService {
    private final ProductRepository productRepository;
    private final ProductVariantRepository productVariantRepository;
    private final CategoryRepository categoryRepository;
    private final ColorRepository colorRepository;
    private final SizeRepository sizeRepository;
    private final ProductMapper productMapper;

    public List<Product> getAllProduct() {
        return productRepository.findAll();
    }

    public Product getProductById(Long id) {
        return this.productRepository.findById(id).orElseThrow(() -> new NotFondException("Not fond product"));
    }

    @Override
    public List<ProductVariant> getVariantsByProductId(Long id) {
        return productVariantRepository.findByProductId(id);
    }

    @Override
    public ProductResAdminDTO addProduct(DataProductReqDTO dataProductReqDTO) {
        // Find Category
        Category category = this.categoryRepository
                .findById(dataProductReqDTO.getProductReqAdminDTO().getCategoryId())
                .orElseThrow(() -> new NotFondException("Category Not isExist in Database"));
        // Transfer data from req to Entity
        Product productEntity = this.productMapper.toEntity(dataProductReqDTO.getProductReqAdminDTO());
        productEntity.setSlug(GenerateSlug.toSlug(productEntity.getName()));
        productEntity.setCategory(category);
        productEntity.setProductVariants(new ArrayList<>());
        // Save product
        Product product = this.productRepository.save(productEntity);
        // Loop find and create Entity ProductVariant then add ProductVariant to Product
        for (ProductVariantDTO productVariantDTO : dataProductReqDTO.getProductVariantReqDTO().getProductVariants()) {
            Color color = this.colorRepository
                    .findById(productVariantDTO.getColorId())
                    .orElseThrow(() -> new NotFondException("Color Not isExist in Database"));
            Size size = this.sizeRepository
                    .findById(productVariantDTO.getSizeId())
                    .orElseThrow(() -> new NotFondException("Size Not isExist in Database"));
            ProductVariant productVariant = ProductVariant.builder()
                    .color(color)
                    .size(size)
                    .product(product)
                    .build();
            product.addProductVariant(this.productVariantRepository.save(productVariant));
        }
        return this.productMapper.toDto(this.productRepository.save(product));
    }
}
