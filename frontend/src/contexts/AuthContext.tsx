import { createContext, useContext, useState, useCallback, ReactNode } from 'react';
import { useNavigate } from 'react-router-dom';
import { toast } from 'react-toastify';
import api from '../services/api';

interface User {
  id: string;
  nome: string;
  email: string;
  perfil: string;
}

interface AuthState {
  token: string;
  user: User;
}

interface SignInCredentials {
  email: string;
  senha: string;
  code2FA?: string;
}

interface AuthContextData {
  user: User;
  signIn: (credentials: SignInCredentials) => Promise<void>;
  signOut: () => void;
  isAuthenticated: boolean;
  isDemoMode: boolean;
  enableDemoMode: () => Promise<void>;
  disableDemoMode: () => void;
}

const AuthContext = createContext<AuthContextData>({} as AuthContextData);

interface AuthProviderProps {
  children: ReactNode;
}

export function AuthProvider({ children }: AuthProviderProps) {
  const navigate = useNavigate();
  const [data, setData] = useState<AuthState>(() => {
    const token = localStorage.getItem('@ZettaMercado:token');
    const user = localStorage.getItem('@ZettaMercado:user');

    if (token && user) {
      api.defaults.headers.authorization = `Bearer ${token}`;
      return { token, user: JSON.parse(user) };
    }

    return {} as AuthState;
  });

  const [isDemoMode, setIsDemoMode] = useState(() => {
    return localStorage.getItem('@ZettaMercado:demoMode') === 'true';
  });

  const signIn = useCallback(async ({ email, senha, code2FA }: SignInCredentials) => {
    try {
      const response = await api.post('/auth/login', { email, senha });
      const { token, qrCodeUrl } = response.data;

      if (qrCodeUrl) {
        // Primeiro login, precisa configurar 2FA
        localStorage.setItem('@ZettaMercado:tempToken', token);
        navigate('/setup-2fa', { state: { qrCodeUrl } });
        return;
      }

      if (!code2FA) {
        // Precisa do código 2FA
        localStorage.setItem('@ZettaMercado:tempToken', token);
        navigate('/verify-2fa', { state: { email } });
        return;
      }

      // Verificar código 2FA
      const verify2FAResponse = await api.post('/auth/verify-2fa', { email, code: code2FA });
      const { token: finalToken } = verify2FAResponse.data;

      const userResponse = await api.get('/usuarios/me', {
        headers: { Authorization: `Bearer ${finalToken}` }
      });

      localStorage.setItem('@ZettaMercado:token', finalToken);
      localStorage.setItem('@ZettaMercado:user', JSON.stringify(userResponse.data));

      api.defaults.headers.authorization = `Bearer ${finalToken}`;

      setData({ token: finalToken, user: userResponse.data });
      navigate('/');
    } catch (error) {
      toast.error('Erro ao fazer login. Verifique suas credenciais.');
    }
  }, [navigate]);

  const signOut = useCallback(() => {
    localStorage.removeItem('@ZettaMercado:token');
    localStorage.removeItem('@ZettaMercado:user');
    localStorage.removeItem('@ZettaMercado:demoMode');
    setData({} as AuthState);
    setIsDemoMode(false);
    navigate('/login');
  }, [navigate]);

  const enableDemoMode = useCallback(async () => {
    try {
      const response = await api.get('/demo/token');
      const { token } = response.data;

      api.defaults.headers.authorization = `Bearer ${token}`;
      localStorage.setItem('@ZettaMercado:demoMode', 'true');
      setIsDemoMode(true);
      navigate('/');
    } catch (error) {
      toast.error('Erro ao ativar modo demonstração.');
    }
  }, [navigate]);

  const disableDemoMode = useCallback(() => {
    localStorage.removeItem('@ZettaMercado:demoMode');
    setIsDemoMode(false);
    navigate('/login');
  }, [navigate]);

  return (
    <AuthContext.Provider
      value={{
        user: data.user,
        signIn,
        signOut,
        isAuthenticated: !!data.token,
        isDemoMode,
        enableDemoMode,
        disableDemoMode,
      }}
    >
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth(): AuthContextData {
  const context = useContext(AuthContext);

  if (!context) {
    throw new Error('useAuth must be used within an AuthProvider');
  }

  return context;
} 