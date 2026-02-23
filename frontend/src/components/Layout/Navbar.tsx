import React from 'react';
import {
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  Button,
  Box,
  Badge,
  Avatar,
} from '@mui/material';
import MenuIcon from '@mui/icons-material/Menu';
import ShoppingCartIcon from '@mui/icons-material/ShoppingCart';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { useCarrinho } from '../../contexts/CarrinhoContext';

interface NavbarProps {
  open: boolean;
  toggleDrawer: () => void;
}

const Navbar: React.FC<NavbarProps> = ({ open, toggleDrawer }) => {
  const navigate = useNavigate();
  const { user, signOut } = useAuth();
  const { carrinho } = useCarrinho();

  const handleLogout = () => {
    signOut();
    navigate('/login');
  };

  return (
    <AppBar
      position="fixed"
      sx={{
        zIndex: (theme) => theme.zIndex.drawer + 1,
        background: '#FFFFFF',
        borderBottom: '1px solid #E0E0E0',
      }}
    >
      <Toolbar sx={{ px: { xs: 2, sm: 3 } }}>
        <IconButton
          color="primary"
          aria-label="open drawer"
          onClick={toggleDrawer}
          edge="start"
          sx={{ 
            marginRight: 2,
            '&:hover': { backgroundColor: 'rgba(234, 29, 44, 0.08)' }
          }}
        >
          <MenuIcon />
        </IconButton>
        
        {/* Logo */}
        <Box 
          sx={{ 
            display: 'flex', 
            alignItems: 'center', 
            gap: 1,
            cursor: 'pointer',
          }}
          onClick={() => navigate('/home')}
        >
          <Box
            sx={{
              width: 36,
              height: 36,
              borderRadius: '10px',
              background: 'linear-gradient(135deg, #EA1D2C 0%, #FF4D5A 100%)',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              fontSize: '1.2rem',
            }}
          >
            🛒
          </Box>
          <Typography 
            variant="h6" 
            noWrap 
            sx={{ 
              fontWeight: 700,
              color: '#1A1A1A',
              letterSpacing: '-0.02em',
            }}
          >
            Zetta
            <Box component="span" sx={{ color: '#EA1D2C' }}>
              Mercado
            </Box>
          </Typography>
        </Box>

        <Box sx={{ flexGrow: 1 }} />
        
        {/* Ações */}
        <Box sx={{ display: 'flex', alignItems: 'center', gap: 1.5 }}>
          {/* Carrinho */}
          <IconButton 
            color="primary"
            onClick={() => navigate('/carrinho')}
            sx={{ 
              '&:hover': { backgroundColor: 'rgba(234, 29, 44, 0.08)' }
            }}
          >
            <Badge 
              badgeContent={carrinho?.quantidadeItens || 0} 
              color="primary"
              sx={{
                '& .MuiBadge-badge': {
                  backgroundColor: '#EA1D2C',
                }
              }}
            >
              <ShoppingCartIcon />
            </Badge>
          </IconButton>

          {/* Usuário */}
          <Box 
            sx={{ 
              display: 'flex', 
              alignItems: 'center', 
              gap: 1.5,
              ml: 1,
              pl: 2,
              borderLeft: '1px solid #E0E0E0',
            }}
          >
            <Avatar 
              sx={{ 
                width: 32, 
                height: 32,
                background: 'linear-gradient(135deg, #FFB500 0%, #FF8C00 100%)',
                fontSize: '0.9rem',
                fontWeight: 600,
              }}
            >
              {user?.nome?.charAt(0)?.toUpperCase() || 'U'}
            </Avatar>
            <Box sx={{ display: { xs: 'none', sm: 'block' } }}>
              <Typography 
                variant="body2" 
                sx={{ 
                  fontWeight: 600,
                  color: '#1A1A1A',
                  lineHeight: 1.2,
                }}
              >
                {user?.nome?.split(' ')[0] || 'Usuário'}
              </Typography>
              <Typography 
                variant="caption" 
                sx={{ 
                  color: '#717171',
                  lineHeight: 1,
                }}
              >
                {user?.perfil === 'ADMIN' ? 'Administrador' : 'Cliente'}
              </Typography>
            </Box>
            <Button 
              variant="outlined"
              size="small"
              onClick={handleLogout}
              sx={{
                ml: 1,
                borderColor: '#E0E0E0',
                color: '#717171',
                '&:hover': {
                  borderColor: '#EA1D2C',
                  color: '#EA1D2C',
                  backgroundColor: 'rgba(234, 29, 44, 0.04)',
                }
              }}
            >
              Sair
            </Button>
          </Box>
        </Box>
      </Toolbar>
    </AppBar>
  );
};

export default Navbar; 