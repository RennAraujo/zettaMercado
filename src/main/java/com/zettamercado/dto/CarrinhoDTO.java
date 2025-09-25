package com.zettamercado.dto;

import com.zettamercado.domain.Carrinho.StatusCarrinho;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
@Data
public class CarrinhoDTO {
    private String id;
    private String usuarioId;
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