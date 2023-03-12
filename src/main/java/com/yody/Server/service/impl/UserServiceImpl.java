package com.yody.Server.service.impl;

import com.yody.Server.dto.UserDTO;
import com.yody.Server.entities.RoleEntity;
import com.yody.Server.entities.UserEntity;
import com.yody.Server.components.MapperComponent;
import com.yody.Server.repositories.RoleRepo;
import com.yody.Server.repositories.UserRepo;
import com.yody.Server.service.IUserService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
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
    public Optional<UserDTO> getUser(Long id) {
        Optional<UserEntity> userEntity = this.userRepo.findById(id);
        return userEntity.map(mapperComponent::toDto);
    }


    @Override
    public UserDTO addRoleToUser(String email, String roleName) {
        UserEntity userEntity = this.userRepo.findByEmail(email);
        RoleEntity roleEntity = this.roleRepo.findByName(roleName);
        userEntity.getRoles().add(roleEntity);
        return this.mapperComponent.toDto(this.userRepo.save(userEntity));
    }

    @Override
    public UserDTO saveUser(UserDTO userDTO) {
        UserEntity userInserted = this.userRepo.save(this.mapperComponent.toEntity(userDTO));
        UserDTO data = this.mapperComponent.toDto(userInserted);
        data.setPassword(null);
        return data;
    }
}
