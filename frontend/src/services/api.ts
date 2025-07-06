import axios from 'axios';

const api = axios.create({
  baseURL: process.env.REACT_APP_API_URL || 'http://localhost:8080/api',
  headers: {
    'Content-Type': 'application/json',
  },
});

api.interceptors.response.use(
  response => response,
  error => {
    if (error.response?.status === 401) {
      localStorage.removeItem('@ZettaMercado:token');
      localStorage.removeItem('@ZettaMercado:user');
      window.location.href = '/login';
    }
    return Promise.reject(error);
  }
);

export default api; 