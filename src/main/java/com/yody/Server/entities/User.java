package com.yody.Server.entities;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@Table(name = "users")
public class User extends BaseEntity implements UserDetails {
    @Column(name = "fullname", length = 50)
    private String fullName;
    @Column(name = "email", length = 50)
    private String email;
    @Column(name = "password")
    private String password;

    @OneToMany(mappedBy = "user")
    private Set<Order> orders = new HashSet<>();

    @ManyToMany(fetch = FetchType.EAGER  , cascade = CascadeType.ALL)
    @JoinTable(name = "user_role",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id")
    )
    private Set<Role> roles;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Set<GrantedAuthority> authorities = new HashSet<>();
        this.roles.forEach(role -> authorities.add(new SimpleGrantedAuthority(role.getName())));
        return authorities;
    }

    @Override
    public String getUsername() {
        return this.email;
    }

    @Override
    public String getPassword(){
        return this.password;
    }
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
    public void addRole(Role role){
        this.roles.add(role);
    }
}
