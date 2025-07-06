import { Routes, Route, Navigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import Layout from '../components/Layout';
import Login from '../pages/Login';
import Setup2FA from '../pages/Setup2FA';
import Verify2FA from '../pages/Verify2FA';
import Home from '../pages/Home';
import Produtos from '../pages/Produtos';
import Carrinho from '../pages/Carrinho';
import AdminProdutos from '../pages/admin/Produtos';
import AdminCategorias from '../pages/admin/Categorias';

function PrivateRoute({ children }: { children: JSX.Element }) {
  const { isAuthenticated, isDemoMode } = useAuth();
  return isAuthenticated || isDemoMode ? children : <Navigate to="/login" />;
}

function AdminRoute({ children }: { children: JSX.Element }) {
  const { user, isAuthenticated } = useAuth();
  return isAuthenticated && user?.perfil === 'ADMIN' ? (
    children
  ) : (
    <Navigate to="/" />
  );
}

export default function AppRoutes() {
  return (
    <Routes>
      <Route path="/login" element={<Login />} />
      <Route path="/setup-2fa" element={<Setup2FA />} />
      <Route path="/verify-2fa" element={<Verify2FA />} />
      
      <Route
        path="/"
        element={
          <PrivateRoute>
            <Layout />
          </PrivateRoute>
        }
      >
        <Route index element={<Home />} />
        <Route path="produtos" element={<Produtos />} />
        <Route path="carrinho" element={<Carrinho />} />
        
        <Route
          path="admin/produtos"
          element={
            <AdminRoute>
              <AdminProdutos />
            </AdminRoute>
          }
        />
        
        <Route
          path="admin/categorias"
          element={
            <AdminRoute>
              <AdminCategorias />
            </AdminRoute>
          }
        />
      </Route>
    </Routes>
  );
} 