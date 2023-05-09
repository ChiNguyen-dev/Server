package com.yody.Server.service;

import com.yody.Server.dto.DataProductReqDTO;
import com.yody.Server.dto.ProductResAdminDTO;
import com.yody.Server.entities.Product;
import com.yody.Server.entities.ProductVariant;

import java.util.List;

public interface IProductService {
    List<ProductResAdminDTO> getAllProduct();

    ProductResAdminDTO getProductById(Long id);

    ProductResAdminDTO addProduct(DataProductReqDTO dataProductReqDTO);

    List<ProductResAdminDTO> getProductByCategorySlug(String slug);

    List<ProductVariant> getVariantsByProductId(Long id);

    List<ProductResAdminDTO> getProductByCategoryId(Long cateId);

    List<Product> getProductByFilter(List<Long> cateIds,
                                     List<String> colors,
                                     List<String> sizes,
                                     int page,
                                     String sortType);
}
