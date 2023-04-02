package com.yody.Server.components;

import com.yody.Server.dto.CategoryDTO;
import com.yody.Server.dto.ProductReqAdminDTO;
import com.yody.Server.dto.ProductResAdminDTO;
import com.yody.Server.entities.Product;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ProductMapper {
    public final ModelMapper modelMapper;

    public Product toEntity(ProductReqAdminDTO productRequestAdminDTO) {
        return this.modelMapper.map(productRequestAdminDTO, Product.class);
    }

    public ProductResAdminDTO toDto(Product product) {
        CategoryDTO categoryDTO = this.modelMapper.map(product.getCategory(), CategoryDTO.class);
        ProductResAdminDTO productResAdminDTO = this.modelMapper.map(product, ProductResAdminDTO.class);
        productResAdminDTO.setCategoryDTO(categoryDTO);
        return productResAdminDTO;
    }
}
