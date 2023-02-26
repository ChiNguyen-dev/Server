package com.yody.Server;

import com.yody.Server.entities.RoleEntity;
import com.yody.Server.entities.UserEntity;
import com.yody.Server.service.IRoleService;
import com.yody.Server.service.IUserService;
import org.modelmapper.ModelMapper;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import java.util.Arrays;
import java.util.HashSet;

@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class ServerApplication {


    @Bean
    public ModelMapper modelMapper() {
        return new ModelMapper();
    }

    public static void main(String[] args) {
        SpringApplication.run(ServerApplication.class, args);
    }


    @Bean
    CommandLineRunner run(IUserService userService, IRoleService roleService) {
        return args -> {
            RoleEntity roleEntity1 = new RoleEntity("ADMIN", new HashSet<>());
            roleService.save(roleEntity1);
            RoleEntity roleEntity2 = new RoleEntity("DEVELOPER", new HashSet<>());
            roleService.save(roleEntity2);
            RoleEntity roleEntity3 = new RoleEntity("CONTENT", new HashSet<>());
            roleService.save(roleEntity3);
            userService.save(new UserEntity("Võ Chí Nguyên", "nguyendev2001@gmai.com", "admin123", new HashSet<>()));
            userService.save(new UserEntity("Nguyễn Hồng Phú Nhuận", "19130164@gmai.com", "admin123", new HashSet<>()));
        };
    }

    @Bean
    public CorsFilter corsFilter() {
        CorsConfiguration corsConfiguration = new CorsConfiguration();
        corsConfiguration.setAllowCredentials(true);
        corsConfiguration.setAllowedOrigins(Arrays.asList("http://localhost:4200"));
        corsConfiguration.setAllowedHeaders(Arrays.asList("Origin", "Access-Control-Allow-Origin", "Content-Type",
                "Accept", "Authorization", "Origin, Accept", "X-Requested-With",
                "Access-Control-Request-Method", "Access-Control-Request-Headers"));
        corsConfiguration.setExposedHeaders(Arrays.asList("Origin", "Content-Type", "Accept", "Authorization",
                "Access-Control-Allow-Origin", "Access-Control-Allow-Origin", "Access-Control-Allow-Credentials"));
        corsConfiguration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE", "OPTIONS"));
        UrlBasedCorsConfigurationSource urlBasedCorsConfigurationSource = new UrlBasedCorsConfigurationSource();
        urlBasedCorsConfigurationSource.registerCorsConfiguration("/**", corsConfiguration);
        return new CorsFilter(urlBasedCorsConfigurationSource);
    }
}
