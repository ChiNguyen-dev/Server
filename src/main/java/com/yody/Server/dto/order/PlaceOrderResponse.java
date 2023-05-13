package com.yody.Server.dto.order;

import com.yody.Server.dto.AbstractDTO;
import com.yody.Server.dto.user.UserDTO;
import lombok.Data;

import java.util.List;

@Data
public class PlaceOrderResponse extends AbstractDTO {
    private UserDTO user;
    private String paymentType;
    private String orderUsername;
    private String phone;
    private String note;
    private String address;
    private List<LineItemResponse> items;
}
