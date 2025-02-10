import PropTypes from 'prop-types';

function ListaUsuarios({ usuarios }) {
    return (
        <ul>
            {usuarios.map((usuario) => (
                <li className='lista-usuarios' key={usuario.id}>
                    {usuario.nombre} - {usuario.email}
                </li>
            ))}
        </ul>
    );
}

ListaUsuarios.propTypes = {
    usuarios: PropTypes.arrayOf(
        PropTypes.shape({
            id: PropTypes.number.isRequired,
            nombre: PropTypes.string.isRequired,
            email: PropTypes.string.isRequired
        })
    ).isRequired
};

export default ListaUsuarios;
