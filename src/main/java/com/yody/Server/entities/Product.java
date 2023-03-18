package com.yody.Server.entities;

import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
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

    @ManyToMany
    @JoinTable(name = "product_attributes",
        joinColumns = @JoinColumn(name = "attribute_id"),
        inverseJoinColumns = @JoinColumn(name = "product_id")
    )
    private List<Attribute> attributes = new ArrayList<>();
}
