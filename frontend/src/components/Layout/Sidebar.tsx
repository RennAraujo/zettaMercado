import React from 'react';
import {
  Drawer,
  List,
  ListItem,
  ListItemIcon,
  ListItemText,
  Divider,
  Box,
  Typography,
} from '@mui/material';
import {
  Home as HomeIcon,
  ShoppingCart as CartIcon,
  Category as CategoryIcon,
  Inventory as ProductIcon,
  Store as StoreIcon,
} from '@mui/icons-material';
import { useNavigate, useLocation } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';

const drawerWidth = 260;

interface SidebarProps {
  open: boolean;
}

const Sidebar: React.FC<SidebarProps> = ({ open }) => {
  const navigate = useNavigate();
  const location = useLocation();
  const { user } = useAuth();

  const isActive = (path: string) => location.pathname === path;

  const menuItems = [
    { text: 'Início', icon: <HomeIcon />, path: '/home' },
    { text: 'Produtos', icon: <StoreIcon />, path: '/produtos' },
    { text: 'Carrinho', icon: <CartIcon />, path: '/carrinho' },
  ];

  const adminItems = [
    { text: 'Gerenciar Produtos', icon: <ProductIcon />, path: '/admin/produtos' },
    { text: 'Gerenciar Categorias', icon: <CategoryIcon />, path: '/admin/categorias' },
  ];

  return (
    <Drawer
      variant="permanent"
      sx={{
        width: open ? drawerWidth : 72,
        flexShrink: 0,
        '& .MuiDrawer-paper': {
          width: open ? drawerWidth : 72,
          boxSizing: 'border-box',
          whiteSpace: 'nowrap',
          transition: (theme) =>
            theme.transitions.create('width', {
              easing: theme.transitions.easing.sharp,
              duration: theme.transitions.duration.enteringScreen,
            }),
          backgroundColor: '#FFFFFF',
          borderRight: '1px solid #E0E0E0',
          overflowX: 'hidden',
        },
      }}
    >
      {/* Espaço para a Navbar */}
      <Box sx={{ height: 64 }} />
      
      <List sx={{ px: open ? 1.5 : 1, py: 2 }}>
        {/* Seção Principal */}
        {open && (
          <Typography 
            variant="caption" 
            sx={{ 
              px: 2, 
              py: 1, 
              display: 'block',
              color: '#717171',
              fontWeight: 600,
              fontSize: '0.7rem',
              textTransform: 'uppercase',
              letterSpacing: '0.05em',
            }}
          >
            Menu Principal
          </Typography>
        )}
        
        {menuItems.map((item) => (
          <ListItem
            button
            key={item.text}
            onClick={() => navigate(item.path)}
            sx={{
              borderRadius: 2,
              mb: 0.5,
              minHeight: 48,
              px: open ? 2 : 1.5,
              justifyContent: open ? 'initial' : 'center',
              backgroundColor: isActive(item.path) ? 'rgba(234, 29, 44, 0.08)' : 'transparent',
              color: isActive(item.path) ? '#EA1D2C' : '#717171',
              '&:hover': {
                backgroundColor: isActive(item.path) 
                  ? 'rgba(234, 29, 44, 0.12)' 
                  : 'rgba(0, 0, 0, 0.04)',
              },
            }}
          >
            <ListItemIcon 
              sx={{ 
                minWidth: 0,
                mr: open ? 2 : 'auto',
                justifyContent: 'center',
                color: isActive(item.path) ? '#EA1D2C' : '#717171',
              }}
            >
              {item.icon}
            </ListItemIcon>
            <ListItemText 
              primary={item.text}
              primaryTypographyProps={{
                fontWeight: isActive(item.path) ? 600 : 500,
                fontSize: '0.9rem',
              }}
              sx={{ opacity: open ? 1 : 0 }}
            />
          </ListItem>
        ))}

        {/* Seção Admin */}
        {user?.perfil === 'ADMIN' && (
          <>
            <Divider sx={{ my: 2, opacity: open ? 1 : 0 }} />
            
            {open && (
              <Typography 
                variant="caption" 
                sx={{ 
                  px: 2, 
                  py: 1, 
                  display: 'block',
                  color: '#717171',
                  fontWeight: 600,
                  fontSize: '0.7rem',
                  textTransform: 'uppercase',
                  letterSpacing: '0.05em',
                }}
              >
                Administração
              </Typography>
            )}
            
            {adminItems.map((item) => (
              <ListItem
                button
                key={item.text}
                onClick={() => navigate(item.path)}
                sx={{
                  borderRadius: 2,
                  mb: 0.5,
                  minHeight: 48,
                  px: open ? 2 : 1.5,
                  justifyContent: open ? 'initial' : 'center',
                  backgroundColor: isActive(item.path) ? 'rgba(234, 29, 44, 0.08)' : 'transparent',
                  color: isActive(item.path) ? '#EA1D2C' : '#717171',
                  '&:hover': {
                    backgroundColor: isActive(item.path) 
                      ? 'rgba(234, 29, 44, 0.12)' 
                      : 'rgba(0, 0, 0, 0.04)',
                  },
                }}
              >
                <ListItemIcon 
                  sx={{ 
                    minWidth: 0,
                    mr: open ? 2 : 'auto',
                    justifyContent: 'center',
                    color: isActive(item.path) ? '#EA1D2C' : '#717171',
                  }}
                >
                  {item.icon}
                </ListItemIcon>
                <ListItemText 
                  primary={item.text}
                  primaryTypographyProps={{
                    fontWeight: isActive(item.path) ? 600 : 500,
                    fontSize: '0.9rem',
                  }}
                  sx={{ opacity: open ? 1 : 0 }}
                />
              </ListItem>
            ))}
          </>
        )}
      </List>
    </Drawer>
  );
};

export default Sidebar; 