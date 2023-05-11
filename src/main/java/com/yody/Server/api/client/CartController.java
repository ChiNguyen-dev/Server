package com.yody.Server.api.client;

import com.yody.Server.dto.cart.CartRequestDTO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@Slf4j
@RequestMapping("/api/v1/carts")
public class CartController {
    @PostMapping
    public ResponseEntity<String> store(@RequestBody CartRequestDTO request) {
        log.info(request.toString());
        return ResponseEntity.ok("oke bạn oơi");
    }
}
