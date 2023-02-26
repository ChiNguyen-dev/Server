package com.yody.Server.components;

import com.yody.Server.dto.RoleDTO;
import com.yody.Server.dto.UserDTO;
import com.yody.Server.entities.UserEntity;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import java.util.Set;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class MapperComponent {
    private final ModelMapper modelMapper;

    public UserDTO toDto(UserEntity userEntity) {
        Set<RoleDTO> roleDTOS = userEntity.getRoles().stream()
                .map(RoleEntity -> modelMapper.map(RoleEntity, RoleDTO.class))
                .collect(Collectors.toSet());
        UserDTO userDto = this.modelMapper.map(userEntity, UserDTO.class);
        userDto.setRoleDTOS(roleDTOS);
        return userDto;
    }
}
