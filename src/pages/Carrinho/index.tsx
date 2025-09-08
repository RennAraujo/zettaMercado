import React from 'react';
import { Container, Typography, Box, Card, CardContent, IconButton, Button } from '@mui/material';
import { Delete as DeleteIcon } from '@mui/icons-material';
import { useQuery } from '@tanstack/react-query';
import { api } from '../../services/api';

interface ItemCarrinho {
  id: string;
  produto: {
    id: string;
    nome: string;
    preco: number;
  };
  quantidade: number;
  precoUnitario: number;
}

interface Carrinho {
  id: string;
  itens: ItemCarrinho[];
  valorTotal: number;
  quantidadeItens: number;
}

const Carrinho: React.FC = () => {
  const { data: carrinho, isLoading } = useQuery<Carrinho>({
    queryKey: ['carrinho'],
    queryFn: async () => {
      const response = await api.get('/carrinho');
      return response.data;
    }
  });

  if (isLoading) {
    return <Typography>Carregando...</Typography>;
  }

  return (
    <Container>
      <Typography variant="h4" component="h1" gutterBottom>
        Carrinho
      </Typography>
      <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2 }}>
        {carrinho?.itens.map((item) => (
          <Card key={item.id}>
            <CardContent sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <Box>
                <Typography variant="h6">{item.produto.nome}</Typography>
                <Typography color="textSecondary">
                  Quantidade: {item.quantidade} | Preço unitário: R$ {item.precoUnitario.toFixed(2)}
                </Typography>
              </Box>
              <IconButton color="error">
                <DeleteIcon />
              </IconButton>
            </CardContent>
          </Card>
        ))}
      </Box>
      <Box sx={{ mt: 3, textAlign: 'right' }}>
        <Typography variant="h6" gutterBottom>
          Total de itens: {carrinho?.quantidadeItens || 0}
        </Typography>
        <Typography variant="h5" gutterBottom>
          Total: R$ {carrinho?.valorTotal.toFixed(2) || '0.00'}
        </Typography>
        <Button
          variant="contained"
          color="primary"
          fullWidth
          disabled={!carrinho?.itens.length}
          sx={{ mt: 2 }}
        >
          Finalizar Compra
        </Button>
      </Box>
    </Container>
  );
};

export default Carrinho; 