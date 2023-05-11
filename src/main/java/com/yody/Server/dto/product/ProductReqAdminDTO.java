package com.yody.Server.dto.product;

import com.yody.Server.dto.AbstractDTO;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class ProductReqAdminDTO extends AbstractDTO<ProductReqAdminDTO> {
    private String name;
    private BigDecimal price;
    private Long categoryId;
    private String description;
}
