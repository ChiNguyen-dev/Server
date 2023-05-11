package com.yody.Server.components;

import com.yody.Server.dto.variant.VariantResDTO;
import com.yody.Server.entities.ProductVariant;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class VariantMapper {
    public final ModelMapper modelMapper;

    public VariantResDTO toVariantResDTO(ProductVariant productVariant) {
        VariantResDTO variantResDTO = this.modelMapper.map(productVariant, VariantResDTO.class);
        variantResDTO.setName(productVariant.getProduct().getName());
        variantResDTO.setPrice(productVariant.getProduct().getPrice());
        return variantResDTO;
    }
}
