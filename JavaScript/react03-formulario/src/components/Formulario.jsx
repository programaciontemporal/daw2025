import { useState } from 'react';

function Formulario() {
  const [nombre, setNombre] = useState('');
  const [email, setEmail] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    alert(`Nombre: ${nombre}\nEmail: ${email}`);
  };

  return (
    <form onSubmit={handleSubmit}>
      <div>
        <label>Nombre: </label>
        <input type="text" value={nombre} onChange={(e) => setNombre(e.target.value)} />
      </div>
      <div>
        <label>Email: </label>
        <input type="email" value={email} onChange={(e) => setEmail(e.target.value)} /> </div>
      <button type="submit">Enviar</button>
    </form>
  );
}

export default Formulario;
