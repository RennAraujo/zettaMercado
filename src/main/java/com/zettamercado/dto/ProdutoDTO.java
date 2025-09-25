package com.zettamercado.dto;

import com.zettamercado.domain.Produto.StatusProduto;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
@Data
public class ProdutoDTO {
    private String id;
    private String nome;
    private String descricao;
    private BigDecimal preco;
    private Integer quantidadeEstoque;
    private String categoriaId;
    private String codigoBarras;
    private String imagemUrl;
    private LocalDate dataValidade;
    private StatusProduto status;
    private LocalDateTime dataCriacao;
    private LocalDateTime dataAtualizacao;
    
    // Campos adicionais para exibição
    private String categoriaNome;
    private Boolean emEstoque;
    
    public Boolean getEmEstoque() {
        return quantidadeEstoque != null && quantidadeEstoque > 0;
    }
}