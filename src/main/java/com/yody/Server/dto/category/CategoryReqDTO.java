package com.yody.Server.dto.category;

import com.yody.Server.dto.AbstractDTO;
import com.yody.Server.dto.category.CategoryDTO;
import lombok.Data;

@Data
public class CategoryReqDTO extends AbstractDTO<CategoryDTO> {
    private String name;
    private Integer parentId;
}
