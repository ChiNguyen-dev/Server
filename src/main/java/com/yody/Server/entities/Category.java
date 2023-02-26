package com.yody.Server.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

import java.io.Serializable;

@Entity
@Table(name = "categories")
public class Category extends BaseEntity implements Serializable {

    @Column
    private String name;
    @Column
    private String slug;
    @Column
    private String parentId;

    public Category() {
    }

    public Category(String name, String slug, String parentId) {
        this.name = name;
        this.slug = slug;
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }
}
