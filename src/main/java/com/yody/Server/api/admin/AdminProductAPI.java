package com.yody.Server.api.admin;

import com.yody.Server.dto.DataProductReqDTO;
import com.yody.Server.dto.ProductResAdminDTO;
import com.yody.Server.entities.Product;
import com.yody.Server.service.IProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/admin/products")
public class AdminProductAPI {

    public final IProductService iProductService;

    @GetMapping
    public List<Product> getProducts() {
        return this.iProductService.getAllProduct();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ProductResAdminDTO addProduct(@RequestBody DataProductReqDTO dataProductReqDTO) {
        return this.iProductService.addProduct(dataProductReqDTO);
    }
}
