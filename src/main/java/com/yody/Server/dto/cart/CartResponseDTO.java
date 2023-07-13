package com.yody.Server.dto.cart;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;
@Data
public class CartResponseDTO {
    private List<CartItemResponseDTO> items;
}
