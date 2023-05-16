package com.yody.Server.dto.cart;

import lombok.Data;

@Data
public class AddToCartDTO {
    private Long variantId;
    private Long quantity;
}
