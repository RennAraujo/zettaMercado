package com.zettamercado.service;

import com.zettamercado.domain.Categoria;
import com.zettamercado.dto.CategoriaDTO;
import com.zettamercado.mapper.CategoriaMapper;
import com.zettamercado.repository.CategoriaRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CategoriaService {

    private final CategoriaRepository categoriaRepository;
    private final CategoriaMapper categoriaMapper;

    @Transactional(readOnly = true)
    public List<CategoriaDTO> listar(Boolean apenasAtivas) {
        if (Boolean.TRUE.equals(apenasAtivas)) {
            return categoriaRepository.findByStatus(Categoria.StatusCategoria.ATIVA)
                    .stream()
                    .map(categoriaMapper::toDTO)
                    .collect(Collectors.toList());
        }
        return categoriaRepository.findAll()
                .stream()
                .map(categoriaMapper::toDTO)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public CategoriaDTO buscarPorId(String id) {
        return categoriaRepository.findById(id)
                .map(categoriaMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("Categoria não encontrada"));
    }

    @Transactional
    public CategoriaDTO criar(CategoriaDTO dto) {
        Categoria categoria = categoriaMapper.toEntity(dto);
        categoria.setStatus(Categoria.StatusCategoria.ATIVA);
        return categoriaMapper.toDTO(categoriaRepository.save(categoria));
    }

    @Transactional
    public CategoriaDTO atualizar(String id, CategoriaDTO dto) {
        Categoria categoria = categoriaRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Categoria não encontrada"));

        categoriaMapper.updateEntity(dto, categoria);
        return categoriaMapper.toDTO(categoriaRepository.save(categoria));
    }

    @Transactional
    public void excluir(String id) {
        Categoria categoria = categoriaRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Categoria não encontrada"));

        categoria.setStatus(Categoria.StatusCategoria.INATIVA);
        categoriaRepository.save(categoria);
    }
}