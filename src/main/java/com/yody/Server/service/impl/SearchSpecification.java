package com.yody.Server.service.impl;

import com.yody.Server.entities.Product;
import com.yody.Server.entities.ProductVariant;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.Predicate;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.domain.Specification;

import java.util.ArrayList;
import java.util.List;

@Slf4j
public class SearchSpecification<T> {
    public static Specification<Product> isInCateIds(List<Long> cateIds) {
        return ((root, query, criteriaBuilder) -> {
            if (cateIds != null && !cateIds.isEmpty()){
                return criteriaBuilder.isTrue(root.get("category").get("id").in(cateIds));
            }
            return criteriaBuilder.isTrue(criteriaBuilder.literal(true));
        });

    }

    public static Specification<Product> isInSizes(List<String> sizes) {
        return ((root, query, criteriaBuilder) -> {
            query.distinct(true);
            if (sizes != null && !sizes.isEmpty()){
                return criteriaBuilder.isTrue(root.get("productVariants").get("size").in(sizes));
            }
          return criteriaBuilder.isTrue(criteriaBuilder.literal(true));
        });
    }
    public static Specification<Product> isInColors(List<String> colors) {
        return ((root, query, criteriaBuilder) -> {
            query.distinct(true);
            if (colors != null && !colors.isEmpty()){
                return criteriaBuilder.isTrue(root.get("productVariants").get("color").in(colors));
            }
            return criteriaBuilder.isTrue(criteriaBuilder.literal(true));
        });
    }
}
