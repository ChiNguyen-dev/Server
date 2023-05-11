package com.yody.Server.service.impl;

import com.yody.Server.components.VariantMapper;
import com.yody.Server.dto.variant.VariantResDTO;
import com.yody.Server.entities.ProductVariant;
import com.yody.Server.exception.NotFondException;
import com.yody.Server.repositories.ProductVariantRepository;
import com.yody.Server.service.IVariantService;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
@Transactional
@Slf4j
public class VariantServiceImpl implements IVariantService {
    private final ProductVariantRepository variantRepository;
    private final VariantMapper variantMapper;

    @Override
    public VariantResDTO findById(Long id) {
        ProductVariant productVariant = this.variantRepository.findById(id)
                .orElseThrow(() -> new NotFondException("Variant not isExist in Database"));
        return this.variantMapper.toVariantResDTO(productVariant);
    }
}
