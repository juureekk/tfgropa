package com.ropa.tfg.repository;

import com.ropa.tfg.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
    @Query("SELECT p FROM Product p WHERE p.active = true AND p.discountPrice IS NOT NULL ORDER BY (p.price - p.discountPrice) / p.price DESC")
    Page<Product> findProductsOnSale(Pageable pageable);
    @Query("SELECT p FROM Product p WHERE p.active = true AND p.createdAt >= ?1 ORDER BY p.createdAt DESC")
    List<Product> findNewProducts(LocalDateTime since, Pageable pageable);
    @Query("SELECT p FROM Product p WHERE p.active = true AND p.featured = true ORDER BY p.id DESC")
    List<Product> findFeaturedProducts(Pageable pageable);
}