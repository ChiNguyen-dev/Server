package com.yody.Server.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

import java.io.Serializable;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@Table(name = "colors")
public class Color extends BaseEntity implements Serializable {
    @Column(length = 20)
    private String name;
    @Column(length = 10)
    private String style;
}
