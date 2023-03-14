package com.yody.Server.components;

import com.yody.Server.dto.RoleDTO;
import com.yody.Server.dto.UserDTO;
import com.yody.Server.dto.UserRegisterRequest;
import com.yody.Server.entities.User;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import java.util.Set;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class MapperComponent {
    private final ModelMapper modelMapper;

    public UserDTO toDto(User user) {
        Set<RoleDTO> roleDTOS = user.getRoles().stream()
                .map(RoleEntity -> modelMapper.map(RoleEntity, RoleDTO.class))
                .collect(Collectors.toSet());
        UserDTO userDto = this.modelMapper.map(user, UserDTO.class);
        userDto.setRoleDTOS(roleDTOS);
        return userDto;
    }

    public User toEntity(UserRegisterRequest userRegisterRequest) {
        return this.modelMapper.map(userRegisterRequest, User.class);
    }
}
