package com.yody.Server.dto.order;

import com.yody.Server.dto.AbstractDTO;
import com.yody.Server.dto.product.ProductResAdminDTO;
import com.yody.Server.dto.variant.ProductVariantResDTO;
import com.yody.Server.entities.ProductVariant;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LineItemResponse {
    private Long id;
    private ProductVariantResDTO variant;
    private ProductResAdminDTO product;
    private Long quantity;
}
