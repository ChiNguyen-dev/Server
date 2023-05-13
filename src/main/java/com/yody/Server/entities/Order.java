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
    @Column(length = 100, nullable = false)
    private String address;
    @Column(length = 50, nullable = false)
    private String orderUsername;
    @Column(length = 10, nullable = false)
    private String phone;
    @Column(length = 50)
    private String paymentType;
    private String note;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "order")
    private List<OrderItem> orderItems;
}
