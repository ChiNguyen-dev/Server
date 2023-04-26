package com.yody.Server.service.impl;


import com.yody.Server.components.CategoryMapper;
import com.yody.Server.dto.CategoryDTO;
import com.yody.Server.dto.CategoryReqDTO;
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
public class CategoryServiceImpl implements ICategoryService {

    private final CategoryRepository categoryRepository;

    private final CategoryMapper categoryMapper;

    @Override
    public List<CategoryDTO> getCategories() {
        List<CategoryDTO> categories = this.categoryRepository
                .findAll()
                .stream()
                .map(categoryMapper::toDto)
                .collect(Collectors.toList());
        for (CategoryDTO item : categories) {
            if (item.getParentId() != 0) {
                for (CategoryDTO child : categories)
                    if (Long.valueOf(item.getParentId()).equals(child.getId())) item.setParentName(child.getName());
            } else {
                item.setParentName("Root");
            }
        }
        return categories;
    }

    @Override
    public CategoryDTO getCategoryById(Long id) {
        Category category = this.categoryRepository.findById(id).orElseThrow(() -> new NotFondException("Category Not Found By Id: " + id));
        return this.categoryMapper.toDto(category);
    }

    @Override
    public CategoryDTO addCategory(CategoryReqDTO categoryRequestDTO) {
        Category category = this.categoryRepository.save(
                Category.builder()
                        .name(categoryRequestDTO.getName())
                        .parentId(categoryRequestDTO.getParentId())
                        .slug(GenerateSlug.toSlug(categoryRequestDTO.getName()))
                        .build()
        );
        return this.categoryMapper.toDto(category);
    }

    @Override
    public CategoryDTO update(Long id, CategoryReqDTO categoryRequestDTO) {
        Category categoryEntity = Category.builder()
                .name(categoryRequestDTO.getName())
                .parentId(categoryRequestDTO.getParentId())
                .slug(GenerateSlug.toSlug(categoryRequestDTO.getName()))
                .build();
        Category updatedCategory = this.categoryRepository.findById(id).map(category -> {
            category.setName(categoryEntity.getName());
            category.setSlug(categoryEntity.getSlug());
            category.setParentId(categoryEntity.getParentId());
            return this.categoryRepository.save(category);
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
