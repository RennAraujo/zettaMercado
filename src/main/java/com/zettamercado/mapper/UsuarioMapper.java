package com.zettamercado.mapper;

import com.zettamercado.domain.Usuario;
import com.zettamercado.dto.UsuarioDTO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;

@Mapper(componentModel = "spring", nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
public interface UsuarioMapper {
    
    UsuarioDTO toDTO(Usuario usuario);
    
    @Mapping(target = "senha", ignore = true)
    @Mapping(target = "secret2FA", ignore = true)
    Usuario toEntity(UsuarioDTO dto);
    
    @Mapping(target = "id", ignore = true)
    @Mapping(target = "senha", ignore = true)
    @Mapping(target = "secret2FA", ignore = true)
    @Mapping(target = "dataCriacao", ignore = true)
    void updateEntity(UsuarioDTO dto, @MappingTarget Usuario usuario);
} 