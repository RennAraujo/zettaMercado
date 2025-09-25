package com.zettamercado.repository;

import com.zettamercado.domain.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CategoriaRepository extends JpaRepository<Categoria, String> {
    List<Categoria> findByStatus(Categoria.StatusCategoria status);
}