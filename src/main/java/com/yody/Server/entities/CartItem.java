package com.yody.Server.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.io.Serializable;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Slf4j
@Table(name = "cart_item")
public class CartItem extends BaseEntity implements Serializable {
    @Column
    private Long quantity;
    @ManyToOne
    @JoinColumn(name = "cart_id")
    private Cart cart;
    @ManyToOne
    @JoinColumn(name = "variant_id")
    private ProductVariant productVariant;
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;
}
