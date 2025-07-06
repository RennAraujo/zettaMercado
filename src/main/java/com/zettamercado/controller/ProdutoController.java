package com.zettamercado.controller;

import com.zettamercado.dto.ProdutoDTO;
import com.zettamercado.service.ProdutoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.UUID;

@RestController
@RequestMapping("/api/produtos")
@RequiredArgsConstructor
@Tag(name = "Produtos", description = "Endpoints para gerenciamento de produtos")
@SecurityRequirement(name = "bearerAuth")
public class ProdutoController {

    private final ProdutoService produtoService;

    @GetMapping
    @Operation(summary = "Listar produtos com paginação e filtros")
    public ResponseEntity<Page<ProdutoDTO>> listar(
            @RequestParam(required = false) String nome,
            @RequestParam(required = false) UUID categoriaId,
            @RequestParam(required = false) Boolean emEstoque,
            @ParameterObject Pageable pageable) {
        return ResponseEntity.ok(produtoService.listar(nome, categoriaId, emEstoque, pageable));
    }

    @GetMapping("/{id}")
    @Operation(summary = "Buscar produto por ID")
    public ResponseEntity<ProdutoDTO> buscarPorId(@PathVariable UUID id) {
        return ResponseEntity.ok(produtoService.buscarPorId(id));
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMIN')")
    @Operation(summary = "Criar novo produto")
    public ResponseEntity<ProdutoDTO> criar(@Valid @RequestBody ProdutoDTO produto) {
        return ResponseEntity.ok(produtoService.criar(produto));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN')")
    @Operation(summary = "Atualizar produto existente")
    public ResponseEntity<ProdutoDTO> atualizar(
            @PathVariable UUID id,
            @Valid @RequestBody ProdutoDTO produto) {
        return ResponseEntity.ok(produtoService.atualizar(id, produto));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN')")
    @Operation(summary = "Excluir produto")
    public ResponseEntity<Void> excluir(@PathVariable UUID id) {
        produtoService.excluir(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/{id}/imagem")
    @PreAuthorize("hasAnyRole('ADMIN')")
    @Operation(summary = "Upload de imagem do produto")
    public ResponseEntity<ProdutoDTO> uploadImagem(
            @PathVariable UUID id,
            @RequestParam("imagem") MultipartFile imagem) {
        return ResponseEntity.ok(produtoService.uploadImagem(id, imagem));
    }

    @PutMapping("/{id}/estoque")
    @PreAuthorize("hasAnyRole('ADMIN')")
    @Operation(summary = "Atualizar estoque do produto")
    public ResponseEntity<ProdutoDTO> atualizarEstoque(
            @PathVariable UUID id,
            @RequestParam Integer quantidade) {
        return ResponseEntity.ok(produtoService.atualizarEstoque(id, quantidade));
    }
} 