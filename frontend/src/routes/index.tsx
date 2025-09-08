import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';

// Pages
const Login = React.lazy(() => import('../pages/Login'));
const Register = React.lazy(() => import('../pages/Register'));
const UnderConstruction = React.lazy(() => import('../pages/UnderConstruction'));
const Home = React.lazy(() => import('../pages/Home'));
const Produtos = React.lazy(() => import('../pages/Produtos'));
const Carrinho = React.lazy(() => import('../pages/Carrinho'));
const AdminProdutos = React.lazy(() => import('../pages/admin/Produtos'));
const AdminCategorias = React.lazy(() => import('../pages/admin/Categorias'));

const AppRoutes: React.FC = () => {
  const { signed } = useAuth();

  if (!signed) {
    return (
      <Routes>
        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
        <Route path="/under-construction" element={<UnderConstruction />} />
        <Route path="*" element={<Navigate to="/login" replace />} />
      </Routes>
    );
  }

  return (
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/produtos" element={<Produtos />} />
      <Route path="/carrinho" element={<Carrinho />} />
      <Route path="/admin">
        <Route path="produtos" element={<AdminProdutos />} />
        <Route path="categorias" element={<AdminCategorias />} />
      </Route>
      <Route path="*" element={<Navigate to="/" replace />} />
    </Routes>
  );
};

export default AppRoutes;