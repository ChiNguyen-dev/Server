package com.yody.Server.dto.order;

import lombok.Data;

import java.util.List;

@Data
public class PlaceOrderRequest {
    private String email;
    private String paymentType;
    private String orderUsername;
    private String phone;
    private String note;
    private String address;
    private List<LineItemRequest> items;
}
