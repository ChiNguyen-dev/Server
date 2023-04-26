package com.yody.Server.dto;

import com.yody.Server.entities.ProductImage;
import com.yody.Server.entities.ProductVariant;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;


@Data
public class ProductResAdminDTO extends AbstractDTO<ProductResAdminDTO> {
    private String name;
    private BigDecimal price;
    private CategoryDTO category;
    private List<ImageDTO> images;
    private List<ProductVariant> variants;
}
