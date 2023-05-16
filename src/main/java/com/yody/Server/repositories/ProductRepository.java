package com.yody.Server.repositories;

import com.yody.Server.dto.product.ProductResAdminDTO;
import com.yody.Server.entities.Product;
import jakarta.annotation.Nullable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Arrays;
import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByCategoryId(Long cateId);

    Page<Product> findByCategoryId(Pageable pageable, Long cateId);

    Page<Product> findAll(Pageable pageable);


    List<Product> findAll(Specification specification, Pageable pageable);

    @Query("SELECT DISTINCT p FROM Product p where p.name like %:param%")
    Page<Product> searchByName(Pageable pageable, @Param("param") String param);

    @Query("SELECT p FROM Product p WHERE p.category.id = :cateId OR p.category.parentId = :cateId")
    List<Product> findProductByCategoryId(Pageable pageable,@Param("cateId") Long cateId);

}
