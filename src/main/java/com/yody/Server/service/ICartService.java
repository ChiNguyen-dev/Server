package com.yody.Server.service;

import com.yody.Server.dto.cart.AddToCartDTO;
import com.yody.Server.dto.cart.CartResponseDTO;

public interface ICartService {
    CartResponseDTO addToCart(AddToCartDTO addToCartDTO);
}
