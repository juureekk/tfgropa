package com.ropa.tfg.controller;

import com.ropa.tfg.dto.PagedResponse;
import com.ropa.tfg.dto.ProductDetailDto;
import com.ropa.tfg.dto.ProductImageDto;
import com.ropa.tfg.dto.ProductSummaryDto;
import com.ropa.tfg.service.ProductImageService;
import com.ropa.tfg.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/products")
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;
    private final ProductImageService productImageService;

    @GetMapping
    public ResponseEntity<PagedResponse<ProductSummaryDto>> getAllProducts(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {

        Page<ProductSummaryDto> productPage = productService.getAllProducts(page, size);

        PagedResponse<ProductSummaryDto> response = new PagedResponse<>();
        response.setContent(productPage.getContent());
        response.setPage(productPage.getNumber());
        response.setSize(productPage.getSize());
        response.setTotalElements(productPage.getTotalElements());
        response.setTotalPages(productPage.getTotalPages());
        response.setLast(productPage.isLast());

        return ResponseEntity.ok(response);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProductDetailDto> getProductById(@PathVariable Long id) {
        return ResponseEntity.ok(productService.getProductById(id));
    }

    @GetMapping("/featured")
    public ResponseEntity<List<ProductSummaryDto>> getFeaturedProducts(
            @RequestParam(defaultValue = "10") int limit) {
        return ResponseEntity.ok(productService.getFeaturedProducts(limit));
    }

    @GetMapping("/new")
    public ResponseEntity<List<ProductSummaryDto>> getNewProducts(
            @RequestParam(defaultValue = "10") int limit,
            @RequestParam(defaultValue = "30") int days) {
        return ResponseEntity.ok(productService.getNewProducts(limit, days));
    }

    @GetMapping("/on-sale")
    public ResponseEntity<List<ProductSummaryDto>> getProductsOnSale(
            @RequestParam(defaultValue = "10") int limit,
            @RequestParam(defaultValue = "10") int minDiscountPercentage) {
        return ResponseEntity.ok(productService.getProductsOnSale(limit, minDiscountPercentage));
    }

    @GetMapping("/{productId}/images")
    public ResponseEntity<List<ProductImageDto>> getProductImages(@PathVariable Long productId) {
        return ResponseEntity.ok(productImageService.getProductImages(productId));
    }
}