package com.zettamercado.mapper;

import com.zettamercado.domain.Carrinho;
import com.zettamercado.dto.CarrinhoDTO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;

@Mapper(componentModel = "spring", 
        uses = {ItemCarrinhoMapper.class},
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
public interface CarrinhoMapper {
    
    @Mapping(target = "usuarioId", source = "usuario.id")
    CarrinhoDTO toDTO(Carrinho carrinho);
    
    @Mapping(target = "usuario.id", source = "usuarioId")
    Carrinho toEntity(CarrinhoDTO dto);
    
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "usuario", ignore = true)
    @Mapping(target = "dataCriacao", ignore = true)
    @Mapping(target = "version", ignore = true)
    void updateEntity(CarrinhoDTO dto, @MappingTarget Carrinho carrinho);
} 