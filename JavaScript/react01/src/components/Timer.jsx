import { useState, useEffect } from 'react';

function Timer() {
    const [segundos, setSegundos] = useState(0);

    useEffect(() => {
        const intervalo = setInterval(() => {
            setSegundos((prev) => prev + 1);
        }, 1000);

        // Limpieza del intervalo cuando el componente se desmonta
        return () => clearInterval(intervalo);
    }, []);

    return (
        <div>
            <h2>Tiempo transcurrido: {segundos} segundos</h2>
        </div>
    );
}

export default Timer;
