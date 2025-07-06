package com.zettamercado.service;

import com.zettamercado.domain.ItemCarrinho;
import com.zettamercado.domain.Produto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
public class PrecoService {

    private static final BigDecimal DESCONTO_PRODUTO_PROXIMO_VENCIMENTO = new BigDecimal("0.30"); // 30% de desconto
    private static final int DIAS_PARA_VENCIMENTO = 7;
    private static final BigDecimal DESCONTO_QUANTIDADE_MINIMA = new BigDecimal("0.10"); // 10% de desconto
    private static final int QUANTIDADE_MINIMA_DESCONTO = 5;

    public BigDecimal calcularPrecoFinal(Produto produto, Integer quantidade) {
        BigDecimal precoBase = produto.getPreco();
        BigDecimal precoComDesconto = aplicarDescontoVencimento(produto, precoBase);
        precoComDesconto = aplicarDescontoQuantidade(quantidade, precoComDesconto);
        return precoComDesconto.setScale(2, RoundingMode.HALF_UP);
    }

    public BigDecimal calcularTotalCarrinho(List<ItemCarrinho> itens) {
        return itens.stream()
                .map(item -> calcularPrecoFinal(item.getProduto(), item.getQuantidade())
                        .multiply(BigDecimal.valueOf(item.getQuantidade())))
                .reduce(BigDecimal.ZERO, BigDecimal::add)
                .setScale(2, RoundingMode.HALF_UP);
    }

    private BigDecimal aplicarDescontoVencimento(Produto produto, BigDecimal precoBase) {
        if (produto.getDataValidade() != null) {
            LocalDate dataLimiteDesconto = LocalDate.now().plusDays(DIAS_PARA_VENCIMENTO);
            if (produto.getDataValidade().isBefore(dataLimiteDesconto)) {
                return precoBase.multiply(BigDecimal.ONE.subtract(DESCONTO_PRODUTO_PROXIMO_VENCIMENTO));
            }
        }
        return precoBase;
    }

    private BigDecimal aplicarDescontoQuantidade(Integer quantidade, BigDecimal preco) {
        if (quantidade >= QUANTIDADE_MINIMA_DESCONTO) {
            return preco.multiply(BigDecimal.ONE.subtract(DESCONTO_QUANTIDADE_MINIMA));
        }
        return preco;
    }

    public void atualizarPrecosProduto(Produto produto) {
        // Aqui poderia ter lógica para atualizar preços baseado em:
        // - Custos
        // - Margem de lucro
        // - Preços da concorrência
        // - Sazonalidade
        // Por enquanto, apenas valida o preço
        if (produto.getPreco().compareTo(BigDecimal.ZERO) <= 0) {
            throw new IllegalArgumentException("Preço deve ser maior que zero");
        }
    }
} 