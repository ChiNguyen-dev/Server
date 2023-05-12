package com.yody.Server.components;

import com.yody.Server.dto.cart.CartItemResponseDTO;
import com.yody.Server.entities.CartItem;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class CartItemMapper {
    private final ModelMapper modelMapper;
    public CartItemResponseDTO toDto(CartItem item){
        return this.modelMapper.map(item, CartItemResponseDTO.class);
    }
}
