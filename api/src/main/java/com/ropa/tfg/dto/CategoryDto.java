package com.ropa.tfg.dto;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryDto {
    private Long id;
    private String name;
    private String description;
    private Long parentId;
    @JsonBackReference // no serializa parentCategory para evitar bucle
    private CategoryDto parentCategory;
    @JsonManagedReference // si serializa las subcategorias
    private List<CategoryDto> subcategories = new ArrayList<>();
}