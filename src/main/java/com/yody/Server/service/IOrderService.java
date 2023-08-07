package com.yody.Server.service;

import com.yody.Server.dto.order.PaymentInfo;
import com.yody.Server.dto.order.PlaceOrderRequest;
import com.yody.Server.dto.order.PlaceOrderResponse;

public interface IOrderService {
    PlaceOrderResponse placeOrder(PlaceOrderRequest orderDTO);
//    String createPayment(PaymentInfo paymentInfo);
//    void handlePaymentCallback(String callbackData);
}
