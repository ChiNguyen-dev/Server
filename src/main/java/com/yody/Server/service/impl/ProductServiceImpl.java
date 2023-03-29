package com.yody.Server.service.impl;

import com.yody.Server.entities.Product;
import com.yody.Server.exception.NotFondException;
import com.yody.Server.repositories.ProductRepository;
import com.yody.Server.service.IProductService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@AllArgsConstructor
@Service
@Slf4j
public class ProductServiceImpl implements IProductService {
    private final ProductRepository repository;

    public List<Product> getAllProduct(){
        return repository.findAll();
    }
    public Product getProductById(Long id){
        return this.repository.findById(id).orElseThrow(() -> new NotFondException("Not fond product"));
    }
}
