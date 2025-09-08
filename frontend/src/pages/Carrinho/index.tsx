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
  CircularProgress,
  Alert,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Snackbar,
} from '@mui/material';
import {
  Add as AddIcon,
  Remove as RemoveIcon,
  Delete as DeleteIcon,
  ShoppingCart as ShoppingCartIcon,
  ArrowBack as ArrowBackIcon,
} from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';
import { useCarrinho } from '../../contexts/CarrinhoContext';

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
        message: 'Compra finalizada com sucesso!',
        severity: 'success'
      });
      navigate('/produtos');
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
      <Container maxWidth="lg" sx={{ py: 4, display: 'flex', justifyContent: 'center' }}>
        <CircularProgress />
      </Container>
    );
  }

  if (!carrinho || carrinho.itens.length === 0) {
    return (
      <Container maxWidth="lg" sx={{ py: 4 }}>
        <Box sx={{ display: 'flex', alignItems: 'center', mb: 3 }}>
          <IconButton onClick={() => navigate('/produtos')} sx={{ mr: 2 }}>
            <ArrowBackIcon />
          </IconButton>
          <Typography variant="h4" component="h1">
            Carrinho de Compras
          </Typography>
        </Box>
        
        <Box sx={{ textAlign: 'center', py: 8 }}>
          <ShoppingCartIcon sx={{ fontSize: 80, color: 'text.secondary', mb: 2 }} />
          <Typography variant="h5" gutterBottom>
            Seu carrinho está vazio
          </Typography>
          <Typography variant="body1" color="text.secondary" sx={{ mb: 3 }}>
            Adicione alguns produtos para começar suas compras
          </Typography>
          <Button 
            variant="contained" 
            size="large"
            onClick={() => navigate('/produtos')}
          >
            Continuar Comprando
          </Button>
        </Box>
      </Container>
    );
  }

  return (
    <Container maxWidth="lg" sx={{ py: 4 }}>
      <Box sx={{ display: 'flex', alignItems: 'center', mb: 3 }}>
        <IconButton onClick={() => navigate('/produtos')} sx={{ mr: 2 }}>
          <ArrowBackIcon />
        </IconButton>
        <Typography variant="h4" component="h1">
          Carrinho de Compras
        </Typography>
      </Box>

      <Grid container spacing={3}>
        <Grid item xs={12} md={8}>
          {carrinho.itens.map((item) => (
            <Card key={item.id} sx={{ mb: 2 }}>
              <CardContent>
                <Grid container spacing={2} alignItems="center">
                  <Grid item xs={12} sm={3}>
                    <Box
                      component="img"
                      src={item.produtoImagem || '/placeholder-image.jpg'}
                      alt={item.produtoNome}
                      sx={{
                        width: '100%',
                        height: 100,
                        objectFit: 'cover',
                        borderRadius: 1,
                      }}
                    />
                  </Grid>
                  <Grid item xs={12} sm={4}>
                    <Typography variant="h6" gutterBottom>
                      {item.produtoNome}
                    </Typography>
                    <Typography variant="body2" color="text.secondary">
                      R$ {item.precoUnitario.toFixed(2)} cada
                    </Typography>
                  </Grid>
                  <Grid item xs={12} sm={3}>
                    <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                      <IconButton 
                        size="small" 
                        onClick={() => handleQuantidadeChange(item.id, item.quantidade - 1)}
                        disabled={loading}
                      >
                        <RemoveIcon />
                      </IconButton>
                      <Typography sx={{ mx: 2, minWidth: '20px', textAlign: 'center' }}>
                        {item.quantidade}
                      </Typography>
                      <IconButton 
                        size="small" 
                        onClick={() => handleQuantidadeChange(item.id, item.quantidade + 1)}
                        disabled={loading}
                      >
                        <AddIcon />
                      </IconButton>
                    </Box>
                  </Grid>
                  <Grid item xs={12} sm={2}>
                    <Box sx={{ textAlign: 'center' }}>
                      <Typography variant="h6" color="primary" gutterBottom>
                        R$ {item.subtotal.toFixed(2)}
                      </Typography>
                      <IconButton 
                        color="error" 
                        onClick={() => handleRemoverItem(item.id)}
                        disabled={loading}
                      >
                        <DeleteIcon />
                      </IconButton>
                    </Box>
                  </Grid>
                </Grid>
              </CardContent>
            </Card>
          ))}
        </Grid>

        <Grid item xs={12} md={4}>
          <Card>
            <CardContent>
              <Typography variant="h6" gutterBottom>
                Resumo do Pedido
              </Typography>
              <Divider sx={{ my: 2 }} />
              
              <Box sx={{ display: 'flex', justifyContent: 'space-between', mb: 1 }}>
                <Typography>Itens ({carrinho.quantidadeItens}):</Typography>
                <Typography>R$ {carrinho.valorTotal.toFixed(2)}</Typography>
              </Box>
              
              <Divider sx={{ my: 2 }} />
              
              <Box sx={{ display: 'flex', justifyContent: 'space-between', mb: 3 }}>
                <Typography variant="h6">Total:</Typography>
                <Typography variant="h6" color="primary">
                  R$ {carrinho.valorTotal.toFixed(2)}
                </Typography>
              </Box>
              
              <Button 
                variant="contained" 
                fullWidth 
                size="large"
                onClick={handleFinalizarCompra}
                disabled={loading}
                sx={{ mb: 2 }}
              >
                Finalizar Compra
              </Button>
              
              <Button 
                variant="outlined" 
                fullWidth
                onClick={() => setDialogOpen(true)}
                disabled={loading}
              >
                Limpar Carrinho
              </Button>
            </CardContent>
          </Card>
        </Grid>
      </Grid>

      {/* Dialog de confirmação */}
      <Dialog open={dialogOpen} onClose={() => setDialogOpen(false)}>
        <DialogTitle>Confirmar Limpeza</DialogTitle>
        <DialogContent>
          <Typography>
            Tem certeza que deseja remover todos os itens do carrinho?
          </Typography>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setDialogOpen(false)}>Cancelar</Button>
          <Button onClick={handleLimparCarrinho} color="error" autoFocus>
            Limpar Carrinho
          </Button>
        </DialogActions>
      </Dialog>

      {/* Snackbar para notificações */}
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

export default Carrinho;