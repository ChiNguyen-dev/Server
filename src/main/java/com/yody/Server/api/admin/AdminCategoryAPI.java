package com.yody.Server.api.admin;

import com.yody.Server.dto.CategoryDTO;
import com.yody.Server.dto.CategoryReqDTO;
import com.yody.Server.service.ICategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
    public CategoryDTO addCategory(@RequestBody CategoryReqDTO categoryRequestDTO) {
        return this.iCategoryService.addCategory(categoryRequestDTO);
    }

    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public CategoryDTO update(@RequestBody CategoryReqDTO categoryRequestDTO, @PathVariable Long id) {
        return this.iCategoryService.update(id, categoryRequestDTO);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        this.iCategoryService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
