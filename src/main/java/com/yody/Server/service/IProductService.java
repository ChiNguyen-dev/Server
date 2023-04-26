package com.yody.Server.service;

import com.yody.Server.dto.DataProductReqDTO;
import com.yody.Server.dto.ProductReqAdminDTO;
import com.yody.Server.dto.ProductResAdminDTO;
import com.yody.Server.entities.Product;
import com.yody.Server.entities.ProductVariant;

import java.util.List;

public interface IProductService {
    List<ProductResAdminDTO> getAllProduct();

    ProductResAdminDTO getProductById(Long id);

    List<ProductVariant> getVariantsByProductId(Long id);

    ProductResAdminDTO addProduct(DataProductReqDTO dataProductReqDTO);
}
