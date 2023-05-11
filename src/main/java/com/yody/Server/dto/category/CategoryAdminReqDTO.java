package com.yody.Server.dto.category;

import com.yody.Server.dto.AbstractDTO;
import lombok.Data;

@Data
public class CategoryAdminReqDTO extends AbstractDTO<CategoryAdminResDTO> {
    private String name;
    private Integer parentId;
}
