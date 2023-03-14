package com.yody.Server.service;

import com.yody.Server.entities.Role;

public interface IRoleService {

    <S extends Role> S save(S entity);
}
