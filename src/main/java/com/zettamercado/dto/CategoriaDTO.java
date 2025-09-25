package com.zettamercado.dto;

import com.zettamercado.domain.Categoria.StatusCategoria;
import lombok.Data;
import java.time.LocalDateTime;
@Data
public class CategoriaDTO {
    private String id;
    private String nome;
    private String descricao;
    private StatusCategoria status;
    private LocalDateTime dataCriacao;
    private LocalDateTime dataAtualizacao;
}