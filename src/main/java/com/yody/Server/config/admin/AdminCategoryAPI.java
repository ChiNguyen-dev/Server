package com.yody.Server.config.admin;

import com.yody.Server.dto.CategoryDTO;
import com.yody.Server.service.ICategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/admin/categories")
public class AdminCategoryAPI {

    public final ICategoryService iCategoryService;
    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public List<CategoryDTO> getCategories() {
        return this.iCategoryService.getCategories();
    }

    @GetMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public CategoryDTO getCategoryById(@PathVariable Long id) {
        return this.iCategoryService.getCategoryById(id);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public CategoryDTO addCategory(@RequestBody CategoryDTO categoryDTO){
        return this.iCategoryService.addCategory(categoryDTO);
    }

    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public CategoryDTO update(@RequestBody CategoryDTO categoryDTO, @PathVariable Long id){
        return this.iCategoryService.update(id, categoryDTO);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public String delete(@PathVariable Long id){
        if(this.iCategoryService.delete(id))  return "Delete Category Successfully";
        return "Category not found";
    }
}
