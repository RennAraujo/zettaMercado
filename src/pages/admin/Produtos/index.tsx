import React from 'react';
import { Container, Typography, Box, Button, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper, IconButton } from '@mui/material';
import { Edit as EditIcon, Delete as DeleteIcon } from '@mui/icons-material';
import { useQuery } from '@tanstack/react-query';
import { api } from '../../../services/api';

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

const AdminProdutos: React.FC = () => {
  const { data: produtos, isLoading } = useQuery<Produto[]>({
    queryKey: ['admin-produtos'],
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
      <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', mb: 3 }}>
        <Typography variant="h4" component="h1">
          Gerenciar Produtos
        </Typography>
        <Button variant="contained" color="primary">
          Novo Produto
        </Button>
      </Box>
      <TableContainer component={Paper}>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell>Nome</TableCell>
              <TableCell>Categoria</TableCell>
              <TableCell align="right">Preço</TableCell>
              <TableCell align="right">Estoque</TableCell>
              <TableCell align="center">Ações</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {produtos?.map((produto) => (
              <TableRow key={produto.id}>
                <TableCell>{produto.nome}</TableCell>
                <TableCell>{produto.categoria.nome}</TableCell>
                <TableCell align="right">R$ {produto.preco.toFixed(2)}</TableCell>
                <TableCell align="right">{produto.quantidadeEstoque}</TableCell>
                <TableCell align="center">
                  <IconButton color="primary" size="small">
                    <EditIcon />
                  </IconButton>
                  <IconButton color="error" size="small">
                    <DeleteIcon />
                  </IconButton>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </Container>
  );
};

export default AdminProdutos; 