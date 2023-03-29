package com.yody.Server.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;
import java.math.BigDecimal;
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
    private BigDecimal price;

    @Column(columnDefinition = "Text")
    private String slug;

    @Column(columnDefinition = "Text")
    private String imgUrl;


    @Column(columnDefinition = "Text")
    private String description;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @OneToMany(mappedBy = "product")
    private List<ProductVariant> variants;

}
