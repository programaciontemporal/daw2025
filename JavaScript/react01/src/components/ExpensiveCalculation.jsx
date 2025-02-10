import { useMemo, useCallback } from 'react';
import PropTypes from 'prop-types';

function ExpensiveCalculation({ num }) {
    // Simula un cálculo costoso
    const calcularFactorial = useCallback((n) => {
        console.log('Calculando factorial...');
        return n <= 0 ? 1 : n * calcularFactorial(n - 1);
    }, []);

    const factorial = useMemo(() => calcularFactorial(num), [num, calcularFactorial]);

    const handleClick = useCallback(() => {
        alert(`El factorial de ${num} es ${factorial}`);
    }, [num, factorial]);

    return (
        <div>
            <p>Factorial de {num}: {factorial}</p>
            <button onClick={handleClick}>Mostrar Resultado</button>
        </div>
    );
}
ExpensiveCalculation.propTypes = {
    num: PropTypes.number.isRequired,
};

export default ExpensiveCalculation;
