package com.yody.Server.service;

import com.yody.Server.dto.product.ProductResAdminDTO;
import com.yody.Server.dto.variant.VariantResDTO;

public interface IVariantService {
    ProductResAdminDTO findById(Long id);
}
