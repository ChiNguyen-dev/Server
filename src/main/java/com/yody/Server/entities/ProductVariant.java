package com.yody.Server.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@Table(name = "product_variants")
public class ProductVariant extends BaseEntity implements Serializable {

    private String color;
    private String size;
    private String sku;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    @JsonIgnore
    private Product product;

}
