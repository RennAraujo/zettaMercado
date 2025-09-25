package com.zettamercado.service;

import com.zettamercado.domain.Carrinho;
import com.zettamercado.domain.Produto;
import com.zettamercado.domain.Usuario;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
@Slf4j
@Service
@RequiredArgsConstructor
public class AuditoriaService {

    public void registrarAlteracaoProduto(String produtoId, String operacao, String usuario) {
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
        // SEGURANÇA: Não loggar email completo para evitar vazamento de dados pessoais
        String emailMascarado = mascararEmail(usuario.getEmail());
        log.info("Login realizado pelo usuário {} (email: {}) em {}", 
                usuario.getNome(), emailMascarado, LocalDateTime.now());
    }

    public void registrarCompra(Carrinho carrinho) {
        // SEGURANÇA: Não loggar email completo para evitar vazamento de dados pessoais
        String emailMascarado = mascararEmail(carrinho.getUsuario().getEmail());
        log.info("Compra finalizada: Carrinho {}, Usuário (email: {}), Total de itens {}, Valor total {} em {}", 
                carrinho.getId(), 
                emailMascarado,
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
        // SEGURANÇA: Não loggar token completo para evitar vazamento de credenciais
        String tokenMascarado = mascararToken(token);
        log.info("Acesso em modo demonstração com token {} em {}", 
                tokenMascarado, LocalDateTime.now());
    }

    /**
     * Mascara email para logs de segurança
     * Exemplo: usuario@exemplo.com -> u****o@e****o.com
     */
    private String mascararEmail(String email) {
        if (email == null || email.length() < 3) {
            return "***";
        }
        
        String[] partes = email.split("@");
        if (partes.length != 2) {
            return "***";
        }
        
        String usuario = partes[0];
        String dominio = partes[1];
        
        String usuarioMascarado = usuario.length() > 2 ? 
            usuario.charAt(0) + "***" + usuario.charAt(usuario.length() - 1) : "***";
            
        String dominioMascarado = dominio.length() > 2 ? 
            dominio.charAt(0) + "***" + dominio.substring(dominio.length() - 4) : "***";
            
        return usuarioMascarado + "@" + dominioMascarado;
    }

    /**
     * Mascara token para logs de segurança
     * Mostra apenas os primeiros 4 e últimos 4 caracteres
     */
    private String mascararToken(String token) {
        if (token == null || token.length() < 8) {
            return "***";
        }
        
        return token.substring(0, 4) + "***" + token.substring(token.length() - 4);
    }
}