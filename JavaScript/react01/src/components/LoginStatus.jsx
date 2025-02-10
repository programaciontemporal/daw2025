import PropTypes from 'prop-types';

function LoginStatus({ isLoggedIn }) {
    return (
        <div>
            {isLoggedIn
                ? <p>Bienvenido, usuario!</p>
                : <p>Por favor, inicia sesión.</p>}
        </div>
    );
};
LoginStatus.propTypes = {
    isLoggedIn: PropTypes.bool.isRequired,
};

export default LoginStatus;

