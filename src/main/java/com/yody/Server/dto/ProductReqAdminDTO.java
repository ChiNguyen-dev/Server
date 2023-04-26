package com.yody.Server.dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class ProductReqAdminDTO extends AbstractDTO<ProductReqAdminDTO> {
    private String name;
    private BigDecimal price;
    private Long categoryId;
    private String description;
}
