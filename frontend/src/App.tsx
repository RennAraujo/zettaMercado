import React, { Suspense } from 'react';
import { BrowserRouter } from 'react-router-dom';
import { Box, CircularProgress } from '@mui/material';
import Routes from './routes';
import Layout from './components/Layout';
import { useAuth } from './contexts/AuthContext';

const LoadingFallback = () => (
  <Box 
    sx={{ 
      display: 'flex', 
      justifyContent: 'center', 
      alignItems: 'center', 
      minHeight: '100vh' 
    }}
  >
    <CircularProgress />
  </Box>
);

const App: React.FC = () => {
  const { signed } = useAuth();

  return (
    <BrowserRouter>
      <Box sx={{ display: 'flex', minHeight: '100vh' }}>
        <Suspense fallback={<LoadingFallback />}>
          {signed ? (
            <Layout>
              <Routes />
            </Layout>
          ) : (
            <Routes />
          )}
        </Suspense>
      </Box>
    </BrowserRouter>
  );
};

export default App;