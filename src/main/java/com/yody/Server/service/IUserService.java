package com.yody.Server.service;

import com.yody.Server.dto.AuthenticationRequest;
import com.yody.Server.dto.AuthenticationResponse;
import com.yody.Server.dto.user.UserDTO;
import com.yody.Server.dto.user.UserRegisterRequest;

import java.util.List;

public interface IUserService {

    List<UserDTO> getUsers();

    UserDTO getUser(Long id);

    UserDTO addRoleToUser(String email, String roleName);

    UserDTO saveUser(UserRegisterRequest userRegisterRequest);
    AuthenticationResponse authentication(AuthenticationRequest authenticationRequest);
    boolean validateEmail(String email);
}
