package com.yody.Server.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.io.Serializable;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Slf4j
@Table(name = "carts")
public class Cart extends BaseEntity implements Serializable {
    @OneToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;
    @OneToMany(cascade = CascadeType.ALL,mappedBy = "cart")
    private List<CartItem> items;

    public void addToCart(CartItem item){
        this.items.add(item);
    }


}
