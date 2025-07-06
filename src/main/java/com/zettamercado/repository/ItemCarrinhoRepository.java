package com.zettamercado.repository;

import com.zettamercado.domain.ItemCarrinho;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ItemCarrinhoRepository extends JpaRepository<ItemCarrinho, UUID> {
} 