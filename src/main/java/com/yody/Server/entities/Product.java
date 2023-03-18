package com.yody.Server.entities;

import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Table(name = "products")
public class Product extends BaseEntity implements Serializable {
    @Column
    private String name;

    @Column
    private String price;

    @Column(columnDefinition="Text")
    private String slug;

    @Column(columnDefinition="Text")
    private String featureImagePath;

    @Column(columnDefinition="Text")
    private String shortDesc;

    @Column(columnDefinition="Text")
    private String description;

    @ManyToOne
    @JoinColumn(name="category_id")
    private Category category;
}
