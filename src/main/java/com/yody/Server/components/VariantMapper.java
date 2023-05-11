package com.yody.Server.components;

import com.yody.Server.dto.variant.VariantResDTO;
import com.yody.Server.entities.Product;
import com.yody.Server.entities.ProductVariant;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class VariantMapper {
    public final ModelMapper modelMapper;

    public VariantResDTO toVariantResDTO(Product product) {
        ProductVariant variant = product.getProductVariants().get(0);
        return VariantResDTO.builder()
                .name(product.getName())
                .sku(variant.getSku())
                .image(variant.getImage())
                .size(variant.getSize())
                .color(variant.getColor())
                .price(product.getPrice())
                .build();
    }
}
