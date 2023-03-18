package com.yody.Server.service;

import com.yody.Server.dto.CategoryDTO;

import java.util.List;

public interface ICategoryService {

     List<CategoryDTO> getCategories();

     CategoryDTO addCategory(CategoryDTO categoryDTO);
}
