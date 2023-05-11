package com.yody.Server.dto.image;

import lombok.Data;

import java.util.List;

@Data
public class ImageVariantDTO {
    private String sku;
    private List<String> paths;
}
