package com.zettamercado.mapper;

import com.zettamercado.domain.Categoria;
import com.zettamercado.dto.CategoriaDTO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;

@Mapper(componentModel = "spring", nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
public interface CategoriaMapper {
    
    CategoriaDTO toDTO(Categoria categoria);
    
    Categoria toEntity(CategoriaDTO dto);
    
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "dataCriacao", ignore = true)
    void updateEntity(CategoriaDTO dto, @MappingTarget Categoria categoria);
} 