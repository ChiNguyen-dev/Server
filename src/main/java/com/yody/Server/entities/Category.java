package com.yody.Server.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
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
    private String parentId;
    @OneToMany(mappedBy = "category")
    private List<Product> products;
}
