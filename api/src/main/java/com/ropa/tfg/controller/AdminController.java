package com.ropa.tfg.controller;

import com.ropa.tfg.dto.BrandDto;
import com.ropa.tfg.dto.CategoryDto;
import com.ropa.tfg.service.BrandService;
import com.ropa.tfg.service.CategoryService;
import com.ropa.tfg.service.ProductService;
import com.ropa.tfg.dto.ProductDetailDto;
import com.ropa.tfg.dto.ProductVariantDto;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/admin")
public class AdminController {
    
    private final BrandService brandService;
    private final CategoryService categoryService;
    private final ProductService productService;

    public AdminController(BrandService brandService, CategoryService categoryService, ProductService productService) {
        this.brandService = brandService;
        this.categoryService = categoryService;
        this.productService = productService;
    }
    
    @PostMapping("/categories")
    public ResponseEntity<CategoryDto> createCategory(@Valid @RequestBody CategoryDto categoryDto) {
        CategoryDto createdCategory = categoryService.createCategory(categoryDto);
        return new ResponseEntity<>(createdCategory, HttpStatus.CREATED);
    }

    @PutMapping("/categories/{id}")
    public ResponseEntity<CategoryDto> updateCategory(@PathVariable Long id, @Valid @RequestBody CategoryDto categoryDto) {
        CategoryDto updatedCategory = categoryService.updateCategory(id, categoryDto);
        return ResponseEntity.ok(updatedCategory);
    }

    @DeleteMapping("/categories/{id}")
    public ResponseEntity<Void> deleteCategory(@PathVariable Long id) {
        categoryService.deleteCategory(id);
        return ResponseEntity.noContent().build();
    }
    
    @PostMapping("/brands")
    public ResponseEntity<BrandDto> createBrand(@Valid @RequestBody BrandDto brandDto) {
        BrandDto createdBrand = brandService.createBrand(brandDto);
        return new ResponseEntity<>(createdBrand, HttpStatus.CREATED);
    }

    @PutMapping("/brands/{id}")
    public ResponseEntity<BrandDto> updateBrand(@PathVariable Long id, @Valid @RequestBody BrandDto brandDto) {
        BrandDto updatedBrand = brandService.updateBrand(id, brandDto);
        return ResponseEntity.ok(updatedBrand);
    }

    @DeleteMapping("/brands/{id}")
    public ResponseEntity<Void> deleteBrand(@PathVariable Long id) {
        brandService.deleteBrand(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/products")
    public ResponseEntity<ProductDetailDto> createProduct(@Valid @RequestBody ProductDetailDto productDto) {
        ProductDetailDto createdProduct = productService.createProduct(productDto);
        return new ResponseEntity<>(createdProduct, HttpStatus.CREATED);
    }

    @PutMapping("/products/{id}")
    public ResponseEntity<ProductDetailDto> updateProduct(@PathVariable Long id, @Valid @RequestBody ProductDetailDto productDto) {
        ProductDetailDto updatedProduct = productService.updateProduct(id, productDto);
        return ResponseEntity.ok(updatedProduct);
    }

    @DeleteMapping("/products/{id}")
    public ResponseEntity<Void> deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/products/{productId}/variants")
    public ResponseEntity<ProductVariantDto> createVariant(@PathVariable Long productId, @Valid @RequestBody ProductVariantDto variantDto) {
        ProductVariantDto createdVariant = productService.createVariant(productId, variantDto);
        return new ResponseEntity<>(createdVariant, HttpStatus.CREATED);
    }

    @PutMapping("/variants/{variantId}")
    public ResponseEntity<ProductVariantDto> updateVariant(@PathVariable Long variantId, @Valid @RequestBody ProductVariantDto variantDto) {
        ProductVariantDto updatedVariant = productService.updateVariant(variantId, variantDto);
        return ResponseEntity.ok(updatedVariant);
    }

    @DeleteMapping("/variants/{variantId}")
    public ResponseEntity<Void> deleteVariant(@PathVariable Long variantId) {
        productService.deleteVariant(variantId);
        return ResponseEntity.noContent().build();
    }

}
