package com.yody.Server.dto;

import lombok.Data;

import java.util.List;

@Data
public class DataProductReqDTO extends AbstractDTO<DataProductReqDTO> {
    private ProductReqAdminDTO product;
    private List<ImageVariantDTO> images;
    private List<ProductVariantDTO> productVariants;
}
