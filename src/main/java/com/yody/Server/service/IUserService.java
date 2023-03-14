package com.yody.Server.service;

import com.yody.Server.dto.UserDTO;
import com.yody.Server.dto.UserRegisterRequest;
import com.yody.Server.entities.UserEntity;

import java.util.List;
import java.util.Optional;

public interface IUserService {

    List<UserDTO> getUsers();

    UserDTO getUser(Long id);

    UserDTO addRoleToUser(Long id, String roleName);

    UserDTO saveUser(UserRegisterRequest userRegisterRequest);
}
