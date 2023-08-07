package com.yody.Server.dto.order;

import lombok.Data;

@Data
public class PaymentInfo {
    private double amount;
    private String orderInfo;
    private String ipAddress;
    private String returnUrl;
}
