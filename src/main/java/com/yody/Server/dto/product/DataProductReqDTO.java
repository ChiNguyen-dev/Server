package com.yody.Server.dto.product;

import com.yody.Server.dto.AbstractDTO;
import com.yody.Server.dto.image.ImageVariantDTO;
import com.yody.Server.dto.variant.ProductVariantDTO;
import lombok.Data;

import java.util.List;

@Data
public class DataProductReqDTO extends AbstractDTO<DataProductReqDTO> {
    private ProductReqAdminDTO product;
    private List<ImageVariantDTO> images;
    private List<ProductVariantDTO> productVariants;
}
