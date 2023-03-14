package com.yody.Server.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import lombok.*;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "roles")
public class RoleEntity extends BaseEntity implements Serializable {
    @Column
    private String name;

    @JsonIgnore
    @ManyToMany(mappedBy = "roles")
    private Set<UserEntity> users = new HashSet<>();
}
