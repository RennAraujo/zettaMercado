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
  Paper,
  Fade,
  Skeleton,
} from '@mui/material';
import { 
  Refresh as RefreshIcon,
  ArrowForward as ArrowForwardIcon,
  LocalOffer as OfferIcon,
} from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';
import api from '../../services/api';
import { useAutoRefresh } from '../../hooks/useAutoRefresh';
import ProductImage from '../../components/ProductImage';

interface Produto {
  id: number;
  nome: string;
  descricao: string;
  preco: number;
  imagemUrl: string;
  categoriaNome?: string;
}

interface Produto {
  id: number;
  nome: string;
  descricao: string;
  preco: number;
  imagemUrl: string;
  categoriaNome?: string;
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
      const response = await api.get('/produtos?size=8');
      setProdutos(response.data.content || response.data);
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
      <Container maxWidth="xl" sx={{ py: 4 }}>
        <Skeleton variant="rectangular" height={200} sx={{ borderRadius: 3, mb: 4 }} />
        <Grid container spacing={3}>
          {[1, 2, 3, 4].map((i) => (
            <Grid item key={i} xs={12} sm={6} md={3}>
              <Skeleton variant="rectangular" height={300} sx={{ borderRadius: 3 }} />
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
        {/* Hero Banner */}
        <Paper
          elevation={0}
          sx={{
            position: 'relative',
            borderRadius: 4,
            overflow: 'hidden',
            mb: 4,
            background: 'linear-gradient(135deg, #EA1D2C 0%, #FF6B6B 50%, #FFB500 100%)',
            minHeight: 280,
            display: 'flex',
            alignItems: 'center',
          }}
        >
          <Box
            sx={{
              position: 'absolute',
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              background: 'url("data:image/svg+xml,%3Csvg width=\'60\' height=\'60\' viewBox=\'0 0 60 60\' xmlns=\'http://www.w3.org/2000/svg\'%3E%3Cg fill=\'none\' fill-rule=\'evenodd\'%3E%3Cg fill=\'%23ffffff\' fill-opacity=\'0.08\'%3E%3Cpath d=\'M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z\'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E")',
              opacity: 0.5,
            }}
          />
          
          <Box sx={{ position: 'relative', p: { xs: 3, md: 5 }, maxWidth: 600 }}>
            <Chip 
              icon={<OfferIcon />}
              label="Ofertas Especiais" 
              sx={{ 
                mb: 2, 
                backgroundColor: 'rgba(255,255,255,0.9)',
                color: '#EA1D2C',
                fontWeight: 600,
              }} 
            />
            <Typography 
              variant="h3" 
              sx={{ 
                color: 'white', 
                fontWeight: 800,
                mb: 2,
                textShadow: '0 2px 4px rgba(0,0,0,0.2)',
                fontSize: { xs: '1.75rem', md: '2.5rem' },
              }}
            >
              Bem-vindo ao Zetta Mercado! 🛒
            </Typography>
            <Typography 
              variant="h6" 
              sx={{ 
                color: 'rgba(255,255,255,0.95)', 
                mb: 3,
                fontWeight: 400,
              }}
            >
              Os melhores produtos com entrega rápida e preços incríveis
            </Typography>
            <Button
              variant="contained"
              size="large"
              endIcon={<ArrowForwardIcon />}
              onClick={() => navigate('/produtos')}
              sx={{
                backgroundColor: 'white',
                color: '#EA1D2C',
                fontWeight: 700,
                px: 4,
                py: 1.5,
                borderRadius: 3,
                '&:hover': {
                  backgroundColor: 'rgba(255,255,255,0.9)',
                  transform: 'translateX(4px)',
                },
                transition: 'all 0.3s ease',
              }}
            >
              Ver Todos os Produtos
            </Button>
          </Box>
        </Paper>

        {/* Header da seção */}
        <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', mb: 3 }}>
          <Box>
            <Typography variant="h4" component="h1" sx={{ fontWeight: 700, mb: 0.5 }}>
              Produtos em Destaque
            </Typography>
            <Typography variant="body1" color="text.secondary">
              Confira nossas ofertas especiais
            </Typography>
          </Box>
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 2 }}>
            <Chip 
              label={`Atualizado: ${lastUpdate.toLocaleTimeString()}`}
              size="small"
              variant="outlined"
              sx={{ borderRadius: 2 }}
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

        {/* Grid de produtos */}
        <Grid container spacing={3}>
          {produtos.slice(0, 8).map((produto, index) => (
            <Grid item key={produto.id} xs={12} sm={6} md={4} lg={3}>
              <Card
                sx={{
                  height: '100%',
                  display: 'flex',
                  flexDirection: 'column',
                  cursor: 'pointer',
                  transition: 'all 0.3s cubic-bezier(0.4, 0, 0.2, 1)',
                  '&:hover': {
                    transform: 'translateY(-8px)',
                    boxShadow: '0 12px 40px rgba(234, 29, 44, 0.15)',
                  },
                }}
                onClick={() => navigate(`/produtos/${produto.id}`)}
              >
                <Box sx={{ position: 'relative' }}>
                  <ProductImage
                    src={produto.imagemUrl}
                    alt={produto.nome}
                    height={200}
                  />
                  {produto.preco < 10 && (
                    <Chip
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
                
                <CardContent sx={{ flexGrow: 1, p: 2.5 }}>
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
                      display: '-webkit-box',
                      WebkitLineClamp: 2,
                      WebkitBoxOrient: 'vertical',
                      overflow: 'hidden',
                      minHeight: '2.6rem',
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
                      minHeight: '2.5rem',
                      mb: 2,
                    }}
                  >
                    {produto.descricao}
                  </Typography>
                  
                  <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
                    <Typography 
                      variant="h5" 
                      sx={{ 
                        fontWeight: 700,
                        color: '#EA1D2C',
                      }}
                    >
                      R$ {produto.preco.toFixed(2)}
                    </Typography>
                    <Button
                      variant="contained"
                      size="small"
                      sx={{
                        minWidth: 'auto',
                        px: 2,
                        py: 0.75,
                        borderRadius: 2,
                      }}
                    >
                      Ver
                    </Button>
                  </Box>
                </CardContent>
              </Card>
            </Grid>
          ))}
        </Grid>

        {/* Ver mais */}
        <Box sx={{ textAlign: 'center', mt: 5 }}>
          <Button
            variant="outlined"
            size="large"
            endIcon={<ArrowForwardIcon />}
            onClick={() => navigate('/produtos')}
            sx={{
              px: 5,
              py: 1.5,
              borderWidth: 2,
              '&:hover': {
                borderWidth: 2,
                backgroundColor: 'rgba(234, 29, 44, 0.04)',
              },
            }}
          >
            Ver Todos os Produtos
          </Button>
        </Box>
      </Container>
    </Fade>
  );
};

export default Home;