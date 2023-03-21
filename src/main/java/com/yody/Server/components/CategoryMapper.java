package com.yody.Server.components;

import com.yody.Server.dto.CategoryDTO;
import com.yody.Server.dto.CategoryRequestDTO;
import com.yody.Server.entities.Category;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class CategoryMapper {
    private final ModelMapper modelMapper;

    public CategoryDTO toDto(Category category){
       return this.modelMapper.map(category, CategoryDTO.class);
    }

    public Category toEntity(CategoryRequestDTO categoryDTO) {
        return this.modelMapper.map(categoryDTO, Category.class);
    }
}
