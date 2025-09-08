import React from 'react';
import { BrowserRouter } from 'react-router-dom';
import { Box } from '@mui/material';
import Routes from './routes';
import Layout from './components/Layout';
import { useAuth } from './contexts/AuthContext';

const App: React.FC = () => {
  const { signed } = useAuth();

  return (
    <BrowserRouter>
      <Box sx={{ display: 'flex', minHeight: '100vh' }}>
        {signed ? (
          <Layout>
            <Routes />
          </Layout>
        ) : (
          <Routes />
        )}
      </Box>
    </BrowserRouter>
  );
};

export default App; 