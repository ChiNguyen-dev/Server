package com.yody.Server.api.admin;

import com.yody.Server.dto.UserDTO;
import com.yody.Server.dto.UserRegisterRequest;
import com.yody.Server.service.IUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/admin/users")
public class AdminUserAPI {

    private final IUserService IUserService;

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public List<UserDTO> getAllUsers() {
        return this.IUserService.getUsers();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public UserDTO addUser(@RequestBody UserRegisterRequest userRegisterRequest) {
        return this.IUserService.saveUser(userRegisterRequest);
    }

    @GetMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public UserDTO getUser(@PathVariable Long id) {
        return this.IUserService.getUser(id);
    }

    @PutMapping("/{id}")
    public ResponseEntity<UserDTO> update(@PathVariable Long id) {
        return new ResponseEntity<>(null, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<UserDTO> delete(@PathVariable Long id) {
        return new ResponseEntity<>(null, HttpStatus.OK);
    }

    @GetMapping("/{id}/role/{roleName}")
    @ResponseStatus(HttpStatus.CREATED)
    public UserDTO addRoleToUser(@PathVariable String roleName, @PathVariable Long id) {
        return this.IUserService.addRoleToUser(id, roleName);
    }
}
