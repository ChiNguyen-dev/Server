package com.yody.Server.api.client;

import com.yody.Server.dto.category.CategoryAdminResDTO;
import com.yody.Server.dto.category.CategoryResDTO;
import com.yody.Server.service.ICategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/v1/categories")
public class CategoryController {
    private final ICategoryService categoryService;

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public List<CategoryAdminResDTO> getCategories() {
        return this.categoryService.getCategories();
    }

    @GetMapping("/{id}/children")
    public List<CategoryResDTO> getSubCategoryByCateId(@PathVariable Long id) {
        return this.categoryService.getSubCategoryByCateId(id);
    }
}
