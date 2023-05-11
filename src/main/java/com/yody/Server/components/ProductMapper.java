package com.yody.Server.components;

import com.yody.Server.dto.category.CategoryAdminResDTO;
import com.yody.Server.dto.category.CategoryResDTO;
import com.yody.Server.dto.image.ImageDTO;
import com.yody.Server.dto.product.ProductReqAdminDTO;
import com.yody.Server.dto.product.ProductResAdminDTO;
import com.yody.Server.dto.variant.ProductVariantResDTO;
import com.yody.Server.entities.Category;
import com.yody.Server.entities.Product;
import com.yody.Server.utils.GenerateSlug;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@RequiredArgsConstructor
public class ProductMapper {
    public final ModelMapper modelMapper;

    public Product toEntity(ProductReqAdminDTO productRequestAdminDTO, Category category) {
        Product product = this.modelMapper.map(productRequestAdminDTO, Product.class);
        product.setSlug(GenerateSlug.toSlug(product.getName()));
        product.setCategory(category);
        product.setProductVariants(new ArrayList<>());
        product.setProductImages(new ArrayList<>());
        return product;
    }

    public ProductResAdminDTO toDto(Product product) {
        CategoryResDTO categoryDTO = this.modelMapper.map(product.getCategory(), CategoryResDTO.class);
        List<ImageDTO> imageDTOS = product.getProductImages()
                .stream().map(ProductImage -> modelMapper.map(ProductImage, ImageDTO.class))
                .toList();
        List<ProductVariantResDTO> variantDTOS = product.getProductVariants()
                .stream()
                .map(ProductVariant -> this.modelMapper.map(ProductVariant, ProductVariantResDTO.class))
                .toList();
        ProductResAdminDTO productResAdminDTO = this.modelMapper.map(product, ProductResAdminDTO.class);
        productResAdminDTO.setImages(imageDTOS);
        productResAdminDTO.setCategory(categoryDTO);
        productResAdminDTO.setVariants(variantDTOS);
        return productResAdminDTO;
    }
}
