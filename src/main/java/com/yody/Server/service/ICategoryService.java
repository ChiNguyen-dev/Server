package com.yody.Server.service;

import com.yody.Server.dto.category.CategoryAdminResDTO;
import com.yody.Server.dto.category.CategoryAdminReqDTO;

import java.util.List;

public interface ICategoryService {

     List<CategoryAdminResDTO> getCategories();

     CategoryAdminResDTO getCategoryById(Long id);

     CategoryAdminResDTO addCategory(CategoryAdminReqDTO categoryRequestDTO);

     CategoryAdminResDTO update(Long id, CategoryAdminReqDTO categoryRequestDTO);

     boolean delete(Long id);

     List<CategoryAdminResDTO> getSubCategoryBySlug(String slug);
}
