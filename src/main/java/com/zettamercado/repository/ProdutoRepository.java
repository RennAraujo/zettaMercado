package com.zettamercado.repository;

import com.zettamercado.domain.Produto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, String> {
    
    // Método simples para buscar todos os produtos
    Page<Produto> findAll(Pageable pageable);
    
    // Método para buscar por categoria
    Page<Produto> findByCategoriaId(String categoriaId, Pageable pageable);
    
    // Método para buscar por nome contendo
    Page<Produto> findByNomeContainingIgnoreCase(String nome, Pageable pageable);
}