package com.yody.Server.service;

import com.yody.Server.dto.cart.AddToCartDTO;
import com.yody.Server.dto.cart.CartItemResponseDTO;
import com.yody.Server.dto.cart.CartResponseDTO;

public interface ICartService {
    CartResponseDTO addToCart(AddToCartDTO addToCartDTO);

    CartItemResponseDTO minus(Long itemId, Long quantity);

    CartItemResponseDTO plus(Long itemId, Long quantity);

    CartItemResponseDTO remove(Long itemId);

    CartResponseDTO getCartByCurrentUser();
}
