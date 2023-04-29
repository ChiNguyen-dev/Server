package com.yody.Server.dto.order;

import com.yody.Server.dto.AbstractDTO;
import com.yody.Server.dto.UserDTO;
import lombok.Data;

import java.util.List;

@Data
public class PlaceOrderResponse extends AbstractDTO {
    private UserDTO user;
    private String address;
    private List<LineItemResponse> lineItems;
}
