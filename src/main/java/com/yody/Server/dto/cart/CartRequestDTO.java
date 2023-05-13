package com.yody.Server.dto.cart;

import lombok.Data;

import java.util.List;

@Data
public class CartRequestDTO {
    private List<CartItemRequestDTO> items;
}
