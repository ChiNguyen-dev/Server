package com.yody.Server.dto.user;

import com.yody.Server.dto.AbstractDTO;
import lombok.Data;

@Data
public class RoleDTO extends AbstractDTO<RoleDTO> {

    private String name;
}
