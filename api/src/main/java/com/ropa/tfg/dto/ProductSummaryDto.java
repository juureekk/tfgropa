package com.ropa.tfg.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductSummaryDto {
    private Long id;
    private String name;
    private String description;
    private BigDecimal price;
    private BigDecimal discountPrice;
    private Integer discountPercentage;
    private BrandDto brand;
    private CategorySimpleDto category;
    private String mainImage;
    private boolean hasVariantsInStock;
    private boolean featured;
    private boolean active;
    private Double averageRating;
    private Integer reviewCount;
    private Integer salesCount;
}