package com.zettamercado.dto;

import com.zettamercado.domain.Carrinho.StatusCarrinho;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Data
public class CarrinhoDTO {
    private UUID id;
    private UUID usuarioId;
    private List<ItemCarrinhoDTO> itens = new ArrayList<>();
    private StatusCarrinho status;
    private LocalDateTime dataCriacao;
    private LocalDateTime dataAtualizacao;
    
    // Campos calculados
    private BigDecimal valorTotal;
    private Integer quantidadeItens;
    
    public BigDecimal getValorTotal() {
        return itens.stream()
                .map(ItemCarrinhoDTO::getSubtotal)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }
    
    public Integer getQuantidadeItens() {
        return itens.stream()
                .mapToInt(ItemCarrinhoDTO::getQuantidade)
                .sum();
    }
} 