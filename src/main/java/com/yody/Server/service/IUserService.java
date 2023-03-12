package com.yody.Server.service;

import com.yody.Server.dto.UserDTO;
import com.yody.Server.entities.UserEntity;

import java.util.List;
import java.util.Optional;

public interface IUserService {

    List<UserDTO> getUsers();

    Optional<UserDTO> getUser(Long id);

    UserDTO addRoleToUser(String email, String roleName);

    UserDTO saveUser(UserDTO userDTO);
}
