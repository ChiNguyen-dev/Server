package com.yody.Server.dto.order;

import lombok.Data;

@Data
public class LineItemRequest {
    private Long variantId;
    private int quantity;
}
