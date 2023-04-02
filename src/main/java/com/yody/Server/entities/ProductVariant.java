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

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "size_id", referencedColumnName = "id")
    private Size size;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "color_id", referencedColumnName = "id")
    private Color color;

    @ManyToOne
    @JoinColumn(name = "product_id")
    @JsonIgnore
    private Product product;
}
