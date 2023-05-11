package com.yody.Server.dto.product;

import com.yody.Server.dto.AbstractDTO;
import com.yody.Server.dto.category.CategoryDTO;
import com.yody.Server.dto.image.ImageDTO;
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
