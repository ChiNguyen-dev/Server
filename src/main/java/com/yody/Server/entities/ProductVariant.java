package com.yody.Server.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@Table(name = "product_variants")
public class ProductVariant extends BaseEntity implements Serializable {
    @Column(length = 15)
    private String sku;
    @Column(columnDefinition = "text")
    private String image;
    @Column(length = 5)
    private String size;
    @Column(length = 20)
    private String color;
    @ManyToOne
    @JoinColumn(name = "product_id")
    @JsonIgnore
    private Product product;
}
