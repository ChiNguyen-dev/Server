package com.yody.Server.dto;

import lombok.Data;

import java.util.List;

@Data
public class ImageVariantDTO {
    private String sku;
    private List<String> paths;
}
