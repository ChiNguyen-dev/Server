package com.yody.Server.service.impl;

//import com.yody.Server.config.JwtComponent;
import com.yody.Server.config.JwtService;
import com.yody.Server.dto.UserDTO;
import com.yody.Server.dto.UserRegisterRequest;
import com.yody.Server.entities.Role;
import com.yody.Server.entities.User;
import com.yody.Server.components.MapperComponent;
import com.yody.Server.exception.NotFondException;
import com.yody.Server.repositories.RoleRepo;
import com.yody.Server.repositories.UserRepo;
import com.yody.Server.service.IUserService;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
@Transactional
@Slf4j
public class UserServiceImpl implements IUserService {
    private final AuthenticationManager authenticationManager ;
    private final UserRepo userRepo;
    private final  JwtService jwtService;
    private final RoleRepo roleRepo;

    private final MapperComponent mapperComponent;

    @Override
    public List<UserDTO> getUsers() {
        return this.userRepo.findAll().stream().map(mapperComponent::toDto).collect(Collectors.toList());
    }

    @Override
    public UserDTO getUser(Long id) {
         User user = this.userRepo.findById(id).orElseThrow( () -> new NotFondException("user doesn't exist"));
        return mapperComponent.toDto(user);
    }


    @Override
    public UserDTO addRoleToUser(Long id, String roleName) {
        User user = this.userRepo.findById(id).orElseThrow(() -> new NotFondException("user does not exits"));
        Role role = this.roleRepo.findByName(roleName);
        user.getRoles().add(role);
        return this.mapperComponent.toDto(this.userRepo.save(user));
    }

    @Override
    public UserDTO saveUser(UserRegisterRequest userRegisterRequest) {
        User userInserted = this.userRepo.save(this.mapperComponent.toEntity(userRegisterRequest));
        return this.mapperComponent.toDto(userInserted);
    }

    @Override
    public String authentication(String email, String password) {
        Authentication authentication= authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        email,
                        password
                )
        );
       var user = this.userRepo.findByEmail(email).orElseThrow(() -> new NotFondException("not found"));
        return jwtService.generateToken(user);
    }


}
