package com.yody.Server.service;

import com.yody.Server.dto.CategoryDTO;

import java.util.List;

public interface ICategoryService {

     List<CategoryDTO> getCategories();

     CategoryDTO getCategoryById(Long id);

     CategoryDTO addCategory(CategoryDTO categoryDTO);

     CategoryDTO update(Long id, CategoryDTO categoryDTO);
}
