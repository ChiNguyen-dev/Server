package com.yody.Server.api.client;

import com.yody.Server.dto.cart.AddToCartDTO;
import com.yody.Server.dto.cart.CartRequestDTO;
import com.yody.Server.dto.cart.CartResponseDTO;
import com.yody.Server.service.ICartService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@Slf4j
@RequestMapping("/api/v1/carts")
public class CartController {
    private final ICartService cartService;
    @PostMapping("/add")
    public CartResponseDTO addToCart (@RequestBody AddToCartDTO addToCartDTO) {
        return this.cartService.addToCart(addToCartDTO);
    }
}
