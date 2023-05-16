package com.yody.Server.entities;

import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@Data
@NoArgsConstructor
@ToString
@Builder
@AllArgsConstructor
@Table(name = "order_items")
public class OrderItem extends  BaseEntity implements Serializable {
    private Long quantity;

    @ManyToOne
    @JoinColumn(name = "variant_id")
    private ProductVariant variant;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;
}
