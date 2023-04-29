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
    @Column(length = 150)
    private String name;
    @Column
    private BigDecimal price;
    @Column(columnDefinition = "Text")
    private String slug;
    @Column(columnDefinition = "Text")
    private String description;
    @ManyToOne
    @JoinColumn(name = "category_id")
    @JsonIgnore
    private Category category;
    @OneToMany(mappedBy = "product")
    private List<ProductVariant> productVariants;
    @OneToMany(mappedBy = "product")
    private List<ProductImage> productImages;
    public void addProductVariant(ProductVariant productVariant) {
        this.productVariants.add(productVariant);
    }

    public void addProductImage(ProductImage productImage) {
        this.productImages.add(productImage);
    }
}
