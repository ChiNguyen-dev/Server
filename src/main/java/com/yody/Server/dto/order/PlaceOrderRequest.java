package com.yody.Server.dto.order;

import lombok.Data;

import java.util.List;

@Data
public class PlaceOrderRequest {
    private Long userId;
    private String address;
    private List<LineItemRequest> lineItems;
}
