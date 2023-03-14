package com.yody.Server.service.impl;

import com.yody.Server.entities.Role;
import com.yody.Server.repositories.RoleRepo;
import com.yody.Server.service.IRoleService;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements IRoleService {

    private final RoleRepo roleRepo;

    public RoleServiceImpl(RoleRepo roleRepo) {
        this.roleRepo = roleRepo;
    }

    @Override
    public <S extends Role> S save(S entity) {
        return roleRepo.save(entity);
    }
}
