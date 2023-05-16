package com.yody.Server.components;

import com.yody.Server.dto.category.CategoryAdminResDTO;
import com.yody.Server.dto.category.CategoryAdminReqDTO;
import com.yody.Server.entities.Category;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class CategoryMapper {
    private final ModelMapper modelMapper;

    public CategoryAdminResDTO toDto(Category category) {
        return this.modelMapper.map(category, CategoryAdminResDTO.class);
    }

    public Category toEntity(CategoryAdminReqDTO categoryDTO) {
        return this.modelMapper.map(categoryDTO, Category.class);
    }

}
