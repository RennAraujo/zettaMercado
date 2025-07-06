package com.zettamercado.repository;

import com.zettamercado.domain.Produto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, UUID> {
    
    @Query("SELECT p FROM Produto p " +
           "WHERE (:nome IS NULL OR LOWER(p.nome) LIKE LOWER(CONCAT('%', :nome, '%'))) " +
           "AND (:categoriaId IS NULL OR p.categoria.id = :categoriaId) " +
           "AND (:emEstoque IS NULL OR (p.quantidadeEstoque > 0) = :emEstoque)")
    Page<Produto> findByFiltros(
            @Param("nome") String nome,
            @Param("categoriaId") UUID categoriaId,
            @Param("emEstoque") Boolean emEstoque,
            Pageable pageable);
} 