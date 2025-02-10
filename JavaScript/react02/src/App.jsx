import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';

function Home() {
  return <h2>Página de Inicio</h2>;
}

function About() {
  return <h2>Acerca de Nosotros</h2>;
}

function Contact() {
  return <h2>Contacto</h2>;
}

function App() {
  return (
    <Router>
      <nav style={{ marginBottom: '20px' }}>
        <Link to="/">Inicio</Link> |{' '}
        <Link to="/about">Acerca de</Link> |{' '}
        <Link to="/contact">Contacto</Link>
      </nav>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<About />} />
        <Route path="/contact" element={<Contact />} />
      </Routes>
    </Router>
  );
}

export default App;

