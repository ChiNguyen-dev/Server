package com.yody.Server.api.admin;

import com.yody.Server.dto.CategoryDTO;
import com.yody.Server.service.ICategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/admin/categories")
public class AdminCategoryAPI {

    public final ICategoryService iCategoryService;
    @GetMapping
    public List<CategoryDTO> getCategories() {
        return this.iCategoryService.getCategories();
    }

    @GetMapping("/{id}")
    public CategoryDTO getCategoryById(@PathVariable Long id) {
        return this.iCategoryService.getCategoryById(id);
    }

    @PostMapping
    public CategoryDTO addCategory(@RequestBody CategoryDTO categoryDTO){
        return this.iCategoryService.addCategory(categoryDTO);
    }

    @PutMapping("/{id}")
    public CategoryDTO update(@RequestBody CategoryDTO categoryDTO, @PathVariable Long id){
        return this.iCategoryService.update(id, categoryDTO);
    }

}