package com.yody.Server.service;

import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import com.yody.Server.config.PaypalPaymentIntent;
import com.yody.Server.config.PaypalPaymentMethod;
import com.yody.Server.dto.order.PaymentInfo;
import com.yody.Server.dto.order.PlaceOrderRequest;
import com.yody.Server.dto.order.PlaceOrderResponse;

public interface IOrderService {
    PlaceOrderResponse placeOrder(PlaceOrderRequest orderDTO);
    public Payment createPayment(
            Double total,
            String currency,
            PaypalPaymentMethod method,
            PaypalPaymentIntent intent,
            String description,
            String cancelUrl,
            String successUrl) throws PayPalRESTException;
    public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException;
}
