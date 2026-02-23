import React, { useEffect, useState } from 'react';
import {
  Container,
  Typography,
  Grid,
  Card,
  CardContent,
  Button,
  Box,
  TextField,
  FormControl,
  InputLabel,
  Select,
  MenuItem,
  Chip,
  Badge,
  IconButton,
  Snackbar,
  Alert,
  Paper,
  Fade,
  Skeleton,
  ToggleButtonGroup,
  ToggleButton,
  InputAdornment,
} from '@mui/material';
import { 
  Refresh as RefreshIcon, 
  ShoppingCart as ShoppingCartIcon,
  Add as AddIcon,
  Remove as RemoveIcon,
  Search as SearchIcon,
  GridView as GridViewIcon,
  ViewList as ViewListIcon,
  FilterList as FilterIcon,
  LocalOffer as OfferIcon,
  Star as StarIcon,
  Visibility as VisibilityIcon,
  ArrowBack as ArrowBackIcon,
} from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';
import api from '../../services/api';
import { useAutoRefresh } from '../../hooks/useAutoRefresh';
import { useCarrinho } from '../../contexts/CarrinhoContext';
import ProdutoDetalhesModal from '../../components/ProdutoDetalhesModal';
import ProductImage from '../../components/ProductImage';

interface Produto {
  id: string;
  nome: string;
  descricao: string;
  preco: number;
  imagemUrl?: string;
  categoriaId: number;
  estoque: number;
  categoriaNome?: string;
  codigoBarras?: string;
  status: string;
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
  const [viewMode, setViewMode] = useState<'grid' | 'list'>('grid');
  const [snackbar, setSnackbar] = useState({ open: false, message: '', severity: 'success' as 'success' | 'error' });
  const [quantidades, setQuantidades] = useState<{ [key: string]: number }>({});
  const [modalProduto, setModalProduto] = useState<Produto | null>(null);
  const [modalOpen, setModalOpen] = useState(false);
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

  const handleAbrirDetalhes = (produto: Produto) => {
    setModalProduto(produto);
    setModalOpen(true);
  };

  const handleFecharModal = () => {
    setModalOpen(false);
    setModalProduto(null);
  };

  const handleAdicionarDoModal = async (produto: Produto, quantidade: number) => {
    try {
      await adicionarItem(produto.id.toString(), quantidade);
      setSnackbar({
        open: true,
        message: `${quantidade}x ${produto.nome} adicionado ao carrinho!`,
        severity: 'success'
      });
    } catch (error) {
      setSnackbar({
        open: true,
        message: 'Erro ao adicionar produto ao carrinho',
        severity: 'error'
      });
    }
  };

  const filteredProdutos = produtos.filter((produto) => {
    const matchesSearch = produto.nome.toLowerCase().includes(search.toLowerCase());
    const matchesCategoria = selectedCategoria === '' || produto.categoriaId === selectedCategoria;
    return matchesSearch && matchesCategoria;
  });

  if (loading) {
    return (
      <Container maxWidth="xl" sx={{ py: 4 }}>
        <Skeleton variant="rectangular" height={120} sx={{ borderRadius: 3, mb: 3 }} />
        <Skeleton variant="rectangular" height={80} sx={{ borderRadius: 3, mb: 3 }} />
        <Grid container spacing={3}>
          {[1, 2, 3, 4, 5, 6].map((i) => (
            <Grid item key={i} xs={12} sm={6} md={4}>
              <Skeleton variant="rectangular" height={350} sx={{ borderRadius: 3 }} />
            </Grid>
          ))}
        </Grid>
      </Container>
    );
  }

  if (error) {
    return (
      <Container maxWidth="xl" sx={{ py: 8 }}>
        <Paper 
          elevation={0} 
          sx={{ 
            p: 6, 
            textAlign: 'center',
            borderRadius: 3,
            background: 'linear-gradient(135deg, #fff5f5 0%, #ffe0e0 100%)',
          }}
        >
          <Typography variant="h5" sx={{ color: '#EA1D2C', mb: 2, fontWeight: 600 }}>
            😕 Ops! Algo deu errado
          </Typography>
          <Typography color="text.secondary" sx={{ mb: 3 }}>
            {error}
          </Typography>
          <Button 
            variant="contained" 
            onClick={forceRefresh}
            startIcon={<RefreshIcon />}
          >
            Tentar Novamente
          </Button>
        </Paper>
      </Container>
    );
  }

  return (
    <Fade in={true}>
      <Container maxWidth="xl" sx={{ py: 3 }}>
        {/* Header */}
        <Paper 
          elevation={0} 
          sx={{ 
            p: { xs: 3, md: 4 },
            borderRadius: 3,
            mb: 3,
            background: 'linear-gradient(135deg, #EA1D2C 0%, #FF6B6B 100%)',
            color: 'white',
          }}
        >
          <Box sx={{ display: 'flex', alignItems: 'center', mb: 2 }}>
            <IconButton 
              onClick={() => navigate('/home')}
              sx={{ color: 'white', mr: 2, '&:hover': { bgcolor: 'rgba(255,255,255,0.1)' } }}
            >
              <ArrowBackIcon />
            </IconButton>
            <Typography variant="h4" component="h1" sx={{ fontWeight: 700 }}>
              🛒 Todos os Produtos
            </Typography>
          </Box>
          <Typography variant="h6" sx={{ opacity: 0.9, fontWeight: 400 }}>
            {produtos.length} produtos disponíveis em {categorias.length} categorias
          </Typography>
        </Paper>

        {/* Filtros */}
        <Paper elevation={2} sx={{ p: 3, mb: 3, borderRadius: 3 }}>
          <Box sx={{ display: 'flex', alignItems: 'center', mb: 3 }}>
            <FilterIcon sx={{ mr: 1, color: '#EA1D2C' }} />
            <Typography variant="h6" sx={{ fontWeight: 600 }}>
              Filtros
            </Typography>
            <Box sx={{ flexGrow: 1 }} />
            
            {/* Toggle View Mode */}
            <ToggleButtonGroup
              value={viewMode}
              exclusive
              onChange={(e, value) => value && setViewMode(value)}
              size="small"
              sx={{ mr: 2 }}
            >
              <ToggleButton value="grid">
                <GridViewIcon />
              </ToggleButton>
              <ToggleButton value="list">
                <ViewListIcon />
              </ToggleButton>
            </ToggleButtonGroup>

            <IconButton 
              onClick={() => navigate('/carrinho')}
              sx={{ 
                bgcolor: 'rgba(234, 29, 44, 0.08)', 
                color: '#EA1D2C',
                '&:hover': { bgcolor: 'rgba(234, 29, 44, 0.12)' }
              }}
            >
              <Badge badgeContent={carrinho?.quantidadeItens || 0} color="primary">
                <ShoppingCartIcon />
              </Badge>
            </IconButton>
          </Box>

          <Grid container spacing={3} alignItems="center">
            <Grid item xs={12} md={6}>
              <TextField
                fullWidth
                placeholder="Buscar produtos..."
                value={search}
                onChange={(e) => setSearch(e.target.value)}
                InputProps={{
                  startAdornment: (
                    <InputAdornment position="start">
                      <SearchIcon sx={{ color: '#717171' }} />
                    </InputAdornment>
                  ),
                }}
                sx={{
                  '& .MuiOutlinedInput-root': {
                    borderRadius: 2,
                    backgroundColor: '#f5f5f5',
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
                  <MenuItem value="">Todas as Categorias</MenuItem>
                  {categorias.map((categoria) => (
                    <MenuItem key={categoria.id} value={categoria.id}>
                      {categoria.nome}
                    </MenuItem>
                  ))}
                </Select>
              </FormControl>
            </Grid>
            <Grid item xs={12} md={2}>
              <Button
                variant="outlined"
                fullWidth
                startIcon={<RefreshIcon />}
                onClick={forceRefresh}
                disabled={loading}
              >
                Atualizar
              </Button>
            </Grid>
          </Grid>

          {/* Resultados */}
          <Box sx={{ mt: 2, display: 'flex', alignItems: 'center', gap: 2 }}>
            <Chip 
              label={`${filteredProdutos.length} produtos encontrados`}
              size="small"
              color="primary"
            />
            <Chip 
              label={`Atualizado: ${lastUpdate.toLocaleTimeString()}`}
              size="small"
              variant="outlined"
            />
          </Box>
        </Paper>

        {/* Grid de produtos */}
        <Grid container spacing={3}>
          {filteredProdutos.map((produto, index) => (
            <Grid item key={produto.id} xs={12} sm={viewMode === 'grid' ? 6 : 12} md={viewMode === 'grid' ? 4 : 12} lg={viewMode === 'grid' ? 3 : 12}>
              <Card
                sx={{
                  height: '100%',
                  display: 'flex',
                  flexDirection: viewMode === 'list' ? 'row' : 'column',
                  transition: 'all 0.3s cubic-bezier(0.4, 0, 0.2, 1)',
                  '&:hover': {
                    transform: 'translateY(-4px)',
                    boxShadow: '0 12px 40px rgba(234, 29, 44, 0.12)',
                  },
                }}
              >
                {/* Imagem */}
                <Box sx={{ position: 'relative', width: viewMode === 'list' ? 200 : '100%' }}>
                  <ProductImage
                    src={produto.imagemUrl}
                    alt={produto.nome}
                    height={viewMode === 'list' ? 180 : 200}
                  />
                  {produto.preco < 10 && (
                    <Chip
                      icon={<OfferIcon sx={{ fontSize: 14 }} />}
                      label="OFERTA"
                      size="small"
                      sx={{
                        position: 'absolute',
                        top: 12,
                        right: 12,
                        backgroundColor: '#FFB500',
                        color: '#1A1A1A',
                        fontWeight: 700,
                        fontSize: '0.7rem',
                      }}
                    />
                  )}
                </Box>

                {/* Conteúdo */}
                <CardContent sx={{ flexGrow: 1, p: 2.5, display: 'flex', flexDirection: 'column' }}>
                  <Box sx={{ flexGrow: 1 }}>
                    {produto.categoriaNome && (
                      <Typography 
                        variant="caption" 
                        sx={{ 
                          color: '#EA1D2C', 
                          fontWeight: 600,
                          textTransform: 'uppercase',
                          letterSpacing: '0.05em',
                        }}
                      >
                        {produto.categoriaNome}
                      </Typography>
                    )}
                    
                    <Typography 
                      gutterBottom 
                      variant="h6" 
                      component="h2"
                      sx={{ 
                        fontWeight: 600,
                        fontSize: '1rem',
                        lineHeight: 1.3,
                        mt: 0.5,
                      }}
                    >
                      {produto.nome}
                    </Typography>
                    
                    <Typography 
                      variant="body2" 
                      color="text.secondary"
                      sx={{
                        display: '-webkit-box',
                        WebkitLineClamp: 2,
                        WebkitBoxOrient: 'vertical',
                        overflow: 'hidden',
                        mb: 2,
                      }}
                    >
                      {produto.descricao}
                    </Typography>
                  </Box>

                  {/* Preço e Estoque */}
                  <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', mb: 2 }}>
                    <Typography 
                      variant="h5" 
                      sx={{ 
                        fontWeight: 700,
                        color: '#EA1D2C',
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

                  {/* Controles */}
                  <Box sx={{ display: 'flex', alignItems: 'center', gap: 1 }}>
                    <Box sx={{ display: 'flex', alignItems: 'center', bgcolor: '#f5f5f5', borderRadius: 2, px: 1 }}>
                      <IconButton 
                        size="small" 
                        onClick={() => handleQuantidadeChange(produto.id.toString(), -1)}
                        disabled={produto.estoque === 0}
                      >
                        <RemoveIcon fontSize="small" />
                      </IconButton>
                      <Typography sx={{ mx: 1.5, minWidth: '20px', textAlign: 'center', fontWeight: 600 }}>
                        {quantidades[produto.id] || 1}
                      </Typography>
                      <IconButton 
                        size="small" 
                        onClick={() => handleQuantidadeChange(produto.id.toString(), 1)}
                        disabled={produto.estoque === 0 || (quantidades[produto.id] || 1) >= produto.estoque}
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
                        py: 1,
                        fontWeight: 600,
                      }}
                    >
                      {produto.estoque === 0 ? 'Esgotado' : 'Adicionar'}
                    </Button>
                  </Box>
                </CardContent>
              </Card>
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
              borderRadius: 3,
              mt: 4,
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

        {/* Modal de Detalhes */}
        <ProdutoDetalhesModal
          produto={modalProduto}
          open={modalOpen}
          onClose={handleFecharModal}
          onAdicionarAoCarrinho={handleAdicionarDoModal}
          carrinhoLoading={carrinhoLoading}
        />
      </Container>
    </Fade>
  );
};

export default Produtos;