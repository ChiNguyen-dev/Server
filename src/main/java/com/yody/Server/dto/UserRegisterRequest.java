package com.yody.Server.dto;

import java.util.HashSet;
import java.util.Set;

public class UserRegisterRequest extends AbstractDTO{
    private String fullName;
    private String email;
    private String password;
    private Set<RoleDTO> roleDTOS = new HashSet<>();
}
