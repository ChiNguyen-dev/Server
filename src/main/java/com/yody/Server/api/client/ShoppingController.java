package com.yody.Server.api.client;

import com.yody.Server.dto.shopping.ShoppingFormReqDTO;
import com.yody.Server.dto.shopping.ShoppingResDTO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@Slf4j
@RequestMapping("/api/v1/shopping")
public class ShoppingController {
    @PostMapping
    public ResponseEntity<ShoppingResDTO> store(@RequestBody ShoppingFormReqDTO request) {
        log.info(request.toString());
        return null;
    }
}
