package com.ropa.tfg.service;

import com.ropa.tfg.dto.BrandDto;
import com.ropa.tfg.model.Brand;
import com.ropa.tfg.repository.BrandRepository;
import org.springframework.stereotype.Service;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class BrandService {
    
    private final BrandRepository brandRepository;

    public BrandService(BrandRepository brandRepository) {
        this.brandRepository = brandRepository;
    }

    public List<BrandDto> getAllBrands() {
        return brandRepository.findAll().stream().map(this::toDto).collect(Collectors.toList());
    }

    public BrandDto getBrandById(Long id) {
        Brand brand = brandRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Brand no encontrado con id: " + id));
        return toDto(brand);
    }

    public BrandDto createBrand(BrandDto brandDto) {
        Brand brand = new Brand();
        brand.setName(brandDto.getName());
        brand.setDescription(brandDto.getDescription());
        brand.setLogoUrl(brandDto.getLogoUrl());
        
        Brand savedBrand = brandRepository.save(brand);
        return toDto(savedBrand);
    }

    public BrandDto updateBrand(Long id, BrandDto brandDto) {
        Brand brand = brandRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Marca no encontrada con id: " + id));
        
        brand.setName(brandDto.getName());
        brand.setDescription(brandDto.getDescription());
        brand.setLogoUrl(brandDto.getLogoUrl());
        
        Brand updatedBrand = brandRepository.save(brand);
        return toDto(updatedBrand);
    }

    public void deleteBrand(Long id) {
        if (!brandRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Marca no encontrada con id: " + id);
        }
        brandRepository.deleteById(id);
    }

    private BrandDto toDto(Brand brand) {
        BrandDto dto = new BrandDto();
        dto.setId(brand.getId());
        dto.setName(brand.getName());
        dto.setDescription(brand.getDescription());
        dto.setLogoUrl(brand.getLogoUrl());
        return dto;
    }

}