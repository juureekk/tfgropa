package com.ropa.tfg.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "products")
@lombok.Getter
@lombok.Setter
@lombok.EqualsAndHashCode(exclude = {"brand", "category", "variants", "images"})
@lombok.ToString(exclude = {"brand", "category", "variants", "images"})
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String name;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String description;

    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal price;

    @Column(name = "discount_price", precision = 10, scale = 2)
    private BigDecimal discountPrice;

    @ManyToOne
    @JoinColumn(name = "brand_id", nullable = false)
    private Brand brand;

    @ManyToOne
    @JoinColumn(name = "category_id", nullable = false)
    private Category category;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @Column(nullable = false)
    private boolean active = true;

    @Column(nullable = false)
    private boolean featured = false;

    @OneToMany(mappedBy = "product")
    private List<ProductVariant> variants = new ArrayList<>();

    @OneToMany(mappedBy = "product")
    private List<ProductImage> images = new ArrayList<>();

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    public boolean hasVariantsInStock() {
        return variants.stream().anyMatch(variant -> variant.getStock() > 0);
    }

    public ProductImage getMainImage() {
        return images.stream()
                .filter(ProductImage::isPrimary)
                .findFirst()
                .orElse(images.isEmpty() ? null : images.get(0));
    }

    public Integer getDiscountPercentage() {
        if (price != null && discountPrice != null && price.compareTo(BigDecimal.ZERO) > 0) {
            BigDecimal discount = price.subtract(discountPrice);
            BigDecimal percentage = discount.multiply(new BigDecimal(100)).divide(price, 0, BigDecimal.ROUND_HALF_UP);
            return percentage.intValue();
        }
        return null;
    }
}