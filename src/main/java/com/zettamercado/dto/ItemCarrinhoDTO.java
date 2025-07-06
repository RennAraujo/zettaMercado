package com.zettamercado.dto;

import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

@Data
public class ItemCarrinhoDTO {
    private UUID id;
    private UUID carrinhoId;
    private UUID produtoId;
    private Integer quantidade;
    private BigDecimal precoUnitario;
    private BigDecimal subtotal;
    private LocalDateTime dataCriacao;
    private LocalDateTime dataAtualizacao;
    
    // Campos adicionais para exibição
    private String produtoNome;
    private String produtoImagem;
} 