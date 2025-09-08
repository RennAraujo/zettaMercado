import React from 'react';
import {
  Container,
  Box,
  Typography,
  Button,
  Card,
  CardContent,
  Grid,
} from '@mui/material';
import {
  Construction as ConstructionIcon,
  ArrowBack as ArrowBackIcon,
  Email as EmailIcon,
} from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';

const UnderConstruction: React.FC = () => {
  const navigate = useNavigate();

  return (
    <Box
      sx={{
        minHeight: '100vh',
        background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        padding: 2,
      }}
    >
      <Container maxWidth="md">
        <Grid container spacing={4} alignItems="center" justifyContent="center">
          <Grid item xs={12} md={8}>
            <Card
              elevation={24}
              sx={{
                borderRadius: 4,
                overflow: 'hidden',
                background: 'rgba(255, 255, 255, 0.95)',
                backdropFilter: 'blur(10px)',
                textAlign: 'center',
              }}
            >
              <CardContent sx={{ p: 6 }}>
                <ConstructionIcon
                  sx={{
                    fontSize: 120,
                    color: 'warning.main',
                    mb: 3,
                    animation: 'bounce 2s infinite',
                    '@keyframes bounce': {
                      '0%, 20%, 50%, 80%, 100%': {
                        transform: 'translateY(0)',
                      },
                      '40%': {
                        transform: 'translateY(-10px)',
                      },
                      '60%': {
                        transform: 'translateY(-5px)',
                      },
                    },
                  }}
                />
                
                <Typography
                  variant="h3"
                  component="h1"
                  sx={{
                    fontWeight: 'bold',
                    color: 'text.primary',
                    mb: 2,
                    fontSize: { xs: '2rem', md: '3rem' },
                  }}
                >
                  🚧 Em Construção 🚧
                </Typography>
                
                <Typography
                  variant="h5"
                  sx={{
                    color: 'text.secondary',
                    mb: 3,
                    fontWeight: 300,
                  }}
                >
                  Funcionalidade de Cadastro
                </Typography>
                
                <Typography
                  variant="body1"
                  sx={{
                    color: 'text.secondary',
                    mb: 4,
                    lineHeight: 1.6,
                    maxWidth: 600,
                    mx: 'auto',
                  }}
                >
                  Estamos trabalhando duro para trazer a você a melhor experiência de cadastro. 
                  Esta funcionalidade estará disponível em breve com recursos avançados de 
                  segurança e validação.
                </Typography>
                
                <Box
                  sx={{
                    background: 'linear-gradient(45deg, #f093fb 0%, #f5576c 100%)',
                    borderRadius: 3,
                    p: 3,
                    mb: 4,
                    color: 'white',
                  }}
                >
                  <EmailIcon sx={{ fontSize: 32, mb: 1 }} />
                  <Typography variant="h6" sx={{ fontWeight: 'bold', mb: 1 }}>
                    Quer ser notificado?
                  </Typography>
                  <Typography variant="body2" sx={{ opacity: 0.9 }}>
                    Entre em contato conosco para ser avisado quando esta funcionalidade estiver pronta!
                  </Typography>
                </Box>
                
                <Box sx={{ display: 'flex', gap: 2, justifyContent: 'center', flexWrap: 'wrap' }}>
                  <Button
                    variant="contained"
                    startIcon={<ArrowBackIcon />}
                    onClick={() => navigate('/login')}
                    sx={{
                      py: 1.5,
                      px: 4,
                      borderRadius: 2,
                      fontSize: '1.1rem',
                      fontWeight: 'bold',
                      background: 'linear-gradient(45deg, #667eea 30%, #764ba2 90%)',
                      '&:hover': {
                        background: 'linear-gradient(45deg, #5a6fd8 30%, #6a4190 90%)',
                        transform: 'translateY(-2px)',
                      },
                      transition: 'all 0.3s ease',
                    }}
                  >
                    Voltar ao Login
                  </Button>
                  
                  <Button
                    variant="outlined"
                    onClick={() => window.open('mailto:contato@zettamercado.com?subject=Interesse em Cadastro', '_blank')}
                    sx={{
                      py: 1.5,
                      px: 4,
                      borderRadius: 2,
                      fontSize: '1.1rem',
                      fontWeight: 'bold',
                      borderColor: 'primary.main',
                      color: 'primary.main',
                      '&:hover': {
                        borderColor: 'primary.dark',
                        backgroundColor: 'primary.light',
                        color: 'white',
                        transform: 'translateY(-2px)',
                      },
                      transition: 'all 0.3s ease',
                    }}
                  >
                    Entrar em Contato
                  </Button>
                </Box>
                
                <Typography
                  variant="caption"
                  display="block"
                  sx={{ mt: 4, color: 'text.secondary', fontStyle: 'italic' }}
                >
                  💡 Dica: Use o "Acesso Recrutador" na página de login para explorar a aplicação!
                </Typography>
              </CardContent>
            </Card>
          </Grid>
        </Grid>
      </Container>
    </Box>
  );
};

export default UnderConstruction;