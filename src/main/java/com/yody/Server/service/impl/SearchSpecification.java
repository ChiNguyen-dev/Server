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
    public static Specification<Product> getSpecification(List<Long> cateIds,
                                                          List<String> sizes,
                                                          List<String> colors){
        return (root, query, criteriaBuilder) ->{
           List<Predicate> predicates = new ArrayList<>();
           if (cateIds != null && !cateIds.isEmpty()){
               Predicate catePredicate = root.get("category").get("id").in(cateIds);
               predicates.add(catePredicate);
           }
           if( colors != null &&  !colors.isEmpty()){
               Join<Product, ProductVariant> join = root.join("productVariants");
               Predicate colorPredicate = join.get("color").in(colors);
               predicates.add(colorPredicate);
           }
           if(sizes != null && sizes.isEmpty()){
               Join<Product, ProductVariant> join = root.join("productVariants");
               Predicate sizePredicate = join.get("size").in(sizes);
               predicates.add(sizePredicate);
           }
           return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        } ;
    }
}
