package com.yody.Server.service;

import com.yody.Server.dto.product.DataProductReqDTO;
import com.yody.Server.dto.product.ProductResAdminDTO;
import com.yody.Server.dto.product.ShowPageDTO;
import com.yody.Server.dto.variant.VariantResDTO;
import com.yody.Server.entities.ProductVariant;

import java.util.List;

public interface IProductService {
    List<VariantResDTO> searchByName(String name);

    List<ProductResAdminDTO> getAllProduct();

    ShowPageDTO showPage(int page);

    ProductResAdminDTO getProductById(Long id);

    ProductResAdminDTO addProduct(DataProductReqDTO dataProductReqDTO);

    List<ProductResAdminDTO> getProductByCategorySlug(String slug);

    List<ProductVariant> getVariantsByProductId(Long id);

    List<ProductResAdminDTO> getProductByCategoryId(Long cateId);

    List<ProductResAdminDTO> getProductByFilter(List<String> slugs,
                                                List<String> colors,
                                                List<String> sizes,
                                                int page,
                                                String sortType);
}
