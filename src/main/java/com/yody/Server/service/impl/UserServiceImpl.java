package com.yody.Server.service.impl;

//import com.yody.Server.config.JwtComponent;
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
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
@Transactional
public class UserServiceImpl implements IUserService {
//    private final AuthenticationManager authenticationManager ;
//    private final CustomerUserDetailsService customerUserDetailsService;
//    private final JwtComponent jwt;
    private final UserRepo userRepo;

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
        UserDTO data = this.mapperComponent.toDto(userInserted);
        return data;
    }

//    @Override
//    public String authentication(String email, String password) {
//        Authentication authentication= authenticationManager.authenticate(
//                new UsernamePasswordAuthenticationToken(
//                        email,
//                        password
//                )
//        );
//        SecurityContextHolder.getContext().setAuthentication(authentication);
//        User user = (User) this.customerUserDetailsService.loadUserByUsername(email);
//        List<String> rolesNames = new ArrayList<>();
//        user.getRoles().forEach(r-> rolesNames.add(r.getName()));
//        String token = jwt.generateToken(user.getUsername(),rolesNames);
//        return token;
//    }


}
