package com.yody.Server.dto.category;

import com.yody.Server.dto.AbstractDTO;
import lombok.Data;

@Data
public class CategoryResDTO extends AbstractDTO<CategoryResDTO> {
    private String name;
    private String slug;
    private Integer parentId;
}
