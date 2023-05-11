package com.yody.Server.dto.category;

import com.yody.Server.dto.AbstractDTO;
import lombok.Data;

@Data
public class CategoryDTO extends AbstractDTO<CategoryDTO> {
    private String name;
    private String slug;
    private Integer parentId;
    private String parentName = "";
}
