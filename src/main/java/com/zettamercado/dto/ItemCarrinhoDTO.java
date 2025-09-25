package com.zettamercado.dto;

import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;
@Data
public class ItemCarrinhoDTO {
    private String id;
    private String carrinhoId;
    private String produtoId;
    private Integer quantidade;
    private BigDecimal precoUnitario;
    private BigDecimal subtotal;
    private LocalDateTime dataCriacao;
    private LocalDateTime dataAtualizacao;
    
    // Campos adicionais para exibição
    private String produtoNome;
    private String produtoImagem;
}