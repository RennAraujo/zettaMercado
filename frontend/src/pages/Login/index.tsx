import React, { useState } from 'react';
import {
  Container,
  Box,
  Typography,
  TextField,
  Button,
  Alert,
  Card,
  CardContent,
  Divider,
  Grid,
  Chip,
} from '@mui/material';
import {
  Login as LoginIcon,
  PersonAdd as PersonAddIcon,
  Work as WorkIcon,
  ShoppingCart as ShoppingCartIcon,
  LocalOffer as LocalOfferIcon,
  DeliveryDining as DeliveryIcon,
} from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';

const Login: React.FC = () => {
  const navigate = useNavigate();
  const { signIn, signInAsRecruiter } = useAuth();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setLoading(true);

    try {
      await signIn(email, password);
      navigate('/home');
    } catch (err) {
      setError('Email ou senha inválidos');
    } finally {
      setLoading(false);
    }
  };

  const handleRecruiterAccess = async () => {
    try {
      setLoading(true);
      setError('');
      await signInAsRecruiter();
      navigate('/home');
    } catch (err) {
      setError('Erro ao acessar como recrutador. Tente novamente.');
    } finally {
      setLoading(false);
    }
  };

  const features = [
    { icon: <ShoppingCartIcon />, text: 'Mais de 125 produtos' },
    { icon: <LocalOfferIcon />, text: 'Ofertas especiais' },
    { icon: <DeliveryIcon />, text: 'Entrega rápida' },
  ];

  return (
    <Box
      sx={{
        minHeight: '100vh',
        background: 'linear-gradient(135deg, #EA1D2C 0%, #FF6B6B 50%, #FFB500 100%)',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        padding: 2,
        position: 'relative',
        overflow: 'hidden',
      }}
    >
      {/* Padrão de fundo */}
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

      <Container maxWidth="md" sx={{ position: 'relative', zIndex: 1 }}>
        <Grid container spacing={4} alignItems="center">
          {/* Seção de Boas-vindas */}
          
          <Grid item xs={12} md={6}>
            <Box sx={{ color: 'white', textAlign: { xs: 'center', md: 'left' } }}>
              <Box sx={{ display: 'flex', alignItems: 'center', gap: 2, mb: 3, justifyContent: { xs: 'center', md: 'flex-start' } }}>
                <Box
                  sx={{
                    width: 56,
                    height: 56,
                    borderRadius: '14px',
                    background: 'white',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    fontSize: '1.8rem',
                    boxShadow: '0 8px 24px rgba(0,0,0,0.2)',
                  }}
                >
                  🛒
                </Box>
                <Typography
                  variant="h3"
                  component="h1"
                  sx={{
                    fontWeight: 800,
                    fontSize: { xs: '2rem', md: '2.5rem' },
                    letterSpacing: '-0.02em',
                  }}
                >
                  Zetta
                  <Box component="span" sx={{ color: '#FFB500' }}>
                    Mercado
                  </Box>
                </Typography>
              </Box>
              
              <Typography
                variant="h5"
                sx={{
                  mb: 3,
                  opacity: 0.95,
                  fontWeight: 400,
                  lineHeight: 1.4,
                }}
              >
                Sua plataforma de supermercado online com entrega rápida e os melhores preços
              </Typography>
              
              <Typography
                variant="body1"
                sx={{
                  opacity: 0.85,
                  lineHeight: 1.7,
                  mb: 4,
                }}
              >
                Gerencie produtos, controle estoque em tempo real e ofereça a melhor experiência de compra para seus clientes.
              </Typography>

              {/* Features */}
              <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2 }}>
                {features.map((feature, index) => (
                  <Box 
                    key={index}
                    sx={{ 
                      display: 'flex', 
                      alignItems: 'center', 
                      gap: 1.5,
                      justifyContent: { xs: 'center', md: 'flex-start' },
                    }}
                  >
                    <Box
                      sx={{
                        width: 36,
                        height: 36,
                        borderRadius: '10px',
                        background: 'rgba(255,255,255,0.2)',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        color: 'white',
                      }}
                    >
                      {feature.icon}
                    </Box>
                    <Typography variant="body1" sx={{ fontWeight: 500 }}>
                      {feature.text}
                    </Typography>
                  </Box>
                ))}
              </Box>
            </Box>
          </Grid>

          {/* Seção de Login */}
          
          <Grid item xs={12} md={6}>
            <Card
              elevation={24}
              sx={{
                borderRadius: 4,
                overflow: 'hidden',
                background: 'rgba(255, 255, 255, 0.98)',
                backdropFilter: 'blur(10px)',
              }}
            >
              <CardContent sx={{ p: 4 }}>
                <Box sx={{ textAlign: 'center', mb: 3 }}>
                  <Box
                    sx={{
                      width: 64,
                      height: 64,
                      borderRadius: '16px',
                      background: 'linear-gradient(135deg, #EA1D2C 0%, #FF6B6B 100%)',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      mx: 'auto',
                      mb: 2,
                    }}
                  >
                    <LoginIcon sx={{ fontSize: 32, color: 'white' }} />
                  </Box>
                  
                  <Typography
                    component="h1"
                    variant="h4"
                    sx={{
                      fontWeight: 700,
                      color: 'text.primary',
                      mb: 1,
                    }}
                  >
                    Bem-vindo de volta!
                  </Typography>
                  
                  <Typography
                    variant="body2"
                    color="text.secondary"
                  >
                    Faça login para acessar sua conta
                  </Typography>
                </Box>

                {error && (
                  <Alert
                    severity="error"
                    sx={{
                      mb: 3,
                      borderRadius: 2,
                    }}
                  >
                    {error}
                  </Alert>
                )}

                <Box component="form" onSubmit={handleSubmit}>
                  <TextField
                    margin="normal"
                    required
                    fullWidth
                    id="email"
                    label="Email"
                    name="email"
                    autoComplete="email"
                    autoFocus
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    sx={{
                      '& .MuiOutlinedInput-root': {
                        borderRadius: 2,
                        backgroundColor: '#f8f8f8',
                      },
                    }}
                  />
                  
                  <TextField
                    margin="normal"
                    required
                    fullWidth
                    name="password"
                    label="Senha"
                    type="password"
                    id="password"
                    autoComplete="current-password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    sx={{
                      '& .MuiOutlinedInput-root': {
                        borderRadius: 2,
                        backgroundColor: '#f8f8f8',
                      },
                    }}
                  />
                  
                  <Button
                    type="submit"
                    fullWidth
                    variant="contained"
                    disabled={loading}
                    sx={{
                      mt: 3,
                      mb: 2,
                      py: 1.5,
                      borderRadius: 2,
                      fontSize: '1.1rem',
                      fontWeight: 700,
                    }}
                  >
                    {loading ? 'Entrando...' : 'Entrar'}
                  </Button>

                  <Button
                    fullWidth
                    variant="outlined"
                    startIcon={<PersonAddIcon />}
                    onClick={() => navigate('/register')}
                    sx={{
                      mb: 2,
                      py: 1.2,
                      borderRadius: 2,
                      borderColor: '#E0E0E0',
                      color: '#717171',
                      '&:hover': {
                        borderColor: '#EA1D2C',
                        color: '#EA1D2C',
                        backgroundColor: 'rgba(234, 29, 44, 0.04)',
                      },
                    }}
                  >
                    Criar nova conta
                  </Button>

                  <Divider sx={{ my: 3 }}>
                    <Chip 
                      label="ou" 
                      size="small" 
                      sx={{ backgroundColor: '#f0f0f0' }}
                    />
                  </Divider>

                  <Button
                    fullWidth
                    variant="contained"
                    startIcon={<WorkIcon />}
                    onClick={handleRecruiterAccess}
                    sx={{
                      py: 1.5,
                      borderRadius: 2,
                      fontSize: '1rem',
                      fontWeight: 600,
                      background: 'linear-gradient(45deg, #FFB500 0%, #FF8C00 100%)',
                      color: '#1A1A1A',
                      boxShadow: '0 8px 24px rgba(255, 181, 0, 0.3)',
                      '&:hover': {
                        background: 'linear-gradient(45deg, #E5A200 0%, #E67E00 100%)',
                        boxShadow: '0 12px 32px rgba(255, 181, 0, 0.4)',
                        transform: 'translateY(-2px)',
                      },
                      transition: 'all 0.3s ease',
                    }}
                  >
                    🚀 Acesso de Demonstração
                  </Button>

                  <Typography
                    variant="caption"
                    display="block"
                    textAlign="center"
                    sx={{ mt: 2, color: 'text.secondary' }}
                  >
                    * Acesso direto para visualizar todas as funcionalidades
                  </Typography>
                </Box>
              </CardContent>
            </Card>
          </Grid>
        </Grid>
      </Container>
    </Box>
  );
};

export default Login;