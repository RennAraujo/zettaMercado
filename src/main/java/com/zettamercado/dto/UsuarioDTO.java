package com.zettamercado.dto;

import com.zettamercado.domain.Usuario.PerfilUsuario;
import com.zettamercado.domain.Usuario.StatusUsuario;
import lombok.Data;
import java.time.LocalDateTime;
import java.util.UUID;

@Data
public class UsuarioDTO {
    private UUID id;
    private String nome;
    private String email;
    private PerfilUsuario perfil;
    private StatusUsuario status;
    private LocalDateTime dataCriacao;
    private LocalDateTime dataAtualizacao;
} 