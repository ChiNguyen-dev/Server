package com.yody.Server.service.impl;

import com.yody.Server.components.CategoryMapper;
import com.yody.Server.dto.CategoryDTO;
import com.yody.Server.entities.Category;
import com.yody.Server.repositories.CategoryRepository;
import com.yody.Server.service.ICategoryService;
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
    public CategoryDTO addCategory(CategoryDTO categoryDTO) {
        Category category = this.categoryRepository.save(this.categoryMapper.toEntity(categoryDTO));
        return this.categoryMapper.toDto(category);
    }


}
