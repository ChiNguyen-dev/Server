package com.yody.Server.entities;

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
@Table(name = "orders")
public class Order extends BaseEntity implements Serializable {
    private String address;
    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;

    @OneToMany(cascade =  CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "order")
    private List<OrderItem> orderItems;
}
