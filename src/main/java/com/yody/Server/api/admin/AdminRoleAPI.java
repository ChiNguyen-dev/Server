package com.yody.Server.api.admin;

import com.yody.Server.service.IRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/auth/admin/roles")
public class AdminRoleAPI {

    private final IRoleService roleService;
}
