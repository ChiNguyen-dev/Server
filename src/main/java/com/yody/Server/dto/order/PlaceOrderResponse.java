package com.yody.Server.dto.order;

import com.yody.Server.dto.AbstractDTO;
import com.yody.Server.dto.product.ProductResAdminDTO;
import com.yody.Server.dto.user.UserDTO;
import com.yody.Server.dto.variant.ProductVariantDTO;
import com.yody.Server.entities.ProductVariant;
import lombok.Data;

import java.util.List;

@Data
public class PlaceOrderResponse extends AbstractDTO {
    private String paymentType;
    private String orderUsername;
    private String phone;
    private String note;
    private String address;
    private List<LineItemResponse> items;
}
