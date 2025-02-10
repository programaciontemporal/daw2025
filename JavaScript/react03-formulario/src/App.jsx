import { useState, useEffect } from 'react';
import './App.css';

function App() {
  // Verificar si hay un tema guardado en el localStorage
  const savedTheme = localStorage.getItem('theme') || 'light';

  // Estado para almacenar el tema
  const [theme, setTheme] = useState(savedTheme);

  // Cambiar entre tema claro y oscuro
  const toggleTheme = () => {
    const newTheme = theme === 'light' ? 'dark' : 'light';
    setTheme(newTheme);
    localStorage.setItem('theme', newTheme);  // Guardar en localStorage
  };

  // Aplicar el tema al body
  useEffect(() => {
    document.body.className = theme;
  }, [theme]);

  return (
    <div className="App">
      <h1>Aplicación con Cambio de Tema</h1>
      <button onClick={toggleTheme}>
        Cambiar a tema {theme === 'light' ? 'oscuro' : 'claro'}
      </button>
    </div>
  );
}

export default App;
