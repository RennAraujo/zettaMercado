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
  TextField,
  MenuItem,
  FormControl,
  InputLabel,
  Select,
  Chip,
  IconButton,
  Badge,
  Snackbar,
  Alert,
} from '@mui/material';
import { 
  Refresh as RefreshIcon, 
  ShoppingCart as ShoppingCartIcon,
  Add as AddIcon,
  Remove as RemoveIcon 
} from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';
import api from '../../services/api';
import { useAutoRefresh } from '../../hooks/useAutoRefresh';
import { useCarrinho } from '../../contexts/CarrinhoContext';

interface Produto {
  id: number;
  nome: string;
  descricao: string;
  preco: number;
  imagemUrl: string;
  categoriaId: number;
  estoque: number;
}

interface Categoria {
  id: number;
  nome: string;
}

const Produtos: React.FC = () => {
  const navigate = useNavigate();
  const [produtos, setProdutos] = useState<Produto[]>([]);
  const [categorias, setCategorias] = useState<Categoria[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [search, setSearch] = useState('');
  const [selectedCategoria, setSelectedCategoria] = useState<number | ''>('');
  const [lastUpdate, setLastUpdate] = useState<Date>(new Date());
  const [snackbar, setSnackbar] = useState({ open: false, message: '', severity: 'success' as 'success' | 'error' });
  const [quantidades, setQuantidades] = useState<{ [key: string]: number }>({});
  const { carrinho, adicionarItem, loading: carrinhoLoading } = useCarrinho();

  const fetchData = async () => {
    try {
      setError('');
      const [produtosResponse, categoriasResponse] = await Promise.all([
        api.get('/produtos'),
        api.get('/categorias'),
      ]);
      setProdutos(produtosResponse.data.content || produtosResponse.data);
      setCategorias(categoriasResponse.data.content || categoriasResponse.data);
      setLastUpdate(new Date());
    } catch (err) {
      setError('Erro ao carregar dados');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  // Auto-refresh a cada 30 segundos
  const { forceRefresh } = useAutoRefresh(fetchData, {
    interval: 30000,
    enabled: !loading && !error
  });

  const handleQuantidadeChange = (produtoId: string, delta: number) => {
    setQuantidades(prev => ({
      ...prev,
      [produtoId]: Math.max(1, (prev[produtoId] || 1) + delta)
    }));
  };

  const handleAdicionarAoCarrinho = async (produto: Produto) => {
    try {
      const quantidade = quantidades[produto.id] || 1;
      await adicionarItem(produto.id.toString(), quantidade);
      setSnackbar({
        open: true,
        message: `${produto.nome} adicionado ao carrinho!`,
        severity: 'success'
      });
      // Reset quantidade após adicionar
      setQuantidades(prev => ({ ...prev, [produto.id]: 1 }));
    } catch (error) {
      setSnackbar({
        open: true,
        message: 'Erro ao adicionar produto ao carrinho',
        severity: 'error'
      });
    }
  };

  const handleCloseSnackbar = () => {
    setSnackbar(prev => ({ ...prev, open: false }));
  };

  const filteredProdutos = produtos.filter((produto) => {
    const matchesSearch = produto.nome.toLowerCase().includes(search.toLowerCase());
    const matchesCategoria = selectedCategoria === '' || produto.categoriaId === selectedCategoria;
    return matchesSearch && matchesCategoria;
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
          Produtos
        </Typography>
        <Box sx={{ display: 'flex', alignItems: 'center', gap: 2 }}>
          <IconButton 
            color="primary" 
            onClick={() => navigate('/carrinho')}
            sx={{ mr: 1 }}
          >
            <Badge badgeContent={carrinho?.quantidadeItens || 0} color="error">
              <ShoppingCartIcon />
            </Badge>
          </IconButton>
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
      <Box sx={{ mb: 4 }}>
        <Grid container spacing={2}>
          <Grid item xs={12} md={6}>
            <TextField
              fullWidth
              label="Buscar produtos"
              variant="outlined"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </Grid>
          <Grid item xs={12} md={6}>
            <FormControl fullWidth>
              <InputLabel>Categoria</InputLabel>
              <Select
                value={selectedCategoria}
                label="Categoria"
                onChange={(e) => setSelectedCategoria(e.target.value as number)}
              >
                <MenuItem value="">Todas</MenuItem>
                {categorias.map((categoria) => (
                  <MenuItem key={categoria.id} value={categoria.id}>
                    {categoria.nome}
                  </MenuItem>
                ))}
              </Select>
            </FormControl>
          </Grid>
        </Grid>
      </Box>

      <Grid container spacing={4}>
        {filteredProdutos.map((produto) => (
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
                <Typography gutterBottom variant="h6" component="div">
                  {produto.nome}
                </Typography>
                <Typography variant="body2" color="text.secondary" sx={{ mb: 2 }}>
                  {produto.descricao}
                </Typography>
                <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', mb: 2 }}>
                  <Typography variant="h6" color="primary">
                    R$ {produto.preco.toFixed(2)}
                  </Typography>
                  <Typography variant="body2" color="text.secondary">
                    Estoque: {produto.estoque}
                  </Typography>
                </Box>
                
                {/* Controles de quantidade */}
                <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center', mb: 2 }}>
                  <IconButton 
                    size="small" 
                    onClick={() => handleQuantidadeChange(produto.id.toString(), -1)}
                    disabled={produto.estoque === 0}
                  >
                    <RemoveIcon />
                  </IconButton>
                  <Typography sx={{ mx: 2, minWidth: '20px', textAlign: 'center' }}>
                    {quantidades[produto.id] || 1}
                  </Typography>
                  <IconButton 
                    size="small" 
                    onClick={() => handleQuantidadeChange(produto.id.toString(), 1)}
                    disabled={produto.estoque === 0 || (quantidades[produto.id] || 1) >= produto.estoque}
                  >
                    <AddIcon />
                  </IconButton>
                </Box>

                <Box sx={{ display: 'flex', gap: 1 }}>
                  <Button 
                    variant="contained" 
                    fullWidth
                    onClick={() => handleAdicionarAoCarrinho(produto)}
                    disabled={produto.estoque === 0 || carrinhoLoading}
                    startIcon={<ShoppingCartIcon />}
                  >
                    {produto.estoque === 0 ? 'Sem Estoque' : 'Adicionar'}
                  </Button>
                  <Button 
                    variant="outlined" 
                    onClick={() => navigate(`/produtos/${produto.id}`)}
                  >
                    Detalhes
                  </Button>
                </Box>
              </CardContent>
            </Card>
          </Grid>
        ))}
      </Grid>

      <Snackbar
        open={snackbar.open}
        autoHideDuration={3000}
        onClose={handleCloseSnackbar}
        anchorOrigin={{ vertical: 'bottom', horizontal: 'center' }}
      >
        <Alert onClose={handleCloseSnackbar} severity={snackbar.severity}>
          {snackbar.message}
        </Alert>
      </Snackbar>
    </Container>
  );
};

export default Produtos;