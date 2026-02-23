import { createTheme } from '@mui/material/styles';

// Tema inspirado no iFood - Cores quentes, vibrantes e acolhedoras
const theme = createTheme({
  palette: {
    primary: {
      main: '#EA1D2C', // Vermelho iFood
      light: '#FF4D5A',
      dark: '#B81420',
      contrastText: '#FFFFFF',
    },
    secondary: {
      main: '#FFB500', // Amarelo/Dourado
      light: '#FFC733',
      dark: '#CC9100',
      contrastText: '#1A1A1A',
    },
    error: {
      main: '#EA1D2C',
      light: '#FF4D5A',
      dark: '#B81420',
    },
    warning: {
      main: '#FFB500',
      light: '#FFC733',
      dark: '#CC9100',
    },
    info: {
      main: '#00A650', // Verde sucesso
      light: '#33B873',
      dark: '#008540',
    },
    success: {
      main: '#00A650',
      light: '#33B873',
      dark: '#008540',
    },
    background: {
      default: '#F5F5F5',
      paper: '#FFFFFF',
    },
    text: {
      primary: '#1A1A1A',
      secondary: '#717171',
    },
  },
  typography: {
    fontFamily: [
      'Inter',
      '-apple-system',
      'BlinkMacSystemFont',
      '"Segoe UI"',
      'Roboto',
      '"Helvetica Neue"',
      'Arial',
      'sans-serif',
    ].join(','),
    h1: {
      fontSize: '2rem',
      fontWeight: 700,
      letterSpacing: '-0.02em',
    },
    h2: {
      fontSize: '1.75rem',
      fontWeight: 700,
      letterSpacing: '-0.01em',
    },
    h3: {
      fontSize: '1.5rem',
      fontWeight: 600,
    },
    h4: {
      fontSize: '1.25rem',
      fontWeight: 600,
    },
    h5: {
      fontSize: '1.125rem',
      fontWeight: 600,
    },
    h6: {
      fontSize: '1rem',
      fontWeight: 600,
    },
    button: {
      fontWeight: 600,
      letterSpacing: '0.02em',
    },
  },
  shape: {
    borderRadius: 12,
  },
  components: {
    MuiButton: {
      styleOverrides: {
        root: {
          textTransform: 'none',
          borderRadius: 8,
          padding: '10px 24px',
          fontSize: '0.95rem',
          boxShadow: 'none',
          '&:hover': {
            boxShadow: '0 4px 12px rgba(234, 29, 44, 0.3)',
          },
        },
        containedPrimary: {
          background: 'linear-gradient(135deg, #EA1D2C 0%, #FF4D5A 100%)',
          '&:hover': {
            background: 'linear-gradient(135deg, #B81420 0%, #EA1D2C 100%)',
          },
        },
      },
    },
    MuiCard: {
      styleOverrides: {
        root: {
          borderRadius: 16,
          boxShadow: '0 2px 12px rgba(0, 0, 0, 0.08)',
          transition: 'all 0.3s cubic-bezier(0.4, 0, 0.2, 1)',
          '&:hover': {
            transform: 'translateY(-4px)',
            boxShadow: '0 8px 24px rgba(0, 0, 0, 0.12)',
          },
        },
      },
    },
    MuiChip: {
      styleOverrides: {
        root: {
          borderRadius: 20,
          fontWeight: 500,
        },
      },
    },
    MuiTextField: {
      styleOverrides: {
        root: {
          '& .MuiOutlinedInput-root': {
            borderRadius: 12,
            backgroundColor: '#FFFFFF',
            '& fieldset': {
              borderColor: '#E0E0E0',
            },
            '&:hover fieldset': {
              borderColor: '#EA1D2C',
            },
            '&.Mui-focused fieldset': {
              borderColor: '#EA1D2C',
              borderWidth: 2,
            },
          },
        },
      },
    },
    MuiAppBar: {
      styleOverrides: {
        root: {
          boxShadow: '0 2px 8px rgba(0, 0, 0, 0.08)',
          background: '#FFFFFF',
        },
      },
    },
  },
});

export default theme; 