package com.yody.Server.api.admin;

import com.yody.Server.dto.DataProductReqDTO;
import com.yody.Server.dto.ProductResAdminDTO;
import com.yody.Server.entities.Product;
import com.yody.Server.service.IProductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/admin/products")
@Slf4j
public class AdminProductAPI {
    public final IProductService productService;

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public List<ProductResAdminDTO> getProducts() {
        return this.productService.getAllProduct();
    }

    @GetMapping("/{id}")
    public ProductResAdminDTO getProductById(@PathVariable Long id) {
        return this.productService.getProductById(id);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ProductResAdminDTO addProduct(@RequestBody DataProductReqDTO dataProductReqDTO) {
        log.info(dataProductReqDTO.getProduct().toString());
        log.info(dataProductReqDTO.getProductVariants().toString());
        log.info(dataProductReqDTO.getImages().toString());
        return this.productService.addProduct(dataProductReqDTO);
    }
}
