package com.yody.Server.repositories;

import com.yody.Server.entities.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByCategoryId(Long cateId);

    @Query("select  p from Product p join p.productVariants pv where " +
            "(:size is null or pv.size = :size) and " +
            "(:color is null or pv.color = :color) and " +
            "(:category is null or p.category.id = :category)"

    )
    List<Product> findByVariantSizeAndColor(@Param("category") Long category, @Param("size") String size, @Param("color") String color, Pageable pageable);
}
