import React, { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import api from '../services/api';

interface ItemCarrinho {
  id: string;
  produtoId: string;
  produtoNome: string;
  produtoImagem: string;
  quantidade: number;
  precoUnitario: number;
  subtotal: number;
}

interface Carrinho {
  id: string;
  itens: ItemCarrinho[];
  valorTotal: number;
  quantidadeItens: number;
}

interface CarrinhoContextType {
  carrinho: Carrinho | null;
  loading: boolean;
  adicionarItem: (produtoId: string, quantidade: number) => Promise<void>;
  atualizarQuantidade: (itemId: string, quantidade: number) => Promise<void>;
  removerItem: (itemId: string) => Promise<void>;
  limparCarrinho: () => Promise<void>;
  finalizarCompra: () => Promise<void>;
  buscarCarrinho: () => Promise<void>;
}

const CarrinhoContext = createContext<CarrinhoContextType | undefined>(undefined);

export const useCarrinho = () => {
  const context = useContext(CarrinhoContext);
  if (context === undefined) {
    throw new Error('useCarrinho must be used within a CarrinhoProvider');
  }
  return context;
};

interface CarrinhoProviderProps {
  children: ReactNode;
}

export const CarrinhoProvider: React.FC<CarrinhoProviderProps> = ({ children }) => {
  const [carrinho, setCarrinho] = useState<Carrinho | null>(null);
  const [loading, setLoading] = useState(false);

  const buscarCarrinho = async () => {
    try {
      setLoading(true);
      // Verificar se o usuário está autenticado
      const token = localStorage.getItem('token');
      const recruiterMode = localStorage.getItem('recruiter-mode');
      
      if (!token && !recruiterMode) {
        // Se não há token nem modo recrutador, criar carrinho vazio
        setCarrinho(null);
        return;
      }
      
      const response = await api.get('/carrinhos/atual');
      setCarrinho(response.data);
    } catch (error) {
      console.error('Erro ao buscar carrinho:', error);
      // Em caso de erro, não quebrar a aplicação
      setCarrinho(null);
    } finally {
      setLoading(false);
    }
  };

  const adicionarItem = async (produtoId: string, quantidade: number) => {
    try {
      setLoading(true);
      const response = await api.post('/carrinhos/atual/items', {
        produtoId,
        quantidade
      });
      setCarrinho(response.data);
    } catch (error) {
      console.error('Erro ao adicionar item:', error);
      throw error;
    } finally {
      setLoading(false);
    }
  };

  const atualizarQuantidade = async (itemId: string, quantidade: number) => {
    try {
      setLoading(true);
      const response = await api.put(`/carrinhos/atual/items/${itemId}?quantidade=${quantidade}`);
      setCarrinho(response.data);
    } catch (error) {
      console.error('Erro ao atualizar quantidade:', error);
      throw error;
    } finally {
      setLoading(false);
    }
  };

  const removerItem = async (itemId: string) => {
    try {
      setLoading(true);
      const response = await api.delete(`/carrinhos/atual/items/${itemId}`);
      setCarrinho(response.data);
    } catch (error) {
      console.error('Erro ao remover item:', error);
      throw error;
    } finally {
      setLoading(false);
    }
  };

  const limparCarrinho = async () => {
    try {
      setLoading(true);
      await api.delete('/carrinhos/atual');
      setCarrinho(null);
    } catch (error) {
      console.error('Erro ao limpar carrinho:', error);
      throw error;
    } finally {
      setLoading(false);
    }
  };

  const finalizarCompra = async () => {
    try {
      setLoading(true);
      const response = await api.post('/carrinhos/atual/finalizar');
      setCarrinho(null);
      return response.data;
    } catch (error) {
      console.error('Erro ao finalizar compra:', error);
      throw error;
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    buscarCarrinho();
  }, []);

  const value: CarrinhoContextType = {
    carrinho,
    loading,
    adicionarItem,
    atualizarQuantidade,
    removerItem,
    limparCarrinho,
    finalizarCompra,
    buscarCarrinho
  };

  return (
    <CarrinhoContext.Provider value={value}>
      {children}
    </CarrinhoContext.Provider>
  );
};