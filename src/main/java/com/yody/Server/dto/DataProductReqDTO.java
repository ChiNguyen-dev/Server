package com.yody.Server.dto;

import lombok.Data;

@Data
public class DataProductReqDTO extends AbstractDTO<DataProductReqDTO>{
    private ProductReqAdminDTO productReqAdminDTO;
    private ProductVariantReqDTO productVariantReqDTO;
}
