package com.yody.Server.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

import java.io.Serializable;

@Entity
@Data
@NoArgsConstructor
@ToString
@Builder
@Table(name = "order_items")
public class OrderItem extends  BaseEntity implements Serializable {

}
