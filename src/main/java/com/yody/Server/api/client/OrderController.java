package com.yody.Server.api.client;

import com.yody.Server.dto.order.PlaceOrderRequest;
import com.yody.Server.dto.order.PlaceOrderResponse;
import com.yody.Server.service.IOrderService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("api/v1/orders")
public class OrderController {
    private final IOrderService orderService;
    @PostMapping
    public PlaceOrderResponse placeOrder(@RequestBody PlaceOrderRequest orderDTO){
        return this.orderService.placeOrder(orderDTO);
    }
}
