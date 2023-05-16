package com.yody.Server.api.client;

import com.yody.Server.dto.cart.AddToCartDTO;
import com.yody.Server.dto.cart.CartItemResponseDTO;
import com.yody.Server.dto.cart.CartResponseDTO;
import com.yody.Server.service.ICartService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@Slf4j
@RequestMapping("/api/v1/carts")
@PreAuthorize("hasAuthority('USER')")
public class CartController {
    private final ICartService cartService;
    @GetMapping()
    public CartResponseDTO getCartByCurrentUser(){
        return  this.cartService.getCartByCurrentUser();
    }

    @PostMapping()
    public CartResponseDTO addToCart (@RequestBody AddToCartDTO addToCartDTO) {
        return this.cartService.addToCart(addToCartDTO);
    }
    @GetMapping("/minus/{itemId}/{quantity}")
    public CartItemResponseDTO minus(@PathVariable Long itemId, @PathVariable Long quantity){
        return this.cartService.minus(itemId, quantity);
    }
    @GetMapping("/plus/{itemId}/{quantity}")
    public CartItemResponseDTO plus(@PathVariable Long itemId, @PathVariable Long quantity){
        return this.cartService.plus(itemId, quantity);
    }
    @DeleteMapping("/{itemId}")
    public CartItemResponseDTO remove(@PathVariable Long itemId){
        return  this.cartService.remove(itemId);
    }
}
