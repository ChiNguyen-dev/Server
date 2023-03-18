package com.yody.Server.api.auth;

import com.yody.Server.dto.AuthenticationRequest;
import com.yody.Server.dto.AuthenticationResponse;
import com.yody.Server.dto.UserDTO;
import com.yody.Server.dto.UserRegisterRequest;
import com.yody.Server.service.IUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/v1/auth")
public class AuthenticationController {
    private final IUserService userService;
    @PostMapping("/login")
    public ResponseEntity<AuthenticationResponse> authentication(@RequestBody AuthenticationRequest authenticationRequest){
        String token = this.userService.authentication(authenticationRequest);
        return ResponseEntity.ok(AuthenticationResponse.builder().token(token).build());
    }

    @PostMapping("/register")
    @ResponseStatus(HttpStatus.CREATED)
    public UserDTO addUser(@RequestBody UserRegisterRequest userRegisterRequest) {
        return this.userService.saveUser(userRegisterRequest);
    }
}
