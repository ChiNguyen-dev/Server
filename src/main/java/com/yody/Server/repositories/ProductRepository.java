package com.yody.Server.repositories;

import com.yody.Server.entities.Product;
import jakarta.annotation.Nullable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByCategoryId(Long cateId);

    Page<Product> findByCategoryId(Pageable pageable, Long cateId);

    Page<Product> findAll(Pageable pageable);

    @Query("SELECT DISTINCT p FROM Product p JOIN p.productVariants pv " +
            "WHERE (p.category.id IN :cateIds) " +
            " AND (pv.size IN :sizes )" +
            " AND (pv.color IN :colors )")
    List<Product> findByFilter(@Param("cateIds") @Nullable List<Long> cateIds,
                               @Param("sizes") @Nullable List<String> sizes,
                               @Param("colors") @Nullable List<String> colors,
                               Pageable pageable);

    List<Product> findAll(Specification specification, Pageable pageable);

    @Query("SELECT DISTINCT p FROM Product p where p.name like %:param%")
    Page<Product> searchByName(Pageable pageable, @Param("param") String param);
}
