package com.yody.Server.dto.variant;

import com.yody.Server.dto.AbstractDTO;
import lombok.Data;

import java.util.List;

@Data
public class ProductVariantReqDTO extends AbstractDTO<ProductVariantReqDTO> {
    private List<ProductVariantDTO> productVariants;
}
