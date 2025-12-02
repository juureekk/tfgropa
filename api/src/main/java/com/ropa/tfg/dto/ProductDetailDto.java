package com.ropa.tfg.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDetailDto {
    private Long id;
    private String name;
    private String description;
    private BigDecimal price;
    private BigDecimal discountPrice;
    private Integer discountPercentage;
    private BrandDto brand;
    private CategoryDto category;
    private List<ProductImageDto> images = new ArrayList<>();
    private List<ProductVariantDto> variants = new ArrayList<>();
    private boolean active;
    private boolean featured;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private boolean hasVariantsInStock;
}