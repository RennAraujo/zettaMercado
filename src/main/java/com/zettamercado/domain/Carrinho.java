package com.zettamercado.domain;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
@Data
@Entity
@Table(name = "carrinhos")
public class Carrinho {
    
    @Id
    @Column(length = 36)
    private String id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id", nullable = false)
    private Usuario usuario;
    
    @OneToMany(mappedBy = "carrinho", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ItemCarrinho> itens = new ArrayList<>();
    
    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private StatusCarrinho status = StatusCarrinho.ABERTO;
    
    @Column(name = "data_criacao", nullable = false, updatable = false)
    private LocalDateTime dataCriacao = LocalDateTime.now();
    
    @Column(name = "data_atualizacao", nullable = false)
    private LocalDateTime dataAtualizacao = LocalDateTime.now();
    
    @Version
    private Long version;
    
    public enum StatusCarrinho {
        ABERTO, FINALIZADO, CANCELADO
    }
    
    public void adicionarItem(ItemCarrinho item) {
        itens.add(item);
        item.setCarrinho(this);
    }
    
    public void removerItem(ItemCarrinho item) {
        itens.remove(item);
        item.setCarrinho(null);
    }
}