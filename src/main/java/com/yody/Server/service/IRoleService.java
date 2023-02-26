package com.yody.Server.service;

import com.yody.Server.entities.RoleEntity;

public interface IRoleService {

    <S extends RoleEntity> S save(S entity);
}
