import Saludo from './components/Saludo';
import Counter from './components/Counter';
import Timer from './components/Timer';
import ClickButton from './components/ClickButton';
import LoginStatus from './components/LoginStatus';
import ListaUsuarios from './components/ListaUsuarios';

import './App.css'
import ExpensiveCalculation from './components/ExpensiveCalculation';
import ContadorPersonalizado from './components/ContadorPersonalizado';

function App() {
  // Datos para la lista de usuarios
  const usuarios = [
    { id: 1, nombre: 'Ana', email: 'ana@mail.com' },
    { id: 2, nombre: 'Luis', email: 'luis@mail.com' },
    { id: 3, nombre: 'Sofía', email: 'sofia@mail.com' },
  ];

  return (
    <>
      {/* Saludo */}
      <div className='div1'>
        <h1>Aplicación de Ejemplo con Props</h1>
        <Saludo nombre="Carlos" edad={28} />
        <Saludo nombre="María" edad={32} />
      </div>
      <hr />

      <div className='div1'>
        <h1>Ejemplos de useState y useEffect</h1>
        {/* Contador */}
        <Counter />

        {/* Timer */}
        <Timer />
      </div >
      <hr />

      {/* Evento botón */}
      <div className='div1'>
        <h1>Manejo de Eventos en React</h1>
        <ClickButton />
      </div>
      <hr />

      {/* La cosa del login que no tiene ejemplo en App.jsx */}
      <div className='div1'>
        {/* <LoginStatus isLoggedIn={true} /> Con esta línea, da el mensaje de bienvenido */}
        <LoginStatus />
      </div>
      <hr />

      {/* Lista de usuarios */}
      <div className='div1'>
        <h1>Renderizado Condicional y Listas</h1>
        <LoginStatus isLoggedIn={true} />
        <hr />
        <ListaUsuarios usuarios={usuarios} />
      </div>
      <hr />

      {/* Expensive Calculation */}
      <div className='div1'>
        <h1>Expensive Calculation</h1>
        <ExpensiveCalculation num={10}/>
      </div>
      <hr />

      {/* Contador Personalizado */}
      <div className='div1'>
        <ContadorPersonalizado />
      </div>

    </>
  );
}

export default App;
