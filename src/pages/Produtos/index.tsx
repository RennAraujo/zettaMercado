import React from 'react';
import { Container, Typography, Box, Card, CardContent, CardActions, Button } from '@mui/material';
import { useQuery } from '@tanstack/react-query';
import { api } from '../../services/api';

interface Produto {
  id: string;
  nome: string;
  descricao: string;
  preco: number;
  quantidadeEstoque: number;
  categoria: {
    id: string;
    nome: string;
  };
}

const Produtos: React.FC = () => {
  const { data: produtos, isLoading } = useQuery<Produto[]>({
    queryKey: ['produtos'],
    queryFn: async () => {
      const response = await api.get('/produtos');
      return response.data;
    }
  });

  if (isLoading) {
    return <Typography>Carregando...</Typography>;
  }

  return (
    <Container>
      <Typography variant="h4" component="h1" gutterBottom>
        Produtos
      </Typography>
      <Box sx={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(300px, 1fr))', gap: 3 }}>
        {produtos?.map((produto) => (
          <Card key={produto.id}>
            <CardContent>
              <Typography variant="h6" component="h2">
                {produto.nome}
              </Typography>
              <Typography color="textSecondary" gutterBottom>
                {produto.categoria.nome}
              </Typography>
              <Typography variant="body2" component="p">
                {produto.descricao}
              </Typography>
              <Typography variant="h6" color="primary">
                R$ {produto.preco.toFixed(2)}
              </Typography>
              <Typography variant="body2" color="textSecondary">
                Em estoque: {produto.quantidadeEstoque}
              </Typography>
            </CardContent>
            <CardActions>
              <Button size="small" color="primary">
                Adicionar ao Carrinho
              </Button>
            </CardActions>
          </Card>
        ))}
      </Box>
    </Container>
  );
};

export default Produtos; 