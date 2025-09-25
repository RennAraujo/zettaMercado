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
  Paper,
  Fade,
  Zoom,
  CardActions,
  Divider,
} from '@mui/material';
import { 
  Refresh as RefreshIcon, 
  ShoppingCart as ShoppingCartIcon,
  Add as AddIcon,
  Remove as RemoveIcon,
  Search as SearchIcon,
  FilterList as FilterIcon,
  LocalOffer as OfferIcon,
  Star as StarIcon,
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
    <Container maxWidth="xl">
      {/* Header moderno */}
      <Paper 
        elevation={0} 
        sx={{ 
          background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
          color: 'white',
          p: 4,
          borderRadius: 3,
          mb: 4,
          mt: 2
        }}
      >
        <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
          <Box>
            <Typography variant="h3" component="h1" sx={{ fontWeight: 'bold', mb: 1 }}>
              🛒 Nossos Produtos
            </Typography>
            <Typography variant="h6" sx={{ opacity: 0.9 }}>
              Descubra os melhores produtos com preços incríveis
            </Typography>
          </Box>
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 2 }}>
            <IconButton 
              onClick={() => navigate('/carrinho')}
              sx={{ 
                bgcolor: 'rgba(255,255,255,0.2)', 
                color: 'white',
                '&:hover': { bgcolor: 'rgba(255,255,255,0.3)' }
              }}
            >
              <Badge badgeContent={carrinho?.quantidadeItens || 0} color="error">
                <ShoppingCartIcon />
              </Badge>
            </IconButton>
            <Chip 
              label={`Atualizado: ${lastUpdate.toLocaleTimeString()}`}
              size="small"
              sx={{ bgcolor: 'rgba(255,255,255,0.2)', color: 'white' }}
            />
            <Button
              variant="contained"
              size="small"
              startIcon={<RefreshIcon />}
              onClick={forceRefresh}
              disabled={loading}
              sx={{ 
                bgcolor: 'rgba(255,255,255,0.2)',
                '&:hover': { bgcolor: 'rgba(255,255,255,0.3)' }
              }}
            >
              Atualizar
            </Button>
          </Box>
        </Box>
      </Paper>
      {/* Filtros modernos */}
      <Paper elevation={2} sx={{ p: 3, mb: 4, borderRadius: 2 }}>
        <Box sx={{ display: 'flex', alignItems: 'center', mb: 2 }}>
          <FilterIcon sx={{ mr: 1, color: 'primary.main' }} />
          <Typography variant="h6" sx={{ fontWeight: 'bold' }}>
            Filtros
          </Typography>
        </Box>
        <Grid container spacing={3}>
          <Grid item xs={12} md={8}>
            <TextField
              fullWidth
              label="Buscar produtos"
              variant="outlined"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              InputProps={{
                startAdornment: <SearchIcon sx={{ color: 'action.active', mr: 1 }} />,
              }}
              sx={{
                '& .MuiOutlinedInput-root': {
                  borderRadius: 2,
                  '&:hover fieldset': {
                    borderColor: 'primary.main',
                  },
                },
              }}
            />
          </Grid>
          <Grid item xs={12} md={4}>
            <FormControl fullWidth>
              <InputLabel>Categoria</InputLabel>
              <Select
                value={selectedCategoria}
                label="Categoria"
                onChange={(e) => setSelectedCategoria(e.target.value as number)}
                sx={{ borderRadius: 2 }}
              >
                <MenuItem value="">🏪 Todas as Categorias</MenuItem>
                {categorias.map((categoria) => (
                  <MenuItem key={categoria.id} value={categoria.id}>
                    📦 {categoria.nome}
                  </MenuItem>
                ))}
              </Select>
            </FormControl>
          </Grid>
        </Grid>
      </Paper>

      {/* Grid de produtos com animações */}
      <Grid container spacing={3}>
        {filteredProdutos.map((produto, index) => (
          <Grid item key={produto.id} xs={12} sm={6} md={4} lg={3}>
            <Zoom in={true} style={{ transitionDelay: `${index * 100}ms` }}>
              <Card
                sx={{
                  height: '100%',
                  display: 'flex',
                  flexDirection: 'column',
                  borderRadius: 3,
                  overflow: 'hidden',
                  transition: 'all 0.3s ease-in-out',
                  '&:hover': {
                    transform: 'translateY(-8px)',
                    boxShadow: '0 12px 40px rgba(0,0,0,0.15)',
                  },
                  position: 'relative',
                }}
              >
                {/* Badge de oferta */}
                {produto.preco < 10 && (
                  <Box
                    sx={{
                      position: 'absolute',
                      top: 12,
                      right: 12,
                      bgcolor: 'error.main',
                      color: 'white',
                      px: 1.5,
                      py: 0.5,
                      borderRadius: 2,
                      fontSize: '0.75rem',
                      fontWeight: 'bold',
                      zIndex: 1,
                      display: 'flex',
                      alignItems: 'center',
                      gap: 0.5,
                    }}
                  >
                    <OfferIcon sx={{ fontSize: 14 }} />
                    OFERTA
                  </Box>
                )}
                
                <CardMedia
                  component="img"
                  height="220"
                  image={produto.imagemUrl || 'https://via.placeholder.com/300x220/f5f5f5/999999?text=Produto'}
                  alt={produto.nome}
                  sx={{
                    objectFit: 'cover',
                    transition: 'transform 0.3s ease-in-out',
                    '&:hover': {
                      transform: 'scale(1.05)',
                    },
                  }}
                />
                
                <CardContent sx={{ flexGrow: 1, p: 2.5 }}>
                  <Typography 
                    gutterBottom 
                    variant="h6" 
                    component="div"
                    sx={{ 
                      fontWeight: 'bold',
                      fontSize: '1.1rem',
                      lineHeight: 1.3,
                      mb: 1,
                      minHeight: '2.6rem',
                      display: '-webkit-box',
                      WebkitLineClamp: 2,
                      WebkitBoxOrient: 'vertical',
                      overflow: 'hidden',
                    }}
                  >
                    {produto.nome}
                  </Typography>
                  
                  <Typography 
                    variant="body2" 
                    color="text.secondary" 
                    sx={{ 
                      mb: 2,
                      minHeight: '2.5rem',
                      display: '-webkit-box',
                      WebkitLineClamp: 2,
                      WebkitBoxOrient: 'vertical',
                      overflow: 'hidden',
                    }}
                  >
                    {produto.descricao}
                  </Typography>
                  
                  <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', mb: 2 }}>
                    <Typography 
                      variant="h5" 
                      sx={{ 
                        fontWeight: 'bold',
                        color: 'primary.main',
                        fontSize: '1.4rem',
                      }}
                    >
                      R$ {produto.preco.toFixed(2)}
                    </Typography>
                    <Chip
                      label={`${produto.estoque} em estoque`}
                      size="small"
                      color={produto.estoque > 10 ? 'success' : produto.estoque > 0 ? 'warning' : 'error'}
                      variant="outlined"
                    />
                  </Box>
                  
                  {/* Avaliação fictícia */}
                  <Box sx={{ display: 'flex', alignItems: 'center', mb: 2 }}>
                    {[1, 2, 3, 4, 5].map((star) => (
                      <StarIcon 
                        key={star} 
                        sx={{ 
                          fontSize: 16, 
                          color: star <= 4 ? 'warning.main' : 'grey.300' 
                        }} 
                      />
                    ))}
                    <Typography variant="body2" sx={{ ml: 1, color: 'text.secondary' }}>
                      (4.0)
                    </Typography>
                  </Box>
                </CardContent>
                
                <Divider />
                
                <CardActions sx={{ p: 2.5, pt: 2 }}>
                  {/* Controles de quantidade modernos */}
                  <Box sx={{ display: 'flex', alignItems: 'center', mb: 2, width: '100%', justifyContent: 'center' }}>
                    <IconButton 
                      size="small" 
                      onClick={() => handleQuantidadeChange(produto.id.toString(), -1)}
                      disabled={produto.estoque === 0}
                      sx={{
                        bgcolor: 'grey.100',
                        '&:hover': { bgcolor: 'grey.200' },
                        '&:disabled': { bgcolor: 'grey.50' },
                      }}
                    >
                      <RemoveIcon fontSize="small" />
                    </IconButton>
                    <Typography 
                      sx={{ 
                        mx: 3, 
                        minWidth: '30px', 
                        textAlign: 'center',
                        fontWeight: 'bold',
                        fontSize: '1.1rem',
                      }}
                    >
                      {quantidades[produto.id] || 1}
                    </Typography>
                    <IconButton 
                      size="small" 
                      onClick={() => handleQuantidadeChange(produto.id.toString(), 1)}
                      disabled={produto.estoque === 0 || (quantidades[produto.id] || 1) >= produto.estoque}
                      sx={{
                        bgcolor: 'grey.100',
                        '&:hover': { bgcolor: 'grey.200' },
                        '&:disabled': { bgcolor: 'grey.50' },
                      }}
                    >
                      <AddIcon fontSize="small" />
                    </IconButton>
                  </Box>

                  <Button 
                    variant="contained" 
                    fullWidth
                    onClick={() => handleAdicionarAoCarrinho(produto)}
                    disabled={produto.estoque === 0 || carrinhoLoading}
                    startIcon={<ShoppingCartIcon />}
                    sx={{
                      py: 1.2,
                      borderRadius: 2,
                      fontWeight: 'bold',
                      fontSize: '0.9rem',
                      background: produto.estoque === 0 
                        ? 'grey.400' 
                        : 'linear-gradient(45deg, #2196F3 30%, #21CBF3 90%)',
                      '&:hover': {
                        background: produto.estoque === 0 
                          ? 'grey.400' 
                          : 'linear-gradient(45deg, #1976D2 30%, #1CB5E0 90%)',
                      },
                    }}
                  >
                    {produto.estoque === 0 ? '❌ Sem Estoque' : '🛒 Adicionar ao Carrinho'}
                  </Button>
                </CardActions>
              </Card>
            </Zoom>
          </Grid>
        ))}
      </Grid>
      
      {/* Mensagem quando não há produtos */}
      {filteredProdutos.length === 0 && (
        <Paper 
          elevation={0} 
          sx={{ 
            p: 6, 
            textAlign: 'center', 
            bgcolor: 'grey.50',
            borderRadius: 3,
          }}
        >
          <Typography variant="h5" sx={{ mb: 2, color: 'text.secondary' }}>
            🔍 Nenhum produto encontrado
          </Typography>
          <Typography variant="body1" color="text.secondary">
            Tente ajustar os filtros ou buscar por outros termos
          </Typography>
        </Paper>
      )}

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