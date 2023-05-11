package com.yody.Server.dto.cart;

import com.yody.Server.dto.variant.ProductVariantResDTO;
import lombok.Data;

@Data
public class CartItemResponseDTO {
    private ProductVariantResDTO variant;
    private Long quantity;
}
