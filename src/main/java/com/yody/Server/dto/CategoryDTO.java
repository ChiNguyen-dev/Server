package com.yody.Server.dto;

import lombok.Data;

@Data
public class CategoryDTO extends AbstractDTO<CategoryDTO>{
    private String name;
    private String slug;
    private String parentId;
}
