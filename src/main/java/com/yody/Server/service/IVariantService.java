package com.yody.Server.service;

import com.yody.Server.dto.variant.VariantResDTO;

public interface IVariantService {
    VariantResDTO findById(Long id);
}
