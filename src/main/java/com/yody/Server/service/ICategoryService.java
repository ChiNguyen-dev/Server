package com.yody.Server.service;

import com.yody.Server.dto.CategoryDTO;
import com.yody.Server.dto.CategoryReqDTO;

import java.util.List;

public interface ICategoryService {

     List<CategoryDTO> getCategories();

     CategoryDTO getCategoryById(Long id);

     CategoryDTO addCategory(CategoryReqDTO categoryRequestDTO);

     CategoryDTO update(Long id, CategoryReqDTO categoryRequestDTO);

     boolean delete(Long id);

     List<CategoryDTO> getSubCategoryBySlug(String slug);
}
