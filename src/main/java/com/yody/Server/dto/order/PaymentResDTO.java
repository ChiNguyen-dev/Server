package com.yody.Server.dto.order;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Setter
@Getter
public class PaymentResDTO implements Serializable {
    private String status;
    private String message;
    private String URL;
}
