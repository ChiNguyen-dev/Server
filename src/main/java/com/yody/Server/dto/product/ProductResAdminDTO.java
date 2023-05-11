package com.yody.Server.dto.product;

import com.yody.Server.dto.AbstractDTO;
import com.yody.Server.dto.category.CategoryResDTO;
import com.yody.Server.dto.image.ImageDTO;
import com.yody.Server.dto.variant.ProductVariantResDTO;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class ProductResAdminDTO extends AbstractDTO<ProductResAdminDTO> {
    private String name;
    private BigDecimal price;
    private CategoryResDTO category;
    private List<ImageDTO> images;
    private List<ProductVariantResDTO> variants;
}
