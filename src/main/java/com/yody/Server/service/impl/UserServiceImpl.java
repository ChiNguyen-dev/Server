package com.yody.Server.service.impl;

import com.yody.Server.dto.UserDTO;
import com.yody.Server.dto.UserRegisterRequest;
import com.yody.Server.entities.RoleEntity;
import com.yody.Server.entities.UserEntity;
import com.yody.Server.components.MapperComponent;
import com.yody.Server.exception.NotFondException;
import com.yody.Server.repositories.RoleRepo;
import com.yody.Server.repositories.UserRepo;
import com.yody.Server.service.IUserService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional
public class UserServiceImpl implements IUserService {

    private final UserRepo userRepo;

    private final RoleRepo roleRepo;

    private final MapperComponent mapperComponent;

    @Override
    public List<UserDTO> getUsers() {
        return this.userRepo.findAll().stream().map(mapperComponent::toDto).collect(Collectors.toList());
    }

    @Override
    public UserDTO getUser(Long id) {
         UserEntity user = this.userRepo.findById(id).orElseThrow( () -> new NotFondException("user doesn't exist"));
        return mapperComponent.toDto(user);
    }


    @Override
    public UserDTO addRoleToUser(Long id, String roleName) {
        UserEntity userEntity = this.userRepo.findById(id).orElseThrow(() -> new NotFondException("user does not exits"));
        RoleEntity roleEntity = this.roleRepo.findByName(roleName);
        userEntity.getRoles().add(roleEntity);
        return this.mapperComponent.toDto(this.userRepo.save(userEntity));
    }

    @Override
    public UserDTO saveUser(UserRegisterRequest userRegisterRequest) {
        UserEntity userInserted = this.userRepo.save(this.mapperComponent.toEntity(userRegisterRequest));
        UserDTO data = this.mapperComponent.toDto(userInserted);
        return data;
    }
}
