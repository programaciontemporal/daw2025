let numero = null;
do {
    numero = prompt("Introduce un número");
    if (numero != 0) {
        alert("Número no válido");
    } else {
        alert("Acertaste el número");
    }
} while (numero != 0);