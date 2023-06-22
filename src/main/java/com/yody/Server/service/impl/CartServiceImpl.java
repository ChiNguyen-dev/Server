package com.yody.Server.service.impl;

import com.yody.Server.components.CartItemMapper;
import com.yody.Server.components.CartMapper;
import com.yody.Server.dto.cart.AddToCartDTO;
import com.yody.Server.dto.cart.CartItemResponseDTO;
import com.yody.Server.dto.cart.CartResponseDTO;
import com.yody.Server.entities.*;
import com.yody.Server.service.impl.exception.NotFondException;
import com.yody.Server.repositories.*;
import com.yody.Server.service.ICartService;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@AllArgsConstructor
@Transactional
@Slf4j
public class CartServiceImpl implements ICartService {
    private final CartRepository cartRepository;
    private final ProductVariantRepository variantRepository;
    private final UserRepository userRepository;
    private final CartItemRepository itemRepository;
    private final CartMapper cartMapper;
    private final CartItemMapper itemMapper;

    @Override
    public CartResponseDTO addToCart(AddToCartDTO addToCartDTO) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ProductVariant variant = this.variantRepository.findById(addToCartDTO.getVariantId()).orElseThrow(() -> new NotFondException("variant not found"));
        Cart cart = cartRepository.findByUserId(user.getId()).orElse(null);
        Product product = variant.getProduct();
        CartItem item;
        if (cart == null) {
            item = CartItem.builder()
                    .productVariant(variant)
                    .product(product)
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
                        .product(product)
                        .build();
                cart.addToCart(item);
                item.setCart(cart);
            } else {
                item.setQuantity(item.getQuantity() + addToCartDTO.getQuantity());
                item.setCart(cart);
            }
        }
        return cartMapper.toDTO(this.cartRepository.save(cart));
    }

    @Override
    public CartItemResponseDTO minus(Long itemId, Long quantity) {
        CartItem item = this.itemRepository.findById(itemId).orElseThrow(() -> new NotFondException("not found"));
        Long currentQuantity = item.getQuantity();
        if (currentQuantity - quantity >= 1) {
            item.setQuantity(currentQuantity - quantity);
        }
        return this.itemMapper.toDto(this.itemRepository.save(item));
    }

    @Override
    public CartItemResponseDTO plus(Long itemId, Long quantity) {
        CartItem item = this.itemRepository.findById(itemId).orElseThrow(() -> new NotFondException("not found"));
        Long currentQuantity = item.getQuantity();
        item.setQuantity(currentQuantity + quantity);
        return this.itemMapper.toDto(this.itemRepository.save(item));
    }

    @Override
    public CartItemResponseDTO remove(Long itemId) {
        CartItem item = this.itemRepository.findById(itemId).orElseThrow(() -> new NotFondException("item not found"));
        itemRepository.delete(item);
        return this.itemMapper.toDto(item);
    }
    @Override
    public CartResponseDTO getCartByCurrentUser()  {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Cart cart = this.cartRepository.findByUserId(user.getId()).orElseThrow(() -> new NotFondException(" cart not found"));
        return this.cartMapper.toDTO(cart);
    }

}
