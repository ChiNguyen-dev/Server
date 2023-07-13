package com.yody.Server.service.impl;

import com.yody.Server.components.ProductMapper;
import com.yody.Server.components.VariantMapper;
import com.yody.Server.dto.product.ProductResAdminDTO;
import com.yody.Server.entities.ProductVariant;
import com.yody.Server.service.impl.exception.NotFondException;
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
    private final ProductMapper productMapper;
    private final VariantMapper variantMapper;

    @Override
    public ProductResAdminDTO findById(Long id) {
        ProductVariant productVariant = this.variantRepository.findById(id)
                .orElseThrow(() -> new NotFondException("Variant not isExist in Database"));
        return this.productMapper.toDto(productVariant.getProduct());
    }
}
