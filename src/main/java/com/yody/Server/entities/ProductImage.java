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
@Table(name = "product_image")
public class ProductImage extends BaseEntity implements Serializable {

    @Column(columnDefinition = "Text")
    private String featureImageName;
    @Column(columnDefinition = "Text")
    private String featureImagePath;

    @ManyToOne
    @JoinColumn(name = "product_id")
    @JsonIgnore
    private Product product;
}
