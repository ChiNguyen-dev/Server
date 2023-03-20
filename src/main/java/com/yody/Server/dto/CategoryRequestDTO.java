package com.yody.Server.dto;

import lombok.Data;

@Data
public class CategoryRequestDTO extends AbstractDTO<CategoryDTO> {
    private String name;
    private String parentId;
}
