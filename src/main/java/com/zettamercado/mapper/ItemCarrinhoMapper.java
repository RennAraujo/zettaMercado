package com.zettamercado.mapper;

import com.zettamercado.domain.ItemCarrinho;
import com.zettamercado.dto.ItemCarrinhoDTO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;

@Mapper(componentModel = "spring", nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
public interface ItemCarrinhoMapper {
    
    @Mapping(target = "carrinhoId", source = "carrinho.id")
    @Mapping(target = "produtoId", source = "produto.id")
    @Mapping(target = "produtoNome", source = "produto.nome")
    @Mapping(target = "produtoImagem", source = "produto.imagemUrl")
    ItemCarrinhoDTO toDTO(ItemCarrinho item);
    
    @Mapping(target = "carrinho.id", source = "carrinhoId")
    @Mapping(target = "produto.id", source = "produtoId")
    ItemCarrinho toEntity(ItemCarrinhoDTO dto);
    
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "carrinho", ignore = true)
    @Mapping(target = "produto", ignore = true)
    @Mapping(target = "dataCriacao", ignore = true)
    @Mapping(target = "version", ignore = true)
    void updateEntity(ItemCarrinhoDTO dto, @MappingTarget ItemCarrinho item);
} 