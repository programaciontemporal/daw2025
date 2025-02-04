let suma = 0;
let contador = 1;
while (contador <= 100) {
    if (contador % 2 == 0) {
        suma = contador + suma;
    }
    contador++;
}
console.log("La suma de todos los números pares del 1 al 100 es: ", suma);
