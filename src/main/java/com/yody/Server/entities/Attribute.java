package com.yody.Server.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import lombok.*;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@Table(name = "attributes")
public class Attribute extends BaseEntity implements Serializable {
    @Column(length = 20)
    private String name;
    @Column(length = 30)
    private String value;

    @JsonIgnore
    @ManyToMany(mappedBy = "attributes")
    private List<Product> products = new ArrayList<>();
}
