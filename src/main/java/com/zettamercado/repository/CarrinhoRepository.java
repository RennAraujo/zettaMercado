package com.zettamercado.repository;

import com.zettamercado.domain.Carrinho;
import com.zettamercado.domain.Carrinho.StatusCarrinho;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface CarrinhoRepository extends JpaRepository<Carrinho, UUID> {
    Optional<Carrinho> findByUsuarioEmailAndStatus(String email, StatusCarrinho status);
} 