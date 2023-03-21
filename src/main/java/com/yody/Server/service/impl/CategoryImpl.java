package com.yody.Server.service.impl;

import com.yody.Server.components.CategoryMapper;
import com.yody.Server.dto.CategoryDTO;
import com.yody.Server.dto.CategoryRequestDTO;
import com.yody.Server.entities.Category;
import com.yody.Server.exception.NotFondException;
import com.yody.Server.repositories.CategoryRepository;
import com.yody.Server.service.ICategoryService;
import com.yody.Server.utils.GenerateSlug;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
@Transactional
public class CategoryImpl implements ICategoryService {

    public final CategoryRepository categoryRepository;

    private final CategoryMapper categoryMapper;

    @Override
    public List<CategoryDTO> getCategories() {
        return this.categoryRepository.findAll().stream().map(categoryMapper::toDto).collect(Collectors.toList());
    }

    @Override
    public CategoryDTO getCategoryById(Long id) {
        Category category = this.categoryRepository.findById(id).orElseThrow(() -> new NotFondException("Category Not Found By Id: " + id));
        return this.categoryMapper.toDto(category);
    }

    @Override
    public CategoryDTO addCategory(CategoryRequestDTO categoryRequestDTO) {
        Category categoryEntity = Category.builder()
                .name(categoryRequestDTO.getName())
                .parentId(categoryRequestDTO.getParentId())
                .slug(GenerateSlug.toSlug(categoryRequestDTO.getName()))
                .build();
        System.out.println();
        return this.categoryMapper.toDto(this.categoryRepository.save(categoryEntity));
    }

    @Override
    public CategoryDTO update(Long id, CategoryRequestDTO categoryRequestDTO) {
        Category categoryEntity = Category.builder()
                .name(categoryRequestDTO.getName())
                .parentId(categoryRequestDTO.getParentId())
                .slug(GenerateSlug.toSlug(categoryRequestDTO.getName()))
                .build();
        System.out.println();
        Category updatedCategory = this.categoryRepository.findById(id).map(caterory -> {
            caterory.setName(categoryEntity.getName());
            caterory.setSlug(categoryEntity.getSlug());
            caterory.setParentId(categoryEntity.getParentId());
            return this.categoryRepository.save(caterory);
        }).orElseThrow(() -> new NotFondException("Category Not Found By Id: " + id));
        return this.categoryMapper.toDto(updatedCategory);
    }

    @Override
    public boolean delete(Long id) {
        boolean exists = this.categoryRepository.existsById(id);
        if (exists) {
            this.categoryRepository.deleteById(id);
            return true;
        }
        return false;
    }
}
