package com.yody.Server.api.client;

import com.yody.Server.entities.Product;
import com.yody.Server.entities.ProductVariant;
import com.yody.Server.service.IProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/v1/product")
public class ProductController {
    private final IProductService productService;
    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public List<Product> getAll(){
        return this.productService.getAllProduct();
    }
    @GetMapping("/{id}")
    public Product getProductById(@PathVariable Long id){
        return this.productService.getProductById(id);
    }

    @GetMapping("/{id}/variants")
    public List<ProductVariant> getProductVariantByProductId(@PathVariable Long id){
        return this.productService.getVariantsByProductId(id);
    }


}
