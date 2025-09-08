package com.zettamercado.controller;

import com.zettamercado.dto.CarrinhoDTO;
import com.zettamercado.dto.ItemCarrinhoDTO;
import com.zettamercado.service.CarrinhoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/carrinhos")
@RequiredArgsConstructor
@Tag(name = "Carrinho", description = "Endpoints para gerenciamento do carrinho de compras")
@SecurityRequirement(name = "bearerAuth")
public class CarrinhoController {

    private final CarrinhoService carrinhoService;

    @GetMapping("/atual")
    @Operation(summary = "Buscar carrinho atual do usuário")
    public ResponseEntity<CarrinhoDTO> buscarCarrinhoAtual(
            @AuthenticationPrincipal UserDetails userDetails) {
        String email = userDetails != null ? userDetails.getUsername() : "demo@zettamercado.com";
        return ResponseEntity.ok(carrinhoService.buscarCarrinhoAtual(email));
    }

    @PostMapping("/atual/items")
    @Operation(summary = "Adicionar item ao carrinho")
    public ResponseEntity<CarrinhoDTO> adicionarItem(
            @AuthenticationPrincipal UserDetails userDetails,
            @Valid @RequestBody ItemCarrinhoDTO item) {
        String email = userDetails != null ? userDetails.getUsername() : "demo@zettamercado.com";
        return ResponseEntity.ok(carrinhoService.adicionarItem(email, item));
    }

    @PutMapping("/atual/items/{itemId}")
    @Operation(summary = "Atualizar quantidade de um item")
    public ResponseEntity<CarrinhoDTO> atualizarQuantidade(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable UUID itemId,
            @RequestParam Integer quantidade) {
        String email = userDetails != null ? userDetails.getUsername() : "demo@zettamercado.com";
        return ResponseEntity.ok(carrinhoService.atualizarQuantidade(email, itemId, quantidade));
    }

    @DeleteMapping("/atual/items/{itemId}")
    @Operation(summary = "Remover item do carrinho")
    public ResponseEntity<CarrinhoDTO> removerItem(
            @AuthenticationPrincipal UserDetails userDetails,
            @PathVariable UUID itemId) {
        String email = userDetails != null ? userDetails.getUsername() : "demo@zettamercado.com";
        return ResponseEntity.ok(carrinhoService.removerItem(email, itemId));
    }

    @PostMapping("/atual/finalizar")
    @Operation(summary = "Finalizar compra")
    public ResponseEntity<CarrinhoDTO> finalizarCompra(
            @AuthenticationPrincipal UserDetails userDetails) {
        String email = userDetails != null ? userDetails.getUsername() : "demo@zettamercado.com";
        return ResponseEntity.ok(carrinhoService.finalizarCompra(email));
    }

    @DeleteMapping("/atual")
    @Operation(summary = "Limpar carrinho")
    public ResponseEntity<Void> limparCarrinho(
            @AuthenticationPrincipal UserDetails userDetails) {
        String email = userDetails != null ? userDetails.getUsername() : "demo@zettamercado.com";
        carrinhoService.limparCarrinho(email);
        return ResponseEntity.noContent().build();
    }
}