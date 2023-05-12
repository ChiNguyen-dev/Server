package com.yody.Server.service.impl;

import com.yody.Server.components.CartMapper;
import com.yody.Server.dto.cart.AddToCartDTO;
import com.yody.Server.dto.cart.CartResponseDTO;
import com.yody.Server.entities.*;
import com.yody.Server.exception.NotFondException;
import com.yody.Server.repositories.*;
import com.yody.Server.service.ICartService;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;

@Service
@AllArgsConstructor
@Transactional
@Slf4j
public class CartServiceImpl implements ICartService {
    private final CartRepository cartRepository;
    private final ProductVariantRepository variantRepository;
    private final UserRepository userRepository;
    private final CartMapper mapper;


    @Override
    public CartResponseDTO addToCart(AddToCartDTO addToCartDTO) {
        User user = this.userRepository.findByEmail(addToCartDTO.getEmail()).orElseThrow(() -> new NotFondException("not found user"));
        ProductVariant variant = this.variantRepository.findById(addToCartDTO.getVariantId()).orElseThrow(() -> new NotFondException("variant not found"));
        Cart cart = cartRepository.findByUserId(user.getId()).orElse(null);
        CartItem item;
        if (cart == null) {
            item = CartItem.builder()
                    .productVariant(variant)
                    .quantity(addToCartDTO.getQuantity())
                    .build();
            List<CartItem> items = new ArrayList<>();
            items.add(item);
            cart = Cart.builder()
                    .items(items)
                    .user(user)
                    .build();
            item.setCart(cart);
        } else {
            item = null;
            for (CartItem i : cart.getItems()) {
                if (i.getProductVariant().getId().equals(addToCartDTO.getVariantId()) ) item = i;
            }
            if (item == null) {
                item = CartItem.builder()
                        .productVariant(variant)
                        .quantity(addToCartDTO.getQuantity())
                        .build();
                cart.addToCart(item);
                item.setCart(cart);
            } else {
                item.setQuantity(item.getQuantity() + addToCartDTO.getQuantity());
                item.setCart(cart);
            }
        }
        return mapper.toDTO(this.cartRepository.save(cart));
    }
}
