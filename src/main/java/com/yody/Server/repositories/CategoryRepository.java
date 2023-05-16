package com.yody.Server.repositories;

import com.yody.Server.entities.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
    Optional<Category> findBySlug(String slug);

    @Query("SELECT DISTINCT c FROM Category as c WHERE c.parentId =:id")
    List<Category> findByParentId(@Param("id") Long id);
}
