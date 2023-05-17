package com.yody.Server.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "categories")
public class Category extends BaseEntity implements Serializable {
    @Column
    private String name;
    @Column
    private String slug;
    @Column
    private Long parentId;
    @OneToMany(mappedBy = "category")
    private List<Product> products;
}
