import React, { useEffect, useState } from 'react';
import {
  Container,
  Grid,
  Card,
  CardContent,
  CardMedia,
  Typography,
  Button,
  Box,
  CircularProgress,
  Chip,
} from '@mui/material';
import { Refresh as RefreshIcon } from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';
import api from '../../services/api';
import { useAutoRefresh } from '../../hooks/useAutoRefresh';

interface Produto {
  id: number;
  nome: string;
  descricao: string;
  preco: number;
  imagemUrl: string;
}

const Home: React.FC = () => {
  const navigate = useNavigate();
  const [produtos, setProdutos] = useState<Produto[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [lastUpdate, setLastUpdate] = useState<Date>(new Date());

  const fetchProdutos = async () => {
    try {
      setError('');
      const response = await api.get('/produtos');
      setProdutos(response.data);
      setLastUpdate(new Date());
    } catch (err) {
      setError('Erro ao carregar produtos');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchProdutos();
  }, []);

  // Auto-refresh a cada 30 segundos
  const { forceRefresh } = useAutoRefresh(fetchProdutos, {
    interval: 30000,
    enabled: !loading && !error
  });

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

  return (
    <Container>
      <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', mt: 4, mb: 2 }}>
        <Typography variant="h4" component="h1">
          Produtos em Destaque
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
      <Grid container spacing={4}>
        {produtos.map((produto) => (
          <Grid item key={produto.id} xs={12} sm={6} md={4}>
            <Card
              sx={{
                height: '100%',
                display: 'flex',
                flexDirection: 'column',
              }}
            >
              <CardMedia
                component="img"
                height="200"
                image={produto.imagemUrl || 'https://via.placeholder.com/200'}
                alt={produto.nome}
              />
              <CardContent sx={{ flexGrow: 1 }}>
                <Typography gutterBottom variant="h5" component="h2">
                  {produto.nome}
                </Typography>
                <Typography>
                  {produto.descricao}
                </Typography>
                <Typography variant="h6" color="primary" sx={{ mt: 2 }}>
                  R$ {produto.preco.toFixed(2)}
                </Typography>
              </CardContent>
              <Box sx={{ p: 2 }}>
                <Button
                  variant="contained"
                  fullWidth
                  onClick={() => navigate(`/produtos/${produto.id}`)}
                >
                  Ver Detalhes
                </Button>
              </Box>
            </Card>
          </Grid>
        ))}
      </Grid>
    </Container>
  );
};

export default Home;