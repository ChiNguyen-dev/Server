package com.yody.Server.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.HashSet;
import java.util.Set;

@Data
public class UserDTO extends AbstractDTO<UserDTO> {
    private String fullName;
    private String email;
    private String password;
    private Set<RoleDTO> roleDTOS = new HashSet<>();
}
