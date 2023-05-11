package com.yody.Server.dto.order;

import com.yody.Server.dto.AbstractDTO;
import com.yody.Server.entities.ProductVariant;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LineItemResponse extends AbstractDTO {
    private ProductVariant variant;
    private int quantity;
}
