package com.yody.Server.service.impl;


import com.yody.Server.components.CategoryMapper;
import com.yody.Server.dto.category.CategoryAdminResDTO;
import com.yody.Server.dto.category.CategoryAdminReqDTO;
import com.yody.Server.dto.category.CategoryResDTO;
import com.yody.Server.entities.Category;
import com.yody.Server.service.impl.exception.NotFondException;
import com.yody.Server.repositories.CategoryRepository;
import com.yody.Server.service.ICategoryService;
import com.yody.Server.utils.GenerateSlug;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
@Transactional
public class CategoryServiceImpl implements ICategoryService {

    private final CategoryRepository categoryRepository;
    private final CategoryMapper categoryMapper;
    private final ModelMapper modelMapper;

    @Override
    public List<CategoryAdminResDTO> getCategories() {
        List<CategoryAdminResDTO> categories = this.categoryRepository
                .findAll()
                .stream()
                .map(categoryMapper::toDto)
                .collect(Collectors.toList());
        for (CategoryAdminResDTO item : categories) {
            if (item.getParentId() != 0) {
                for (CategoryAdminResDTO child : categories)
                    if (Long.valueOf(item.getParentId()).equals(child.getId())) item.setParentName(child.getName());
            } else {
                item.setParentName("Root");
            }
        }
        return categories;
    }

    @Override
    public CategoryAdminResDTO getCategoryById(Long id) {
        Category category = this.categoryRepository.findById(id)
                .orElseThrow(() -> new NotFondException("Category Not Found By Id: " + id));
        return this.categoryMapper.toDto(category);
    }

    @Override
    public List<CategoryResDTO> getSubCategoryByCateId(Long id) {
        Category category = this.categoryRepository.findById(id)
                .orElseThrow(() -> new NotFondException("Category Not Found By Id: " + id));
        return this.recursiveChildrenCategory(new ArrayList<>(), category)
                .stream()
                .map(category1 -> this.modelMapper.map(category1, CategoryResDTO.class))
                .toList();
    }

    public List<Category> recursiveChildrenCategory(List<Category> categories, Category category) {
        List<Category> cateChildren = this.categoryRepository.findByParentId(category.getId());
        if (!cateChildren.isEmpty()) {
            categories.addAll(cateChildren);
            cateChildren.forEach(item -> {
                List<Category> subCate = this.categoryRepository.findByParentId(item.getId());
                if (!subCate.isEmpty()) this.recursiveChildrenCategory(categories, item);
            });
        }
        return categories;
    }

    @Override
    public CategoryAdminResDTO addCategory(CategoryAdminReqDTO categoryRequestDTO) {
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
    public CategoryAdminResDTO update(Long id, CategoryAdminReqDTO categoryRequestDTO) {
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
        if (exists) this.categoryRepository.deleteById(id);
        return exists;
    }
}
