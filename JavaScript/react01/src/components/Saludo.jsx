import PropTypes from 'prop-types';

function Saludo({ nombre, edad }) {
  return (
    <div>
      <h2>Hola, {nombre}!</h2>
      <p>Tienes {edad} años.</p>
    </div>
  );
}
Saludo.propTypes = {
  nombre: PropTypes.string.isRequired,
  edad: PropTypes.number.isRequired,
};

export default Saludo;
