package com.zettamercado.service;

import com.zettamercado.domain.Produto;
import com.zettamercado.dto.ProdutoDTO;
import com.zettamercado.mapper.ProdutoMapper;
import com.zettamercado.repository.CategoriaRepository;
import com.zettamercado.repository.ProdutoRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


@Service
@RequiredArgsConstructor
public class ProdutoService {

    private final ProdutoRepository produtoRepository;
    private final CategoriaRepository categoriaRepository;
    private final ProdutoMapper produtoMapper;
    private static final String UPLOAD_DIR = "uploads/produtos";

    @Transactional(readOnly = true)
    public Page<ProdutoDTO> listar(String nome, String categoriaId, Boolean emEstoque, Pageable pageable) {
        // Por enquanto, retorna todos os produtos - implementação simplificada
        if (nome != null && !nome.trim().isEmpty()) {
            return produtoRepository.findByNomeContainingIgnoreCase(nome, pageable)
                    .map(produtoMapper::toDTO);
        } else if (categoriaId != null) {
            return produtoRepository.findByCategoriaId(categoriaId, pageable)
                    .map(produtoMapper::toDTO);
        } else {
            return produtoRepository.findAll(pageable)
                    .map(produtoMapper::toDTO);
        }
    }

    @Transactional(readOnly = true)
    public ProdutoDTO buscarPorId(String id) {
        return produtoRepository.findById(id)
                .map(produtoMapper::toDTO)
                .orElseThrow(() -> new EntityNotFoundException("Produto não encontrado"));
    }

    @Transactional
    public ProdutoDTO criar(ProdutoDTO dto) {
        Produto produto = produtoMapper.toEntity(dto);
        produto.setCategoria(categoriaRepository.findById(dto.getCategoriaId())
                .orElseThrow(() -> new EntityNotFoundException("Categoria não encontrada")));
        return produtoMapper.toDTO(produtoRepository.save(produto));
    }

    @Transactional
    public ProdutoDTO atualizar(String id, ProdutoDTO produtoDTO) {
        Produto produto = produtoRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Produto não encontrado"));

        if (produtoDTO.getCategoriaId() != null && !produtoDTO.getCategoriaId().equals(produto.getCategoria().getId())) {
            produto.setCategoria(categoriaRepository.findById(produtoDTO.getCategoriaId())
                    .orElseThrow(() -> new EntityNotFoundException("Categoria não encontrada")));
        }

        produtoMapper.updateEntity(produtoDTO, produto);
        return produtoMapper.toDTO(produtoRepository.save(produto));
    }

    @Transactional
    public void excluir(String id) {
        if (!produtoRepository.existsById(id)) {
            throw new EntityNotFoundException("Produto não encontrado");
        }
        produtoRepository.deleteById(id);
    }

    @Transactional
    public ProdutoDTO uploadImagem(String id, MultipartFile imagem) {
        Produto produto = produtoRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Produto não encontrado"));

        try {
            Path uploadPath = Paths.get(UPLOAD_DIR);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            String filename = id + "_" + imagem.getOriginalFilename();
            Path filePath = uploadPath.resolve(filename);
            Files.copy(imagem.getInputStream(), filePath);

            produto.setImagemUrl("/uploads/produtos/" + filename);
            return produtoMapper.toDTO(produtoRepository.save(produto));
        } catch (IOException e) {
            throw new RuntimeException("Erro ao fazer upload da imagem", e);
        }
    }

    @Transactional
    public ProdutoDTO atualizarEstoque(String id, Integer quantidade) {
        Produto produto = produtoRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Produto não encontrado"));

        produto.setQuantidadeEstoque(quantidade);
        if (quantidade <= 0) {
            produto.setStatus(Produto.StatusProduto.ESGOTADO);
        } else if (produto.getStatus() == Produto.StatusProduto.ESGOTADO) {
            produto.setStatus(Produto.StatusProduto.ATIVO);
        }

        return produtoMapper.toDTO(produtoRepository.save(produto));
    }
}