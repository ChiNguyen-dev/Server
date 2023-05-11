package com.yody.Server.dto.variant;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;

@Data
@Builder
public class VariantResDTO {
    private String name;
    private String sku;
    private String image;
    private String size;
    private String color;
    private BigDecimal price;
}
