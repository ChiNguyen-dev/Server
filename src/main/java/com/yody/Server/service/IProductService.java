package com.yody.Server.service;

import com.yody.Server.entities.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAllProduct();
    Product getProductById(Long id);

}
