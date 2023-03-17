package com.yody.Server.service.impl;

import com.yody.Server.entities.Role;
import com.yody.Server.repositories.RoleRepository;
import com.yody.Server.service.IRoleService;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements IRoleService {

    private final RoleRepository roleRepository;

    public RoleServiceImpl(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    @Override
    public <S extends Role> S save(S entity) {
        return roleRepository.save(entity);
    }
}
