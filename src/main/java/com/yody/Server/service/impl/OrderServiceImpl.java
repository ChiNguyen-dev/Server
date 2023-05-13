package com.yody.Server.service.impl;

import com.yody.Server.components.OrderMapper;
import com.yody.Server.dto.order.PlaceOrderRequest;
import com.yody.Server.dto.order.PlaceOrderResponse;
import com.yody.Server.entities.*;
import com.yody.Server.exception.NotFondException;
import com.yody.Server.repositories.OrderRepository;
import com.yody.Server.repositories.ProductVariantRepository;
import com.yody.Server.repositories.UserRepository;
import com.yody.Server.service.IOrderService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
@Slf4j
public class OrderServiceImpl implements IOrderService {
    private final OrderRepository orderRepository;
    private final ProductVariantRepository variantRepository;
    private final UserRepository userRepository;
    private final OrderMapper orderMapper;

    @Override
    public PlaceOrderResponse placeOrder(PlaceOrderRequest request) {
        List<OrderItem> lines = new ArrayList<>();
        request.getItems().forEach(line -> {
            ProductVariant variant = variantRepository.findById(line.getVariantId())
                    .orElseThrow(() -> new NotFondException("variant do not exist in database"));
            OrderItem item = OrderItem.builder()
                    .variant(variant)
                    .quantity(line.getQuantity())
                    .build();
            lines.add(item);
        });
        User user = userRepository.findByEmail(request.getEmail()).orElseThrow( () -> new NotFondException("user not found"));
        Order order = Order.builder()
                .orderUsername(request.getOrderUsername())
                .phone(request.getPhone())
                .orderItems(lines)
                .note(request.getNote())
                .paymentType(request.getPaymentType())
                .address(request.getAddress())
                .user(user)
                .build();
        for (OrderItem line: lines) {
            line.setOrder(order);
        }
        orderRepository.save(order);
        PlaceOrderResponse response = orderMapper.toDto(order);
        return response;
    }
}
