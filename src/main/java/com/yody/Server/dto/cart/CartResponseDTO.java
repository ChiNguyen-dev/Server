package com.yody.Server.dto.cart;

import lombok.Data;

import java.util.List;
@Data
public class CartResponseDTO {
    private Long userId;
    private List<CartItemResponseDTO> items;
}
