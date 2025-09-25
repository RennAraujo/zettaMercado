package com.zettamercado.domain;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;
import java.math.BigDecimal;
import java.time.LocalDateTime;
@Data
@Entity
@Table(name = "itens_carrinho")
public class ItemCarrinho {
    
    @Id
    @Column(length = 36)
    private String id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "carrinho_id", nullable = false)
    private Carrinho carrinho;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "produto_id", nullable = false)
    private Produto produto;
    
    @Column(nullable = false)
    private Integer quantidade;
    
    @Column(name = "preco_unitario", nullable = false, precision = 10, scale = 2)
    private BigDecimal precoUnitario;
    
    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal subtotal;
    
    @Column(name = "data_criacao", nullable = false, updatable = false)
    private LocalDateTime dataCriacao = LocalDateTime.now();
    
    @Column(name = "data_atualizacao", nullable = false)
    private LocalDateTime dataAtualizacao = LocalDateTime.now();
    
    @Version
    private Long version;
    
    @PrePersist
    @PreUpdate
    public void calcularSubtotal() {
        if (quantidade != null && precoUnitario != null) {
            this.subtotal = precoUnitario.multiply(BigDecimal.valueOf(quantidade));
        }
    }
}