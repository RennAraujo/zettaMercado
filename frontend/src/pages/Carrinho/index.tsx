import React, { useEffect, useState } from 'react';
import {
  Container,
  Typography,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  IconButton,
  Button,
  Box,
  CircularProgress,
  Chip,
} from '@mui/material';
import {
  Add as AddIcon,
  Remove as RemoveIcon,
  Delete as DeleteIcon,
  Refresh as RefreshIcon,
} from '@mui/icons-material';
import api from '../../services/api';
import { useAutoRefresh } from '../../hooks/useAutoRefresh';

interface ItemCarrinho {
  id: number;
  produtoId: number;
  quantidade: number;
  produto: {
    id: number;
    nome: string;
    preco: number;
    imagemUrl: string;
  };
}

const Carrinho: React.FC = () => {
  const [itens, setItens] = useState<ItemCarrinho[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [lastUpdate, setLastUpdate] = useState<Date>(new Date());

  const fetchCarrinho = async () => {
    try {
      setError('');
      const response = await api.get('/carrinho');
      setItens(response.data.itens || []);
      setLastUpdate(new Date());
    } catch (err) {
      setError('Erro ao carregar carrinho');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchCarrinho();
  }, []);

  // Auto-refresh a cada 30 segundos
  const { forceRefresh } = useAutoRefresh(fetchCarrinho, {
    interval: 30000,
    enabled: !loading && !error
  });

  const handleUpdateQuantidade = async (itemId: number, quantidade: number) => {
    try {
      await api.put(`/carrinho/itens/${itemId}`, { quantidade });
      fetchCarrinho();
    } catch (err) {
      setError('Erro ao atualizar quantidade');
    }
  };

  const handleRemoverItem = async (itemId: number) => {
    try {
      await api.delete(`/carrinho/itens/${itemId}`);
      fetchCarrinho();
    } catch (err) {
      setError('Erro ao remover item');
    }
  };

  const handleFinalizarCompra = async () => {
    try {
      await api.post('/carrinho/finalizar');
      setItens([]);
    } catch (err) {
      setError('Erro ao finalizar compra');
    }
  };

  const total = itens.reduce(
    (acc, item) => acc + item.produto.preco * item.quantidade,
    0
  );

  if (loading) {
    return (
      <Box
        display="flex"
        justifyContent="center"
        alignItems="center"
        minHeight="80vh"
      >
        <CircularProgress />
      </Box>
    );
  }

  if (error) {
    return (
      <Container>
        <Typography color="error" align="center" variant="h6" sx={{ mt: 4 }}>
          {error}
        </Typography>
      </Container>
    );
  }

  if (itens.length === 0) {
    return (
      <Container>
        <Typography variant="h5" align="center" sx={{ mt: 4 }}>
          Seu carrinho está vazio
        </Typography>
      </Container>
    );
  }

  return (
    <Container>
      <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', mt: 4, mb: 2 }}>
        <Typography variant="h4" component="h1">
          Meu Carrinho
        </Typography>
        <Box sx={{ display: 'flex', alignItems: 'center', gap: 2 }}>
          <Chip 
            label={`Última atualização: ${lastUpdate.toLocaleTimeString()}`}
            size="small"
            color="primary"
            variant="outlined"
          />
          <Button
            variant="outlined"
            size="small"
            startIcon={<RefreshIcon />}
            onClick={forceRefresh}
            disabled={loading}
          >
            Atualizar
          </Button>
        </Box>
      </Box>

      <TableContainer component={Paper}>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell>Produto</TableCell>
              <TableCell align="right">Preço Unit.</TableCell>
              <TableCell align="center">Quantidade</TableCell>
              <TableCell align="right">Subtotal</TableCell>
              <TableCell align="center">Ações</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {itens.map((item) => (
              <TableRow key={item.id}>
                <TableCell component="th" scope="row">
                  <Box sx={{ display: 'flex', alignItems: 'center' }}>
                    <img
                      src={item.produto.imagemUrl || 'https://via.placeholder.com/50'}
                      alt={item.produto.nome}
                      style={{ width: 50, height: 50, marginRight: 10 }}
                    />
                    {item.produto.nome}
                  </Box>
                </TableCell>
                <TableCell align="right">
                  R$ {item.produto.preco.toFixed(2)}
                </TableCell>
                <TableCell align="center">
                  <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                    <IconButton
                      size="small"
                      onClick={() => handleUpdateQuantidade(item.id, item.quantidade - 1)}
                      disabled={item.quantidade <= 1}
                    >
                      <RemoveIcon />
                    </IconButton>
                    <Typography sx={{ mx: 2 }}>{item.quantidade}</Typography>
                    <IconButton
                      size="small"
                      onClick={() => handleUpdateQuantidade(item.id, item.quantidade + 1)}
                    >
                      <AddIcon />
                    </IconButton>
                  </Box>
                </TableCell>
                <TableCell align="right">
                  R$ {(item.produto.preco * item.quantidade).toFixed(2)}
                </TableCell>
                <TableCell align="center">
                  <IconButton
                    color="error"
                    onClick={() => handleRemoverItem(item.id)}
                  >
                    <DeleteIcon />
                  </IconButton>
                </TableCell>
              </TableRow>
            ))}
            <TableRow>
              <TableCell colSpan={3} align="right">
                <Typography variant="h6">Total:</Typography>
              </TableCell>
              <TableCell align="right">
                <Typography variant="h6">R$ {total.toFixed(2)}</Typography>
              </TableCell>
              <TableCell />
            </TableRow>
          </TableBody>
        </Table>
      </TableContainer>

      <Box sx={{ mt: 4, display: 'flex', justifyContent: 'flex-end' }}>
        <Button
          variant="contained"
          size="large"
          onClick={handleFinalizarCompra}
        >
          Finalizar Compra
        </Button>
      </Box>
    </Container>
  );
};

export default Carrinho;