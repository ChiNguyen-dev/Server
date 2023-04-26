package com.yody.Server.dto;

import lombok.Data;

import java.util.List;

@Data
public class ProductVariantDTO {
    private String color;
    private String size;
    private String sku;
    private List<String> images;
}
