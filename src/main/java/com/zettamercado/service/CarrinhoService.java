package com.zettamercado.service;

import com.zettamercado.domain.Carrinho;
import com.zettamercado.domain.ItemCarrinho;
import com.zettamercado.domain.Produto;
import com.zettamercado.domain.Usuario;
import com.zettamercado.dto.CarrinhoDTO;
import com.zettamercado.dto.ItemCarrinhoDTO;
import com.zettamercado.mapper.CarrinhoMapper;
import com.zettamercado.repository.CarrinhoRepository;
import com.zettamercado.repository.ItemCarrinhoRepository;
import com.zettamercado.repository.ProdutoRepository;
import com.zettamercado.repository.UsuarioRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
@RequiredArgsConstructor
public class CarrinhoService {

    private final CarrinhoRepository carrinhoRepository;
    private final ItemCarrinhoRepository itemCarrinhoRepository;
    private final ProdutoRepository produtoRepository;
    private final UsuarioRepository usuarioRepository;
    private final CarrinhoMapper carrinhoMapper;

    @Transactional(readOnly = true)
    public CarrinhoDTO buscarCarrinhoAtual(String email) {
        return carrinhoRepository.findByUsuarioEmailAndStatus(email, Carrinho.StatusCarrinho.ABERTO)
                .map(carrinhoMapper::toDTO)
                .orElseGet(() -> criarNovoCarrinho(email));
    }

    @Transactional
    public CarrinhoDTO adicionarItem(String email, ItemCarrinhoDTO itemDTO) {
        Carrinho carrinho = obterOuCriarCarrinho(email);
        Produto produto = produtoRepository.findById(itemDTO.getProdutoId())
                .orElseThrow(() -> new EntityNotFoundException("Produto não encontrado"));

        if (produto.getQuantidadeEstoque() < itemDTO.getQuantidade()) {
            throw new IllegalStateException("Quantidade indisponível em estoque");
        }

        ItemCarrinho item = carrinho.getItens().stream()
                .filter(i -> i.getProduto().getId().equals(produto.getId()))
                .findFirst()
                .orElseGet(() -> {
                    ItemCarrinho novoItem = new ItemCarrinho();
                    novoItem.setCarrinho(carrinho);
                    novoItem.setProduto(produto);
                    carrinho.getItens().add(novoItem);
                    return novoItem;
                });

        item.setQuantidade(itemDTO.getQuantidade());
        item.setPrecoUnitario(produto.getPreco());
        item.calcularSubtotal();

        return carrinhoMapper.toDTO(carrinhoRepository.save(carrinho));
    }

    @Transactional
    public CarrinhoDTO atualizarQuantidade(String email, String itemId, Integer quantidade) {
        Carrinho carrinho = obterCarrinhoAberto(email);
        ItemCarrinho item = carrinho.getItens().stream()
                .filter(i -> i.getId().equals(itemId))
                .findFirst()
                .orElseThrow(() -> new EntityNotFoundException("Item não encontrado no carrinho"));

        if (item.getProduto().getQuantidadeEstoque() < quantidade) {
            throw new IllegalStateException("Quantidade indisponível em estoque");
        }

        item.setQuantidade(quantidade);
        item.calcularSubtotal();

        return carrinhoMapper.toDTO(carrinhoRepository.save(carrinho));
    }

    @Transactional
    public CarrinhoDTO removerItem(String email, String itemId) {
        Carrinho carrinho = obterCarrinhoAberto(email);
        ItemCarrinho item = carrinho.getItens().stream()
                .filter(i -> i.getId().equals(itemId))
                .findFirst()
                .orElseThrow(() -> new EntityNotFoundException("Item não encontrado no carrinho"));

        carrinho.removerItem(item);
        itemCarrinhoRepository.delete(item);

        return carrinhoMapper.toDTO(carrinhoRepository.save(carrinho));
    }

    @Transactional
    public CarrinhoDTO finalizarCompra(String email) {
        Carrinho carrinho = obterCarrinhoAberto(email);

        // Verificar estoque e atualizar
        for (ItemCarrinho item : carrinho.getItens()) {
            Produto produto = item.getProduto();
            if (produto.getQuantidadeEstoque() < item.getQuantidade()) {
                throw new IllegalStateException("Produto " + produto.getNome() + " sem estoque suficiente");
            }
            produto.setQuantidadeEstoque(produto.getQuantidadeEstoque() - item.getQuantidade());
            produtoRepository.save(produto);
        }

        carrinho.setStatus(Carrinho.StatusCarrinho.FINALIZADO);
        return carrinhoMapper.toDTO(carrinhoRepository.save(carrinho));
    }

    @Transactional
    public void limparCarrinho(String email) {
        Carrinho carrinho = obterCarrinhoAberto(email);
        carrinhoRepository.delete(carrinho);
    }

    private CarrinhoDTO criarNovoCarrinho(String email) {
        Usuario usuario = usuarioRepository.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("Usuário não encontrado"));

        Carrinho carrinho = new Carrinho();
        carrinho.setUsuario(usuario);
        carrinho.setStatus(Carrinho.StatusCarrinho.ABERTO);

        return carrinhoMapper.toDTO(carrinhoRepository.save(carrinho));
    }

    private Carrinho obterOuCriarCarrinho(String email) {
        return carrinhoRepository.findByUsuarioEmailAndStatus(email, Carrinho.StatusCarrinho.ABERTO)
                .orElseGet(() -> {
                    Usuario usuario = usuarioRepository.findByEmail(email)
                            .orElseThrow(() -> new EntityNotFoundException("Usuário não encontrado"));
                    Carrinho carrinho = new Carrinho();
                    carrinho.setUsuario(usuario);
                    carrinho.setStatus(Carrinho.StatusCarrinho.ABERTO);
                    return carrinhoRepository.save(carrinho);
                });
    }

    private Carrinho obterCarrinhoAberto(String email) {
        return carrinhoRepository.findByUsuarioEmailAndStatus(email, Carrinho.StatusCarrinho.ABERTO)
                .orElseThrow(() -> new EntityNotFoundException("Carrinho não encontrado"));
    }
}