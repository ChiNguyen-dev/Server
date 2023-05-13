package com.yody.Server.dto.product;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class ShowPageDTO {
    private int totalPages;
    private long totalElements;
    private List<ProductResAdminDTO> products;
}
