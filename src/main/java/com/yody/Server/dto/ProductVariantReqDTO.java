package com.yody.Server.dto;

import lombok.Data;

import java.util.List;

@Data
public class ProductVariantReqDTO extends AbstractDTO<ProductVariantReqDTO> {
    private List<ProductVariantDTO> productVariants;
}
