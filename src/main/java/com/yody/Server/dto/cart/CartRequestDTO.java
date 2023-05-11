package com.yody.Server.dto.shopping;

import com.yody.Server.dto.variant.ShoppingVariantDTO;
import lombok.Data;

import java.util.List;

@Data
public class ShoppingFormReqDTO {
    private String email;
    private List<ShoppingVariantDTO> variants;
}
