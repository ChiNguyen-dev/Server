package com.yody.Server.dto.user;

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
public class UserRegisterRequest{
    private String fullName;
    private String email;
    private String password;
}
