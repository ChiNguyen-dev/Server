package com.yody.Server.dto.variant;

import com.yody.Server.dto.AbstractDTO;
import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;

@Data
@Builder
public class VariantResDTO extends AbstractDTO {
    private String name;
    private String sku;
    private String image;
    private String size;
    private String color;
    private BigDecimal price;
}
