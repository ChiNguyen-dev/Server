package com.yody.Server.dto.cart;

import lombok.Data;

import java.util.List;

@Data
public class CartRequestDTO {
    private String email;
    private List<CartItemRequestDTO> items;
}
