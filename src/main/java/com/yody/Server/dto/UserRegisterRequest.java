package com.yody.Server.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.HashSet;
import java.util.Set;
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UserRegisterRequest extends AbstractDTO<UserRegisterRequest>{
    private String fullName;
    private String email;
    private String password;
    private Set<RoleDTO> roles = new HashSet<>();
}
