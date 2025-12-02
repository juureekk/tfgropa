package com.ropa.tfg.service;

import com.ropa.tfg.dto.CategoryDto;
import com.ropa.tfg.model.Category;
import com.ropa.tfg.repository.CategoryRepository;
import org.springframework.stereotype.Service;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CategoryService {
    
    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public List<CategoryDto> getAllCategories(Long parentId) {
        List<Category> categories = parentId == null
                ? categoryRepository.findByParentCategoryIsNull()
                : categoryRepository.findByParentCategoryId(parentId);
        return categories.stream().map(this::toDto).collect(Collectors.toList());
    }

    public CategoryDto getCategoryById(Long id) {
        Category category = categoryRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Category no encontrada con id: " + id));
        return toDto(category);
    }

    public CategoryDto createCategory(CategoryDto categoryDto) {
        Category category = new Category();
        category.setName(categoryDto.getName());
        category.setDescription(categoryDto.getDescription());
        
        if (categoryDto.getParentId() != null) {
            Category parent = categoryRepository.findById(categoryDto.getParentId())
                    .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Categoría padre no encontrada con id: " + categoryDto.getParentId()));
            category.setParentCategory(parent);
        }
        
        Category savedCategory = categoryRepository.save(category);
        return toDto(savedCategory);
    }

    public CategoryDto updateCategory(Long id, CategoryDto categoryDto) {
        Category category = categoryRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Categoría no encontrada con id: " + id));
        
        category.setName(categoryDto.getName());
        category.setDescription(categoryDto.getDescription());
        
        if (categoryDto.getParentId() != null) {
            Category parent = categoryRepository.findById(categoryDto.getParentId())
                    .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Categoría padre no encontrada con id: " + categoryDto.getParentId()));
            category.setParentCategory(parent);
        } else {
            category.setParentCategory(null);
        }
        
        Category updatedCategory = categoryRepository.save(category);
        return toDto(updatedCategory);
    }

    public void deleteCategory(Long id) {
        if (!categoryRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Categoría no encontrada con id: " + id);
        }
        categoryRepository.deleteById(id);
    }

    private CategoryDto toDto(Category category) {
        CategoryDto dto = new CategoryDto();
        dto.setId(category.getId());
        dto.setName(category.getName());
        dto.setDescription(category.getDescription());
        dto.setParentId(category.getParentCategory() != null ? category.getParentCategory().getId() : null);
        dto.setParentCategory(null);
        dto.setSubcategories(List.of());
        return dto;
    }
}