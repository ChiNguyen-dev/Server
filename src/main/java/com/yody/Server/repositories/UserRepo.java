package com.yody.Server.repositories;

import com.yody.Server.entities.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends JpaRepository<UserEntity, Long> {
    UserEntity findByEmail(String email);
}
