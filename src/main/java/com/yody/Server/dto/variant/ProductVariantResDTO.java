package com.yody.Server.dto.variant;

import com.yody.Server.dto.AbstractDTO;
import lombok.Data;

@Data
public class ProductVariantResDTO extends AbstractDTO<ProductVariantResDTO> {
    private String sku;
    private String image;
    private String size;
    private String color;
}
