package com.zettamercado.mapper;

import com.zettamercado.domain.Produto;
import com.zettamercado.dto.ProdutoDTO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;

@Mapper(componentModel = "spring", nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
public interface ProdutoMapper {
    
    @Mapping(target = "categoriaId", source = "categoria.id")
    @Mapping(target = "categoriaNome", source = "categoria.nome")
    ProdutoDTO toDTO(Produto produto);
    
    @Mapping(target = "categoria.id", source = "categoriaId")
    Produto toEntity(ProdutoDTO dto);
    
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "categoria", ignore = true)
    @Mapping(target = "dataCriacao", ignore = true)
    @Mapping(target = "version", ignore = true)
    void updateEntity(ProdutoDTO dto, @MappingTarget Produto produto);
} 