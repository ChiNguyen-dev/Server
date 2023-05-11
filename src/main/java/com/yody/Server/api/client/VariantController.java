package com.yody.Server.api.client;

import com.yody.Server.dto.product.ProductResAdminDTO;
import com.yody.Server.service.IVariantService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
@RequestMapping("/api/v1/variants")
public class VariantController {
    private final IVariantService variantService;

    @GetMapping("/{id}")
    public ProductResAdminDTO getVariant(@PathVariable Long id) {
        return this.variantService.findById(id);
    }
}
