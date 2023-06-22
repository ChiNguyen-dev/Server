package com.yody.Server.dto.cart;

import com.yody.Server.dto.product.ProductResAdminDTO;
import com.yody.Server.dto.variant.ProductVariantResDTO;
import lombok.Data;

@Data
public class CartItemResponseDTO {
    private Long id;
    private ProductVariantResDTO variant;
    private ProductResAdminDTO product;
    private Long quantity;
}
