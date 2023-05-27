package com.yody.Server.api.admin;

import com.yody.Server.dto.category.CategoryAdminResDTO;
import com.yody.Server.dto.category.CategoryAdminReqDTO;
import com.yody.Server.service.ICategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/auth/admin/categories")
public class AdminCategoryAPI {

    public final ICategoryService iCategoryService;

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public List<CategoryAdminResDTO> getCategories() {
        return this.iCategoryService.getCategories();
    }

    @GetMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public CategoryAdminResDTO getCategoryById(@PathVariable Long id) {
        return this.iCategoryService.getCategoryById(id);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public CategoryAdminResDTO addCategory(@RequestBody CategoryAdminReqDTO categoryRequestDTO) {
        return this.iCategoryService.addCategory(categoryRequestDTO);
    }

    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public CategoryAdminResDTO update(@RequestBody CategoryAdminReqDTO categoryRequestDTO, @PathVariable Long id) {
        return this.iCategoryService.update(id, categoryRequestDTO);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        this.iCategoryService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
