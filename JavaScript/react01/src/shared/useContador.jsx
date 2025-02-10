import { useState } from 'react';

function useContador(inicial = 0) {
  const [contador, setContador] = useState(inicial);

  const incrementar = () => setContador(c => c + 1);
  const decrementar = () => setContador(c => c - 1);
  const resetear = () => setContador(inicial);

  return { contador, incrementar, decrementar, resetear };
}

export default useContador;
