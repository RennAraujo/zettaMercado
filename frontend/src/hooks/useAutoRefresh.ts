import { useEffect, useRef } from 'react';

interface UseAutoRefreshOptions {
  interval?: number; // em milissegundos, padrão 30 segundos
  enabled?: boolean; // permite habilitar/desabilitar o refresh
}

export const useAutoRefresh = (
  callback: () => void | Promise<void>,
  options: UseAutoRefreshOptions = {}
) => {
  const { interval = 30000, enabled = true } = options;
  const callbackRef = useRef(callback);
  const intervalRef = useRef<NodeJS.Timeout | null>(null);

  // Atualiza a referência do callback sempre que ele mudar
  useEffect(() => {
    callbackRef.current = callback;
  }, [callback]);

  useEffect(() => {
    if (!enabled) {
      if (intervalRef.current) {
        clearInterval(intervalRef.current);
        intervalRef.current = null;
      }
      return;
    }

    // Executa o callback imediatamente na primeira vez
    const executeCallback = async () => {
      try {
        await callbackRef.current();
      } catch (error) {
        console.error('Erro no auto-refresh:', error);
      }
    };

    // Configura o intervalo
    intervalRef.current = setInterval(executeCallback, interval);

    // Cleanup
    return () => {
      if (intervalRef.current) {
        clearInterval(intervalRef.current);
        intervalRef.current = null;
      }
    };
  }, [interval, enabled]);

  // Função para forçar refresh manual
  const forceRefresh = async () => {
    try {
      await callbackRef.current();
    } catch (error) {
      console.error('Erro no refresh manual:', error);
    }
  };

  return { forceRefresh };
};