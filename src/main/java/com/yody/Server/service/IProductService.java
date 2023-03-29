package com.yody.Server.service;

import com.yody.Server.entities.Product;
import com.yody.Server.entities.ProductVariant;

import java.util.List;

public interface IProductService {
    List<Product> getAllProduct();
    Product getProductById(Long id);
    List<ProductVariant> getVariantsByProductId(Long id);
}
