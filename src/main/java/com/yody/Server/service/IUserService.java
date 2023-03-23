package com.yody.Server.service;

import com.yody.Server.dto.AuthenticationRequest;
import com.yody.Server.dto.AuthenticationResponse;
import com.yody.Server.dto.UserDTO;
import com.yody.Server.dto.UserRegisterRequest;

import java.util.List;

public interface IUserService {

    List<UserDTO> getUsers();

    UserDTO getUser(Long id);

    UserDTO addRoleToUser(Long id, String roleName);

    UserDTO saveUser(UserRegisterRequest userRegisterRequest);
    AuthenticationResponse authentication(AuthenticationRequest authenticationRequest);
}
