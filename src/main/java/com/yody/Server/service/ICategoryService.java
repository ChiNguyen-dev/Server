package com.yody.Server.service;

import com.yody.Server.dto.CategoryDTO;
import com.yody.Server.dto.CategoryRequestDTO;

import java.util.List;

public interface ICategoryService {

     List<CategoryDTO> getCategories();

     CategoryDTO getCategoryById(Long id);

     CategoryDTO addCategory(CategoryRequestDTO categoryRequestDTO);

     CategoryDTO update(Long id, CategoryRequestDTO categoryRequestDTO);

     boolean delete(Long id);
}
