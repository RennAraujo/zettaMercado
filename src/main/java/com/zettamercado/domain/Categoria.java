package com.zettamercado.domain;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;
import java.time.LocalDateTime;
@Data
@Entity
@Table(name = "categorias")
public class Categoria {
    
    @Id
    @Column(length = 36)
    private String id;
    
    @Column(nullable = false, length = 100)
    private String nome;
    
    @Column
    private String descricao;
    
    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private StatusCategoria status = StatusCategoria.ATIVA;
    
    @Column(name = "data_criacao", nullable = false, updatable = false)
    private LocalDateTime dataCriacao;
    
    @Column(name = "data_atualizacao", nullable = false)
    private LocalDateTime dataAtualizacao;
    
    @PrePersist
    protected void onCreate() {
        dataCriacao = LocalDateTime.now();
        dataAtualizacao = LocalDateTime.now();
    }
    
    @PreUpdate
    protected void onUpdate() {
        dataAtualizacao = LocalDateTime.now();
    }
    
    public enum StatusCategoria {
        ATIVA, INATIVA
    }
}