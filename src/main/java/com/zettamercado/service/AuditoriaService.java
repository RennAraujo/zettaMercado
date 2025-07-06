package com.zettamercado.service;

import com.zettamercado.domain.Carrinho;
import com.zettamercado.domain.Produto;
import com.zettamercado.domain.Usuario;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class AuditoriaService {

    public void registrarAlteracaoProduto(UUID produtoId, String operacao, String usuario) {
        log.info("Produto {} {} por {} em {}", 
                produtoId, operacao, usuario, LocalDateTime.now());
    }

    public void registrarAlteracaoEstoque(Produto produto, Integer quantidadeAnterior, Integer quantidadeNova, String usuario) {
        log.info("Estoque do produto {} alterado de {} para {} por {} em {}", 
                produto.getId(), quantidadeAnterior, quantidadeNova, usuario, LocalDateTime.now());
    }

    public void registrarAlteracaoPreco(Produto produto, BigDecimal precoAnterior, BigDecimal precoNovo, String usuario) {
        log.info("Preço do produto {} alterado de {} para {} por {} em {}", 
                produto.getId(), precoAnterior, precoNovo, usuario, LocalDateTime.now());
    }

    public void registrarLoginUsuario(Usuario usuario) {
        log.info("Login realizado pelo usuário {} ({}) em {}", 
                usuario.getNome(), usuario.getEmail(), LocalDateTime.now());
    }

    public void registrarCompra(Carrinho carrinho) {
        log.info("Compra finalizada: Carrinho {}, Usuário {}, Total de itens {}, Valor total {} em {}", 
                carrinho.getId(), 
                carrinho.getUsuario().getEmail(),
                carrinho.getItens().size(),
                carrinho.getItens().stream()
                        .map(item -> item.getPrecoUnitario().multiply(BigDecimal.valueOf(item.getQuantidade())))
                        .reduce(BigDecimal.ZERO, BigDecimal::add),
                LocalDateTime.now());
    }

    public void registrarErroOperacao(String operacao, String erro, String detalhes) {
        log.error("Erro na operação {}: {} - Detalhes: {} em {}", 
                operacao, erro, detalhes, LocalDateTime.now());
    }

    public void registrarAcessoDemo(String token) {
        log.info("Acesso em modo demonstração com token {} em {}", 
                token, LocalDateTime.now());
    }
} 