import useContador from "../shared/useContador";

function ContadorPersonalizado() {
    const { contador, incrementar, decrementar, resetear } = useContador(10);
  
    return (
      <div>
        <h2>Contador Personalizado: {contador}</h2>
        <button onClick={incrementar}>+</button>
        <button onClick={decrementar}>-</button>
        <button onClick={resetear}>Resetear</button>
      </div>
    );
  }
  
  export default ContadorPersonalizado;
  