package com.yody.Server.api.admin;

import com.yody.Server.dto.UserDTO;
import com.yody.Server.service.IUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/admin/users")
public class AdminUserAPI {

    private final IUserService IUserService;

    @GetMapping
    public ResponseEntity<List<UserDTO>> getAllUsers() {
        return new ResponseEntity<>(this.IUserService.getUsers(), HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<UserDTO> addUser() {
        return new ResponseEntity<>(null, HttpStatus.CREATED);
    }


    @PutMapping("/{id}")
    public ResponseEntity<UserDTO> update(@PathVariable Long id) {
        return new ResponseEntity<>(null, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<UserDTO> delete(@PathVariable Long id) {
        return new ResponseEntity<>(null, HttpStatus.OK);
    }

    @GetMapping("/{email}/role/{roleName}")
    public ResponseEntity<UserDTO> addRoleToUser(@PathVariable String roleName, @PathVariable String email) {
        return new ResponseEntity<>(this.IUserService.addRoleToUser(email, roleName), HttpStatus.OK);
    }
}
