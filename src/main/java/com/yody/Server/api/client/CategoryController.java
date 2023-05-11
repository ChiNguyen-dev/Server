package com.yody.Server.api.client;

import com.yody.Server.dto.category.CategoryDTO;
import com.yody.Server.service.ICategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/v1/categories")
public class CategoryController {
    private final ICategoryService categoryService;
    @GetMapping("/{slug}")
    public List<CategoryDTO> getSubCategoryBySlug(@PathVariable String slug){
        return this.categoryService.getSubCategoryBySlug(slug);
    }
}
