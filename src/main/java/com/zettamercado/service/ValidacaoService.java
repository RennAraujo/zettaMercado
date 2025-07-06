package com.zettamercado.service;

import com.zettamercado.domain.Produto;
import com.zettamercado.exception.ValidacaoException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;

@Service
@RequiredArgsConstructor
public class ValidacaoService {

    public void validarProduto(Produto produto) {
        validarPreco(produto.getPreco());
        validarEstoque(produto.getQuantidadeEstoque());
        validarDataValidade(produto.getDataValidade());
    }

    public void validarPreco(BigDecimal preco) {
        if (preco == null || preco.compareTo(BigDecimal.ZERO) <= 0) {
            throw new ValidacaoException("Preço deve ser maior que zero");
        }
    }

    public void validarEstoque(Integer quantidade) {
        if (quantidade == null || quantidade < 0) {
            throw new ValidacaoException("Quantidade em estoque não pode ser negativa");
        }
    }

    public void validarDataValidade(LocalDate dataValidade) {
        if (dataValidade != null && dataValidade.isBefore(LocalDate.now())) {
            throw new ValidacaoException("Data de validade não pode ser anterior à data atual");
        }
    }

    public void validarQuantidadeItem(Integer quantidade) {
        if (quantidade == null || quantidade <= 0) {
            throw new ValidacaoException("Quantidade do item deve ser maior que zero");
        }
    }

    public void validarEstoqueDisponivel(Produto produto, Integer quantidadeSolicitada) {
        if (produto.getQuantidadeEstoque() < quantidadeSolicitada) {
            throw new ValidacaoException("Quantidade solicitada indisponível em estoque");
        }
    }

    public void validarProdutoAtivo(Produto produto) {
        if (produto.getStatus() != Produto.StatusProduto.ATIVO) {
            throw new ValidacaoException("Produto não está ativo para venda");
        }
    }
} 