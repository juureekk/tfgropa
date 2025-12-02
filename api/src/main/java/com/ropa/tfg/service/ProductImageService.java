package com.ropa.tfg.service;

import com.ropa.tfg.dto.ProductImageDto;
import com.ropa.tfg.model.ProductImage;
import com.ropa.tfg.repository.ProductImageRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductImageService {
    
    private final ProductImageRepository productImageRepository;

    public ProductImageService(ProductImageRepository productImageRepository) {
        this.productImageRepository = productImageRepository;
    }

    public List<ProductImageDto> getProductImages(Long productId) {
        return productImageRepository.findByProductIdOrderByDisplayOrderAsc(productId).stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    private ProductImageDto toDto(ProductImage image) {
        ProductImageDto dto = new ProductImageDto();
        dto.setId(image.getId());
        dto.setProductId(image.getProduct().getId());
        dto.setImageUrl(image.getImageUrl());
        dto.setPrimary(image.isPrimary());
        dto.setDisplayOrder(image.getDisplayOrder());
        return dto;
    }

}