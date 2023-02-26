package com.yody.Server.service;

import com.yody.Server.dto.UserDTO;
import com.yody.Server.entities.UserEntity;

import java.util.List;

public interface IUserService {

    List<UserDTO> getUsers();

    UserDTO addRoleToUser(String email, String roleName);

    <S extends UserEntity> S save(S entity);
}
