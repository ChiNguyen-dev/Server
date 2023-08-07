package com.yody.Server.service.impl;

import com.yody.Server.components.OrderMapper;
import com.yody.Server.dto.order.PaymentInfo;
import com.yody.Server.dto.order.PlaceOrderRequest;
import com.yody.Server.dto.order.PlaceOrderResponse;
import com.yody.Server.entities.*;
import com.yody.Server.service.impl.exception.NotFondException;
import com.yody.Server.repositories.CartRepository;
import com.yody.Server.repositories.OrderRepository;
import com.yody.Server.repositories.ProductVariantRepository;
import com.yody.Server.service.IOrderService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
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
    private final CartRepository cartRepository;
    private final OrderMapper orderMapper;
    @Override
    public PlaceOrderResponse placeOrder(PlaceOrderRequest request) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        List<OrderItem> lines = new ArrayList<>();
        Cart cart = this.cartRepository.findByUserId(user.getId()).orElseThrow(() -> new NotFondException("cart not found"));
        cart.getItems().forEach(line -> {
            OrderItem item = OrderItem.builder()
                    .variant(line.getProductVariant())
                    .product(line.getProduct())
                    .quantity(line.getQuantity())
                    .build();
            lines.add(item);
        });
        this.cartRepository.delete(cart);
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
        return orderMapper.toDto(order);
    }

//    @Override
//    public String createPayment(PaymentInfo paymentInfo) {
//
//        vnPay.setVnp_TmnCode(merchantCode);
//        vnPay.setVnp_Amount(paymentInfo.getAmount() * 100); // Chuyển đổi sang đơn vị VNĐ
//        vnPay.setVnp_Command("pay");
//        vnPay.setVnp_CreateDate(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
//        vnPay.setVnp_CurrCode("VND");
//        vnPay.setVnp_IpAddr(paymentInfo.getIpAddress());
//        vnPay.setVnp_Locale("vn");
//        vnPay.setVnp_OrderInfo(paymentInfo.getOrderInfo());
//        vnPay.setVnp_OrderType("other");
//        vnPay.setVnp_ReturnUrl(paymentInfo.getReturnUrl());
//        vnPay.setVnp_TxnRef(UUID.randomUUID().toString());
//
//        // Tính chữ ký và thêm vào VNPay
//        String secureHash = generateSecureHash(vnPay);
//        vnPay.setVnp_SecureHash(secureHash);
//
//        // Gọi API tạo thanh toán và nhận URL thanh toán
//        String paymentUrl = vnpayApiUrl + "?" + vnPay.buildQuery();
//
//        return paymentUrl;
//    }
//
//    @Override
//    public void handlePaymentCallback(String callbackData) {
//
//    }
}
