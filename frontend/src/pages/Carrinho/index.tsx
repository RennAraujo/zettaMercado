import React, { useState } from 'react';
import {
  Container,
  Typography,
  Box,
  Card,
  CardContent,
  Grid,
  Button,
  IconButton,
  Divider,
  Paper,
  Fade,
  Skeleton,
  Chip,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Snackbar,
  Alert,
} from '@mui/material';
import {
  Add as AddIcon,
  Remove as RemoveIcon,
  Delete as DeleteIcon,
  ShoppingCart as ShoppingCartIcon,
  ArrowBack as ArrowBackIcon,
  LocalShipping as ShippingIcon,
  Payment as PaymentIcon,
  CheckCircle as CheckCircleIcon,
} from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';
import { useCarrinho } from '../../contexts/CarrinhoContext';
import ProductImage from '../../components/ProductImage';

const Carrinho: React.FC = () => {
  const navigate = useNavigate();
  const { 
    carrinho, 
    loading, 
    atualizarQuantidade, 
    removerItem, 
    limparCarrinho, 
    finalizarCompra 
  } = useCarrinho();
  
  const [dialogOpen, setDialogOpen] = useState(false);
  const [snackbar, setSnackbar] = useState({ open: false, message: '', severity: 'success' as 'success' | 'error' });

  const handleQuantidadeChange = async (itemId: string, novaQuantidade: number) => {
    if (novaQuantidade < 1) return;
    
    try {
      await atualizarQuantidade(itemId, novaQuantidade);
    } catch (error) {
      setSnackbar({
        open: true,
        message: 'Erro ao atualizar quantidade',
        severity: 'error'
      });
    }
  };

  const handleRemoverItem = async (itemId: string) => {
    try {
      await removerItem(itemId);
      setSnackbar({
        open: true,
        message: 'Item removido do carrinho',
        severity: 'success'
      });
    } catch (error) {
      setSnackbar({
        open: true,
        message: 'Erro ao remover item',
        severity: 'error'
      });
    }
  };

  const handleLimparCarrinho = async () => {
    try {
      await limparCarrinho();
      setDialogOpen(false);
      setSnackbar({
        open: true,
        message: 'Carrinho limpo com sucesso',
        severity: 'success'
      });
    } catch (error) {
      setSnackbar({
        open: true,
        message: 'Erro ao limpar carrinho',
        severity: 'error'
      });
    }
  };

  const handleFinalizarCompra = async () => {
    try {
      await finalizarCompra();
      setSnackbar({
        open: true,
        message: 'Compra finalizada com sucesso! 🎉',
        severity: 'success'
      });
      setTimeout(() => navigate('/produtos'), 2000);
    } catch (error) {
      setSnackbar({
        open: true,
        message: 'Erro ao finalizar compra',
        severity: 'error'
      });
    }
  };

  const handleCloseSnackbar = () => {
    setSnackbar(prev => ({ ...prev, open: false }));
  };

  if (loading) {
    return (
      <Container maxWidth="xl" sx={{ py: 4 }}>
        <Skeleton variant="rectangular" height={80} sx={{ borderRadius: 3, mb: 3 }} />
        <Grid container spacing={3}>
          <Grid item xs={12} md={8}>
            {[1, 2, 3].map((i) => (
              <Skeleton key={i} variant="rectangular" height={120} sx={{ borderRadius: 3, mb: 2 }} />
            ))}
          </Grid>
          <Grid item xs={12} md={4}>
            <Skeleton variant="rectangular" height={300} sx={{ borderRadius: 3 }} />
          </Grid>
        </Grid>
      </Container>
    );
  }

  if (!carrinho || !carrinho.itens || carrinho.itens.length === 0) {
    return (
      <Fade in={true}>
        <Container maxWidth="md" sx={{ py: 8 }}>
          <Paper 
            elevation={0} 
            sx={{ 
              p: 6, 
              textAlign: 'center',
              borderRadius: 4,
              background: 'linear-gradient(135deg, #f5f5f5 0%, #ffffff 100%)',
            }}
          >
            <Box
              sx={{
                width: 120,
                height: 120,
                borderRadius: '50%',
                background: 'linear-gradient(135deg, #EA1D2C 0%, #FF6B6B 100%)',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                mx: 'auto',
                mb: 3,
              }}
            >
              <ShoppingCartIcon sx={{ fontSize: 60, color: 'white' }} />
            </Box>
            
            <Typography variant="h4" gutterBottom sx={{ fontWeight: 700 }}>
              Seu carrinho está vazio
            </Typography>
            
            <Typography variant="body1" color="text.secondary" sx={{ mb: 4, maxWidth: 400, mx: 'auto' }}>
              Adicione alguns produtos incríveis e aproveite nossas ofertas especiais!
            </Typography>
            
            <Button 
              variant="contained" 
              size="large"
              onClick={() => navigate('/produtos')}
              sx={{ px: 5, py: 1.5 }}
            >
              Explorar Produtos
            </Button>
          </Paper>
        </Container>
      </Fade>
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
          <Box sx={{ display: 'flex', alignItems: 'center' }}>
            <IconButton 
              onClick={() => navigate('/produtos')}
              sx={{ color: 'white', mr: 2, '&:hover': { bgcolor: 'rgba(255,255,255,0.1)' } }}
            >
              <ArrowBackIcon />
            </IconButton>
            
            <Box>
              <Typography variant="h4" component="h1" sx={{ fontWeight: 700 }}>
                🛒 Carrinho de Compras
              </Typography>
              <Typography variant="body1" sx={{ opacity: 0.9 }}>
                {carrinho?.quantidadeItens} {carrinho?.quantidadeItens === 1 ? 'item' : 'itens'} no carrinho
              </Typography>
            </Box>
          </Box>
        </Paper>

        <Grid container spacing={3}>
          {/* Lista de itens */}
          <Grid item xs={12} md={8}>
            {carrinho?.itens?.map((item) => (
              <Card 
                key={item.id} 
                sx={{ 
                  mb: 2, 
                  borderRadius: 3,
                  transition: 'all 0.3s ease',
                  '&:hover': {
                    boxShadow: '0 8px 24px rgba(0,0,0,0.1)',
                  },
                }}
              >
                <CardContent sx={{ p: 2.5 }}>
                  <Grid container spacing={2} alignItems="center">
                    <Grid item xs={3} sm={2}>
                      <ProductImage
                        src={item.produtoImagem}
                        alt={item.produtoNome}
                        height={80}
                      />
                    </Grid>
                    
                    <Grid item xs={9} sm={4}>
                      <Typography variant="h6" sx={{ fontWeight: 600, fontSize: '1rem', mb: 0.5 }}>
                        {item.produtoNome}
                      </Typography>
                      <Typography variant="body2" color="text.secondary">
                        R$ {item.precoUnitario.toFixed(2)} cada
                      </Typography>
                    </Grid>
                    
                    <Grid item xs={6} sm={3}>
                      <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                        <IconButton 
                          size="small" 
                          onClick={() => handleQuantidadeChange(item.id, item.quantidade - 1)}
                          disabled={loading}
                          sx={{ bgcolor: '#f5f5f5', '&:hover': { bgcolor: '#e0e0e0' } }}
                        >
                          <RemoveIcon fontSize="small" />
                        </IconButton>
                        
                        <Typography sx={{ mx: 2, minWidth: '30px', textAlign: 'center', fontWeight: 600 }}>
                          {item.quantidade}
                        </Typography>
                        
                        <IconButton 
                          size="small" 
                          onClick={() => handleQuantidadeChange(item.id, item.quantidade + 1)}
                          disabled={loading}
                          sx={{ bgcolor: '#f5f5f5', '&:hover': { bgcolor: '#e0e0e0' } }}
                        >
                          <AddIcon fontSize="small" />
                        </IconButton>
                      </Box>
                    </Grid>
                    
                    <Grid item xs={6} sm={3}>
                      <Box sx={{ textAlign: 'right' }}>
                        <Typography variant="h6" sx={{ color: '#EA1D2C', fontWeight: 700 }}>
                          R$ {item.subtotal.toFixed(2)}
                        </Typography>
                        
                        <IconButton 
                          color="error" 
                          onClick={() => handleRemoverItem(item.id)}
                          disabled={loading}
                          size="small"
                          sx={{ mt: 0.5 }}
                        >
                          <DeleteIcon fontSize="small" />
                        </IconButton>
                      </Box>
                    </Grid>
                  </Grid>
                </CardContent>
              </Card>
            ))}
          </Grid>

          {/* Resumo */}
          <Grid item xs={12} md={4}>
            <Card sx={{ borderRadius: 3, position: 'sticky', top: 80 }}>
              <CardContent sx={{ p: 3 }}>
                <Typography variant="h6" gutterBottom sx={{ fontWeight: 700 }}>
                  Resumo do Pedido
                </Typography>
                
                <Divider sx={{ my: 2 }} />
                
                <Box sx={{ display: 'flex', justifyContent: 'space-between', mb: 2 }}>
                  <Typography color="text.secondary">
                    Subtotal ({carrinho?.quantidadeItens || 0} {carrinho?.quantidadeItens === 1 ? 'item' : 'itens'})
                  </Typography>
                  <Typography fontWeight={500}>
                    R$ {carrinho?.valorTotal?.toFixed(2) || '0.00'}
                  </Typography>
                </Box>
                
                <Box sx={{ display: 'flex', justifyContent: 'space-between', mb: 2 }}>
                  <Typography color="text.secondary">
                    <Box sx={{ display: 'flex', alignItems: 'center', gap: 0.5 }}>
                      <ShippingIcon fontSize="small" />
                      Entrega
                    </Box>
                  </Typography>
                  <Chip 
                    label="GRÁTIS" 
                    size="small" 
                    color="success"
                    sx={{ fontWeight: 600 }}
                  />
                </Box>
                
                <Divider sx={{ my: 2 }} />
                
                <Box sx={{ display: 'flex', justifyContent: 'space-between', mb: 3 }}>
                  <Typography variant="h6" sx={{ fontWeight: 700 }}>
                    Total
                  </Typography>
                  <Typography variant="h5" sx={{ color: '#EA1D2C', fontWeight: 800 }}>
                    R$ {carrinho?.valorTotal?.toFixed(2) || '0.00'}
                  </Typography>
                </Box>
                
                <Button 
                  variant="contained" 
                  fullWidth 
                  size="large"
                  onClick={handleFinalizarCompra}
                  disabled={loading}
                  startIcon={<CheckCircleIcon />}
                  sx={{ 
                    mb: 2, 
                    py: 1.5,
                    fontSize: '1rem',
                  }}
                >
                  Finalizar Compra
                </Button>
                
                <Button 
                  variant="outlined" 
                  fullWidth
                  onClick={() => setDialogOpen(true)}
                  disabled={loading}
                  color="error"
                  sx={{ mb: 2 }}
                >
                  Limpar Carrinho
                </Button>

                <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 1, mt: 2 }}>
                  <PaymentIcon fontSize="small" sx={{ color: '#717171' }} />
                  <Typography variant="caption" color="text.secondary">
                    Pagamento seguro
                  </Typography>
                </Box>
              </CardContent>
            </Card>
          </Grid>
        </Grid>

        {/* Dialog de confirmação */}
        <Dialog 
          open={dialogOpen} 
          onClose={() => setDialogOpen(false)}
          PaperProps={{ sx: { borderRadius: 3 } }}
        >
          <DialogTitle sx={{ fontWeight: 600 }}>
            Limpar Carrinho?
          </DialogTitle>
          
          <DialogContent>
            <Typography>
              Tem certeza que deseja remover todos os itens do carrinho? Esta ação não pode ser desfeita.
            </Typography>
          </DialogContent>
          
          <DialogActions sx={{ p: 2 }}>
            <Button onClick={() => setDialogOpen(false)}>
              Cancelar
            </Button>
            
            <Button 
              onClick={handleLimparCarrinho} 
              color="error" 
              variant="contained"
              autoFocus
            >
              Limpar Carrinho
            </Button>
          </DialogActions>
        </Dialog>

        {/* Snackbar */}
        <Snackbar
          open={snackbar.open}
          autoHideDuration={3000}
          onClose={handleCloseSnackbar}
          anchorOrigin={{ vertical: 'bottom', horizontal: 'center' }}
        >
          <Alert 
            onClose={handleCloseSnackbar} 
            severity={snackbar.severity}
            sx={{ borderRadius: 2 }}
          >
            {snackbar.message}
          </Alert>
        </Snackbar>
      </Container>
    </Fade>
  );
};

export default Carrinho;