package com.yody.Server.dto;

import lombok.Data;

import java.util.HashSet;
import java.util.Set;

@Data
public class UserDTO extends AbstractDTO<UserDTO> {
    private String fullName;
    private String email;
    private Set<RoleDTO> role = new HashSet<>();
}
