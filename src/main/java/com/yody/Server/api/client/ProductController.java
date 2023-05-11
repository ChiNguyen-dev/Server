package com.yody.Server.api.client;

import com.yody.Server.dto.product.ProductResAdminDTO;
import com.yody.Server.dto.product.SearchDataDTO;
import com.yody.Server.dto.variant.VariantResDTO;
import com.yody.Server.entities.ProductVariant;
import com.yody.Server.service.IProductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("api/v1/products")
public class ProductController {
    private final IProductService productService;

    @GetMapping("/category/{slug}")
    public List<ProductResAdminDTO> getProductByCategorySlug(@PathVariable String slug) {
        return this.productService.getProductByCategorySlug(slug);
    }

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public List<ProductResAdminDTO> getAll() {
        return this.productService.getAllProduct();
    }

    @GetMapping("/{id}")
    public ProductResAdminDTO getProductById(@PathVariable Long id) {
        return this.productService.getProductById(id);
    }

    @GetMapping("/{id}/variants")
    public List<ProductVariant> getProductVariantByProductId(@PathVariable Long id) {
        return this.productService.getVariantsByProductId(id);
    }

    @GetMapping("/{categoryId}/category")
    public List<ProductResAdminDTO> getProductByCategoryId(@PathVariable Long categoryId) {
        return this.productService.getProductByCategoryId(categoryId);
    }

    @GetMapping("/search")
    public List<ProductResAdminDTO> getProductByFilter(@RequestParam(required = false) List<String> slugs,
                                                       @RequestParam(required = false) List<String> sizes,
                                                       @RequestParam(required = false) List<String> colors,
                                                       @RequestParam(defaultValue = "0") int page,
                                                       @RequestParam(defaultValue = "default") String sortType) {
        return this.productService.getProductByFilter(slugs, sizes, colors, page, sortType);
    }

    @PostMapping("/search-by-name")
    public List<VariantResDTO> searchByName(@RequestBody SearchDataDTO request) {
        return this.productService.searchByName(request.getName());
    }
}
