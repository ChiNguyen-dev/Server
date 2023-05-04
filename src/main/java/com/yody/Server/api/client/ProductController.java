package com.yody.Server.api.client;

import com.yody.Server.dto.ProductResAdminDTO;
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
    public List<ProductResAdminDTO> getAll(){
        return this.productService.getAllProduct();
    }
    @GetMapping("/{id}")
    public ProductResAdminDTO getProductById(@PathVariable Long id){
        return this.productService.getProductById(id);
    }

    @GetMapping("/{id}/variants")
    public List<ProductVariant> getProductVariantByProductId(@PathVariable Long id){
        return this.productService.getVariantsByProductId(id);
    }
    @GetMapping("/{cateId}")
    public List<Product> getProductByCategoryId(@PathVariable Long cateId){
        return this.productService.getProductByCategoryId(cateId);
    }
    @GetMapping("/search")
    public List<Product> getProductByFilter(@RequestParam(required = false) Long cateId,
                                            @RequestParam(required = false) String size,
                                            @RequestParam(required = false) String color,
                                            @RequestParam(defaultValue = "0") int page,
                                            @RequestParam(defaultValue = "default") String sortType){
        return this.productService.getProductByFilter(cateId,size,color,page, sortType);
    }

}
