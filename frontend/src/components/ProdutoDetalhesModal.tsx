import React from 'react';
import {
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Button,
  Typography,
  Box,
  Chip,
  Divider,
  IconButton,
  Grid,
  Card,
  CardMedia,
  Rating,
  Accordion,
  AccordionSummary,
  AccordionDetails,
  List,
  ListItem,
  ListItemIcon,
  ListItemText,
} from '@mui/material';
import {
  Close as CloseIcon,
  ShoppingCart as ShoppingCartIcon,
  LocalOffer as OfferIcon,
  Inventory as InventoryIcon,
  Category as CategoryIcon,
  QrCode as BarcodeIcon,
  ExpandMore as ExpandMoreIcon,
  CheckCircle as CheckIcon,
  Info as InfoIcon,
  Security as SecurityIcon,
} from '@mui/icons-material';

interface Produto {
  id: string;
  nome: string;
  descricao: string;
  preco: number;
  estoque: number;
  imagemUrl?: string;
  categoriaId: number;
  categoriaNome?: string;
  codigoBarras?: string;
  status: string;
}

interface ProdutoDetalhesModalProps {
  produto: Produto | null;
  open: boolean;
  onClose: () => void;
  onAdicionarAoCarrinho: (produto: Produto, quantidade: number) => void;
  carrinhoLoading?: boolean;
}

const ProdutoDetalhesModal: React.FC<ProdutoDetalhesModalProps> = ({
  produto,
  open,
  onClose,
  onAdicionarAoCarrinho,
  carrinhoLoading = false,
}) => {
  const [quantidade, setQuantidade] = React.useState(1);

  React.useEffect(() => {
    if (open) {
      setQuantidade(1);
    }
  }, [open]);

  if (!produto) return null;

  const handleQuantidadeChange = (delta: number) => {
    setQuantidade(prev => Math.max(1, Math.min(produto.estoque, prev + delta)));
  };

  const handleAdicionarAoCarrinho = () => {
    onAdicionarAoCarrinho(produto, quantidade);
    onClose();
  };

  const isOferta = produto.preco < 10;
  const avaliacaoMedia = 4.2; // Simulado
  const totalAvaliacoes = 127; // Simulado

  return (
    <Dialog
      open={open}
      onClose={onClose}
      maxWidth="md"
      fullWidth
      PaperProps={{
        sx: {
          borderRadius: 3,
          maxHeight: '90vh',
        },
      }}
    >
      {/* Header do Modal */}
      <DialogTitle
        sx={{
          display: 'flex',
          justifyContent: 'space-between',
          alignItems: 'center',
          pb: 1,
          background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
          color: 'white',
        }}
      >
        <Typography variant="h5" component="div" sx={{ fontWeight: 'bold' }}>
          📦 Detalhes do Produto
        </Typography>
        <IconButton
          onClick={onClose}
          sx={{
            color: 'white',
            '&:hover': { bgcolor: 'rgba(255,255,255,0.1)' },
          }}
        >
          <CloseIcon />
        </IconButton>
      </DialogTitle>

      <DialogContent sx={{ p: 0 }}>
        <Grid container>
          {/* Imagem do Produto */}
          <Grid item xs={12} md={5}>
            <Card elevation={0} sx={{ height: '400px', position: 'relative' }}>
              {isOferta && (
                <Box
                  sx={{
                    position: 'absolute',
                    top: 16,
                    right: 16,
                    bgcolor: 'error.main',
                    color: 'white',
                    px: 2,
                    py: 1,
                    borderRadius: 2,
                    fontSize: '0.875rem',
                    fontWeight: 'bold',
                    zIndex: 1,
                    display: 'flex',
                    alignItems: 'center',
                    gap: 0.5,
                  }}
                >
                  <OfferIcon sx={{ fontSize: 16 }} />
                  OFERTA ESPECIAL
                </Box>
              )}
              <CardMedia
                component="img"
                height="400"
                image={produto.imagemUrl || 'https://via.placeholder.com/400x400/f5f5f5/999999?text=Produto'}
                alt={produto.nome}
                sx={{
                  objectFit: 'cover',
                  width: '100%',
                }}
              />
            </Card>
          </Grid>

          {/* Informações do Produto */}
          <Grid item xs={12} md={7}>
            <Box sx={{ p: 3 }}>
              {/* Nome e Categoria */}
              <Box sx={{ mb: 2 }}>
                <Typography variant="h4" component="h1" sx={{ fontWeight: 'bold', mb: 1 }}>
                  {produto.nome}
                </Typography>
                <Chip
                  icon={<CategoryIcon />}
                  label={produto.categoriaNome || `Categoria ${produto.categoriaId}`}
                  color="primary"
                  variant="outlined"
                  sx={{ mr: 1 }}
                />
                <Chip
                  icon={<InventoryIcon />}
                  label={`${produto.estoque} em estoque`}
                  color={produto.estoque > 10 ? 'success' : produto.estoque > 0 ? 'warning' : 'error'}
                  variant="outlined"
                />
              </Box>

              {/* Avaliação */}
              <Box sx={{ display: 'flex', alignItems: 'center', mb: 2 }}>
                <Rating value={avaliacaoMedia} precision={0.1} readOnly />
                <Typography variant="body2" sx={{ ml: 1, color: 'text.secondary' }}>
                  {avaliacaoMedia} ({totalAvaliacoes} avaliações)
                </Typography>
              </Box>

              {/* Preço */}
              <Box sx={{ mb: 3 }}>
                <Typography
                  variant="h3"
                  sx={{
                    fontWeight: 'bold',
                    color: 'primary.main',
                    mb: 1,
                  }}
                >
                  R$ {produto.preco.toFixed(2)}
                </Typography>
                {isOferta && (
                  <Typography variant="body2" color="error" sx={{ fontWeight: 'bold' }}>
                    🔥 Preço promocional por tempo limitado!
                  </Typography>
                )}
              </Box>

              {/* Descrição */}
              <Box sx={{ mb: 3 }}>
                <Typography variant="h6" sx={{ fontWeight: 'bold', mb: 1 }}>
                  Descrição
                </Typography>
                <Typography variant="body1" color="text.secondary" sx={{ lineHeight: 1.6 }}>
                  {produto.descricao}
                </Typography>
              </Box>

              {/* Controles de Quantidade */}
              <Box sx={{ mb: 3 }}>
                <Typography variant="h6" sx={{ fontWeight: 'bold', mb: 2 }}>
                  Quantidade
                </Typography>
                <Box sx={{ display: 'flex', alignItems: 'center', gap: 2 }}>
                  <Button
                    variant="outlined"
                    size="small"
                    onClick={() => handleQuantidadeChange(-1)}
                    disabled={quantidade <= 1}
                    sx={{ minWidth: '40px', height: '40px' }}
                  >
                    -
                  </Button>
                  <Typography
                    variant="h6"
                    sx={{
                      minWidth: '60px',
                      textAlign: 'center',
                      fontWeight: 'bold',
                      bgcolor: 'grey.100',
                      py: 1,
                      px: 2,
                      borderRadius: 1,
                    }}
                  >
                    {quantidade}
                  </Typography>
                  <Button
                    variant="outlined"
                    size="small"
                    onClick={() => handleQuantidadeChange(1)}
                    disabled={quantidade >= produto.estoque}
                    sx={{ minWidth: '40px', height: '40px' }}
                  >
                    +
                  </Button>
                  <Typography variant="body2" color="text.secondary" sx={{ ml: 2 }}>
                    Subtotal: <strong>R$ {(produto.preco * quantidade).toFixed(2)}</strong>
                  </Typography>
                </Box>
              </Box>
            </Box>
          </Grid>
        </Grid>

        <Divider />

        {/* Informações Adicionais */}
        <Box sx={{ p: 3 }}>
          <Accordion>
            <AccordionSummary expandIcon={<ExpandMoreIcon />}>
              <Typography variant="h6" sx={{ fontWeight: 'bold' }}>
                📋 Informações Técnicas
              </Typography>
            </AccordionSummary>
            <AccordionDetails>
              <Grid container spacing={2}>
                <Grid item xs={12} sm={6}>
                  <List dense>
                    <ListItem>
                      <ListItemIcon>
                        <BarcodeIcon color="primary" />
                      </ListItemIcon>
                      <ListItemText
                        primary="Código de Barras"
                        secondary={produto.codigoBarras || 'Não informado'}
                      />
                    </ListItem>
                    <ListItem>
                      <ListItemIcon>
                        <InfoIcon color="primary" />
                      </ListItemIcon>
                      <ListItemText
                        primary="Status"
                        secondary={produto.status === 'ATIVO' ? 'Disponível' : produto.status}
                      />
                    </ListItem>
                  </List>
                </Grid>
                <Grid item xs={12} sm={6}>
                  <List dense>
                    <ListItem>
                      <ListItemIcon>
                        <CheckIcon color="success" />
                      </ListItemIcon>
                      <ListItemText
                        primary="Garantia"
                        secondary="30 dias"
                      />
                    </ListItem>
                    <ListItem>
                      <ListItemIcon>
                        <SecurityIcon color="primary" />
                      </ListItemIcon>
                      <ListItemText
                        primary="Qualidade"
                        secondary="Produto verificado"
                      />
                    </ListItem>
                  </List>
                </Grid>
              </Grid>
            </AccordionDetails>
          </Accordion>
        </Box>
      </DialogContent>

      {/* Ações do Modal */}
      <DialogActions
        sx={{
          p: 3,
          pt: 2,
          background: 'linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%)',
        }}
      >
        <Button
          onClick={onClose}
          variant="outlined"
          size="large"
          sx={{ mr: 2 }}
        >
          Fechar
        </Button>
        <Button
          onClick={handleAdicionarAoCarrinho}
          variant="contained"
          size="large"
          disabled={produto.estoque === 0 || carrinhoLoading}
          startIcon={<ShoppingCartIcon />}
          sx={{
            px: 4,
            py: 1.5,
            fontWeight: 'bold',
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
          {produto.estoque === 0 ? 'Sem Estoque' : `Adicionar ${quantidade} ao Carrinho`}
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default ProdutoDetalhesModal;