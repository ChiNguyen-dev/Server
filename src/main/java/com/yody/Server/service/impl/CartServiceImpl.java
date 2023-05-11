package com.yody.Server.service.impl;

import com.yody.Server.repositories.CartItemRepository;
import com.yody.Server.repositories.CartRepository;
import com.yody.Server.service.ICartService;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
@Transactional
@Slf4j
public class CartServiceImpl implements ICartService {
    private final CartRepository cartRepository;
    private final CartItemRepository cartItemRepository;
}
