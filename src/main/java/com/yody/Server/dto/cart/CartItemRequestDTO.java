package com.yody.Server.dto.cart;

import com.yody.Server.dto.variant.ProductVariantDTO;
import lombok.Data;

@Data
public class CartItemRequestDTO {
    private Long variantId;
    private Long quantity;
}
