package com.ropa.tfg.service;

import com.ropa.tfg.dto.*;
import com.ropa.tfg.model.*;
import com.ropa.tfg.repository.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final ProductVariantRepository variantRepository;
    private final ProductImageRepository imageRepository;
    private final BrandRepository brandRepository;
    private final CategoryRepository categoryRepository;

    public ProductService(ProductRepository productRepository,
                          ProductVariantRepository variantRepository,
                          ProductImageRepository imageRepository,
                          BrandRepository brandRepository,
                          CategoryRepository categoryRepository) {
        this.productRepository = productRepository;
        this.variantRepository = variantRepository;
        this.imageRepository = imageRepository;
        this.brandRepository = brandRepository;
        this.categoryRepository = categoryRepository;
    }

    public Page<ProductSummaryDto> getAllProducts(int page, int size) {
        if (page < 0) page = 0;
        if (size <= 0) size = 10;
        Pageable pageable = PageRequest.of(page, size);
        Page<Product> productPage = productRepository.findAll(pageable);
        return productPage.map(this::toSummaryDto);
    }

    public ProductDetailDto getProductById(Long id) {
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Product no encontrado con id: " + id));
        return toDetailDto(product);
    }

    public List<ProductSummaryDto> getFeaturedProducts(int limit) {
        if (limit <= 0) limit = 10;
        Pageable pageable = PageRequest.of(0, limit);
        return productRepository.findFeaturedProducts(pageable).stream()
                .map(this::toSummaryDto)
                .collect(Collectors.toList());
    }

    public List<ProductSummaryDto> getNewProducts(int limit, int days) {
        if (limit <= 0) limit = 10;
        if (days <= 0) days = 30;
        LocalDateTime since = LocalDateTime.now().minus(days, ChronoUnit.DAYS);
        Pageable pageable = PageRequest.of(0, limit);
        return productRepository.findNewProducts(since, pageable).stream()
                .map(this::toSummaryDto)
                .collect(Collectors.toList());
    }

    public List<ProductSummaryDto> getProductsOnSale(int limit, int minDiscountPercentage) {
        if (limit <= 0) limit = 10;
        int finalMinDiscountPercentage = minDiscountPercentage < 0 ? 10 : minDiscountPercentage;
        Pageable pageable = PageRequest.of(0, limit);
        return productRepository.findProductsOnSale(pageable).stream()
                .filter(p -> {
                    Integer dp = p.getDiscountPercentage();
                    return dp != null && dp >= finalMinDiscountPercentage;
                })
                .map(this::toSummaryDto)
                .limit(limit)
                .collect(Collectors.toList());
    }

    public ProductDetailDto createProduct(ProductDetailDto productDto) {
        if (productDto.getBrand() == null || productDto.getBrand().getId() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Id de marca requerido");
        }
        if (productDto.getCategory() == null || productDto.getCategory().getId() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Id de categoría requerido");
        }

        Brand brand = brandRepository.findById(productDto.getBrand().getId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Marca no encontrada con id: " + productDto.getBrand().getId()));
        Category category = categoryRepository.findById(productDto.getCategory().getId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Categoría no encontrada con id: " + productDto.getCategory().getId()));

        Product product = new Product();
        product.setName(productDto.getName());
        product.setDescription(productDto.getDescription());
        product.setPrice(productDto.getPrice());
        product.setDiscountPrice(productDto.getDiscountPrice());
        product.setBrand(brand);
        product.setCategory(category);
        product.setActive(productDto.isActive());
        product.setFeatured(productDto.isFeatured());

        Product saved = productRepository.save(product);
        return toDetailDto(saved);
    }

    public ProductDetailDto updateProduct(Long id, ProductDetailDto productDto) {
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Product no encontrado con id: " + id));

        if (productDto.getBrand() == null || productDto.getBrand().getId() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Id de marca requerido");
        }
        if (productDto.getCategory() == null || productDto.getCategory().getId() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Id de categoría requerido");
        }

        Brand brand = brandRepository.findById(productDto.getBrand().getId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Marca no encontrada con id: " + productDto.getBrand().getId()));
        Category category = categoryRepository.findById(productDto.getCategory().getId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Categoría no encontrada con id: " + productDto.getCategory().getId()));

        product.setName(productDto.getName());
        product.setDescription(productDto.getDescription());
        product.setPrice(productDto.getPrice());
        product.setDiscountPrice(productDto.getDiscountPrice());
        product.setBrand(brand);
        product.setCategory(category);
        product.setActive(productDto.isActive());
        product.setFeatured(productDto.isFeatured());

        Product updated = productRepository.save(product);
        return toDetailDto(updated);
    }

    public void deleteProduct(Long id) {
        if (!productRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Product no encontrado con id: " + id);
        }
        productRepository.deleteById(id);
    }

    public ProductVariantDto createVariant(Long productId, ProductVariantDto variantDto) {
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Product no encontrado con id: " + productId));

        ProductVariant variant = new ProductVariant();
        variant.setProduct(product);
        variant.setSize(variantDto.getSize());
        variant.setColor(variantDto.getColor());
        variant.setSku(variantDto.getSku());
        variant.setStock(variantDto.getStock() != null ? variantDto.getStock() : 0);

        ProductVariant saved = variantRepository.save(variant);
        return toVariantDto(saved);
    }

    public ProductVariantDto updateVariant(Long id, ProductVariantDto variantDto) {
        ProductVariant variant = variantRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Variant no encontrada con id: " + id));

        if (variantDto.getProductId() != null) {
            Product product = productRepository.findById(variantDto.getProductId())
                    .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Product no encontrado con id: " + variantDto.getProductId()));
            variant.setProduct(product);
        }

        variant.setSize(variantDto.getSize());
        variant.setColor(variantDto.getColor());
        variant.setSku(variantDto.getSku());
        variant.setStock(variantDto.getStock());

        ProductVariant updated = variantRepository.save(variant);
        return toVariantDto(updated);
    }

    public void deleteVariant(Long id) {
        if (!variantRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Variant no encontrada con id: " + id);
        }
        variantRepository.deleteById(id);
    }

    private ProductSummaryDto toSummaryDto(Product product) {
        ProductSummaryDto dto = new ProductSummaryDto();
        dto.setId(product.getId());
        dto.setName(product.getName());
        dto.setDescription(product.getDescription());
        dto.setPrice(product.getPrice());
        dto.setDiscountPrice(product.getDiscountPrice());
        dto.setDiscountPercentage(product.getDiscountPercentage());
        dto.setBrand(toBrandDto(product.getBrand()));
        dto.setCategory(toCategorySimpleDto(product.getCategory()));
        ProductImage mainImage = product.getMainImage();
        if (mainImage != null) {
            dto.setMainImage(mainImage.getImageUrl());
        }
        dto.setHasVariantsInStock(product.hasVariantsInStock());
        dto.setFeatured(product.isFeatured());
        dto.setActive(product.isActive());
        return dto;
    }

    private ProductDetailDto toDetailDto(Product product) {
        ProductDetailDto dto = new ProductDetailDto();
        dto.setId(product.getId());
        dto.setName(product.getName());
        dto.setDescription(product.getDescription());
        dto.setPrice(product.getPrice());
        dto.setDiscountPrice(product.getDiscountPrice());
        dto.setDiscountPercentage(product.getDiscountPercentage());
        dto.setBrand(toBrandDto(product.getBrand()));
        dto.setCategory(toCategoryDto(product.getCategory()));
        dto.setImages(imageRepository.findByProductIdOrderByDisplayOrderAsc(product.getId()).stream()
                .map(this::toImageDto)
                .collect(Collectors.toList()));
        dto.setVariants(variantRepository.findByProductId(product.getId()).stream()
                .map(this::toVariantDto)
                .collect(Collectors.toList()));
        dto.setActive(product.isActive());
        dto.setFeatured(product.isFeatured());
        dto.setCreatedAt(product.getCreatedAt());
        dto.setUpdatedAt(product.getUpdatedAt());
        dto.setHasVariantsInStock(product.hasVariantsInStock());
        return dto;
    }

    private BrandDto toBrandDto(Brand brand) {
        if (brand == null) return null;
        BrandDto dto = new BrandDto();
        dto.setId(brand.getId());
        dto.setName(brand.getName());
        dto.setDescription(brand.getDescription());
        dto.setLogoUrl(brand.getLogoUrl());
        return dto;
    }

    private CategorySimpleDto toCategorySimpleDto(Category category) {
        if (category == null) return null;
        CategorySimpleDto dto = new CategorySimpleDto();
        dto.setId(category.getId());
        dto.setName(category.getName());
        dto.setParentId(category.getParentCategory() != null ? category.getParentCategory().getId() : null);
        return dto;
    }

    private CategoryDto toCategoryDto(Category category) {
        if (category == null) return null;
        CategoryDto dto = new CategoryDto();
        dto.setId(category.getId());
        dto.setName(category.getName());
        dto.setDescription(category.getDescription());
        dto.setParentId(category.getParentCategory() != null ? category.getParentCategory().getId() : null);
        dto.setParentCategory(null);
        dto.setSubcategories(List.of());
        return dto;
    }

    private ProductImageDto toImageDto(ProductImage image) {
        ProductImageDto dto = new ProductImageDto();
        dto.setId(image.getId());
        dto.setProductId(image.getProduct().getId());
        dto.setImageUrl(image.getImageUrl());
        dto.setPrimary(image.isPrimary());
        dto.setDisplayOrder(image.getDisplayOrder());
        return dto;
    }

    private ProductVariantDto toVariantDto(ProductVariant variant) {
        ProductVariantDto dto = new ProductVariantDto();
        dto.setId(variant.getId());
        dto.setProductId(variant.getProduct().getId());
        dto.setSize(variant.getSize());
        dto.setColor(variant.getColor());
        dto.setSku(variant.getSku());
        dto.setStock(variant.getStock());
        return dto;
    }
}
