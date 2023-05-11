package com.yody.Server.dto.variant;

import com.yody.Server.dto.AbstractDTO;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class VariantResDTO extends AbstractDTO<VariantResDTO> {
    private String name;
    private String sku;
    private String image;
    private String size;
    private String color;
    private BigDecimal price;
}
