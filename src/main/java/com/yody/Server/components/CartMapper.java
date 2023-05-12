package com.yody.Server.components;

import com.yody.Server.dto.cart.CartItemResponseDTO;
import com.yody.Server.dto.cart.CartResponseDTO;
import com.yody.Server.dto.variant.ProductVariantResDTO;
import com.yody.Server.entities.Cart;
import com.yody.Server.entities.CartItem;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;
@Slf4j
@Component
@RequiredArgsConstructor
public class CartMapper {
    private final ModelMapper modelMapper;
    public CartResponseDTO toDTO(Cart cart){
        CartResponseDTO cartResponseDTO = this.modelMapper.map(cart, CartResponseDTO.class);
        return cartResponseDTO;
    }
}
