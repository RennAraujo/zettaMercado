package com.zettamercado.repository;

import com.zettamercado.domain.Carrinho;
import com.zettamercado.domain.Carrinho.StatusCarrinho;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
@Repository
public interface CarrinhoRepository extends JpaRepository<Carrinho, String> {
    Optional<Carrinho> findByUsuarioEmailAndStatus(String email, StatusCarrinho status);
}