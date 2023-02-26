package com.yody.Server.dto;

import lombok.Data;

import java.util.HashSet;
import java.util.Set;

@Data
public class RoleDTO extends AbstractDTO<RoleDTO> {

    private String name;

    private Set<UserDTO> userDtos = new HashSet<>();
}
