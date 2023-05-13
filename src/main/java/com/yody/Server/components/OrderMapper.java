package com.yody.Server.components;

import com.yody.Server.dto.order.LineItemResponse;
import com.yody.Server.dto.order.PlaceOrderResponse;
import com.yody.Server.entities.Order;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class OrderMapper {
    public final ModelMapper modelMapper;
    public PlaceOrderResponse toDto(Order order){
        List<LineItemResponse> lines = order.getOrderItems().stream().map(line -> modelMapper.map(line, LineItemResponse.class)).toList();
        PlaceOrderResponse orderDTO = modelMapper.map(order, PlaceOrderResponse.class);
        orderDTO.setItems(lines);
        return orderDTO;
    }
}
