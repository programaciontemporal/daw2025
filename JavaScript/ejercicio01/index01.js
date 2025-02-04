// Ejercicios 01 Redux

// Estos son "copiaypega" del documento facilitado por Alejandro
// CONDICIONALES

/* *************************************************************************** */
// Escribe un programa que pida al usuario un número y determine si es par o impar.

/*
let numero = parseInt(prompt("Ingresa un número:"));
if (numero % 2 === 0) {
    console.log("El número es par.");
} else {
    console.log("El número es impar.");
}
*/


/* *************************************************************************** */
// Crea un programa que pida al usuario dos números e imprima cuál de ellos es mayor o si son iguales.

/*
let num1 = parseInt(prompt("Ingresa el primer número:"));
let num2 = parseInt(prompt("Ingresa el segundo número:"));

if (num1 > num2) {
    console.log(`${num1} es mayor que ${num2}`);
} else if (num1 < num2) {
    console.log(`${num2} es mayor que ${num1}`);
} else {
    console.log("Ambos números son iguales.");
}
*/

/* *************************************************************************** */
/*
Escribe un programa que pida la edad del usuario y determine
si es un niño (menor de 12 años),
un adolescente (12-17), 
un adulto (18-64) o un adulto mayor (65 o más).
*/

/*
let edad = parseInt(prompt("Ingresa tu edad:"));

if (edad < 12) {
    console.log("Eres un niño.");
} else if (edad <= 17) {
    console.log("Eres un adolescente.");
} else if (edad <= 64) {
    console.log("Eres un adulto.");
} else {
    console.log("Eres un adulto mayor.");
}
*/

/* *************************************************************************** */
/*
Crea un programa que pregunte al usuario su calificación (0-100) y determine
si ha aprobado (mayor o igual a 50) o suspenso.
*/

/*
let calificacion = parseInt(prompt("Ingresa tu calificación:"));

if (calificacion >= 50) {
    console.log("¡Aprobaste!");
} else {
    console.log("Suspendiste.");
}
*/

/* *************************************************************************** */
/*
Solicita una calificación numérica (0-100) y devuelve la calificación en letra según la escala:
•	A: 90-100
•	B: 80-89
•	C: 70-79
•	D: 50-69
•	F: menos de 50
*/
/*
let calificacion = parseInt(prompt("Ingresa tu calificación:"));
if (calificacion >= 90) {
    console.log("Tu calificación es A.");
} else if (calificacion >= 80) {
    console.log("Tu calificación es B.");
} else if (calificacion >= 70) {
    console.log("Tu calificación es C.");
} else if (calificacion >= 50) {
    console.log("Tu calificación es D.");
} else {
    console.log("Tu calificación es F.");
}
*/



/* ****************************************************************************************************************** 
                                        Estos son los de Ahora te toca a tí!!!

                                                    CONDICIONALES
********************************************************************************************************************/



/* *************************************************************************** */
// Pide la temperatura actual en grados y di si hace frío (menos de 20 grados) o calor (20 grados o más).

/*
let temperatura = parseInt(prompt("Ingresa la temperatura actual:"));
if (temperatura >= 20) {
    console.log("hace calor");
}else {
    console.log("hace frío");
}
*/

/* *************************************************************************** */
// Escribe un programa que pida un número al usuario y determine si es múltiplo de 7.
/*
let numero =parseInt(prompt("Ingresa un número:"));
if (numero % 7 === 0) {
    console.log("El número introducido SÍ es múltiplo de 7.");
}else{
    console.log("El número introducido NO es múltiplo de 7.");

}
*/

/* *************************************************************************** */
/* 
Solicita un número entre 0 y 23 que represente la hora del día e indica
si es de mañana (5 a 11)
si es de tarde (12 a 17)
si es de noche (18 a 4).
*/
/* 
let hora = parseInt(prompt("Introduce una hora (de 0 a 23):"))

if (hora >= 5 && hora <= 11){
    console.log("es de mañana.");
}else if(hora >11 && hora <=14){
    console.log("es de tarde.");
}else{
    console.log("es de noche.");
}

*/

/* *************************************************************************** */
/*
Crea un programa que solicite el precio de un producto y,
si el precio es mayor a 100, calcule el IVA (21%) y el precio final.
*/
/*
let precio = parseInt(prompt("Introduce el precio del artículo:"));
if (precio >= 100){
    console.log ("El precio final del artículo más el IVA es de: ", precio+(precio*0.21));
}else{
    console.log ("Como el precio es inferior a 100, no se calcula el IVA.");
}
*/


// BUCLES
// copiaypega de Alejandro

/* *************************************************************************** */
// Implementa un ciclo for que imprima los números del 1 al 10 en la consola.
/*
for (let i = 1; i <= 10; i++) {
    console.log(i);
}
*/

/* *************************************************************************** */
// Escribe un script que sume todos los números pares del 1 al 100 utilizando un ciclo while.
/*
let numero = 1;
let suma = 0;

// Mientras el número sea menor o igual a 100…
while (numero <= 100) {
    // Si el resto de dividir el número entre 2 es 0…
    if (numero % 2 === 0) {
        // suma = suma + numero, es decir, guarda en la variable suma el resultado de ir sumando cada vez más números que cumplen la condición
        suma += numero;
    }
    numero++;
}
console.log("La suma de todos los números pares del 1 al 100 es:", suma);
*/




/* ****************************************************************************************************************** 
                                        Estos son los de Ahora te toca a tí!!!

                                                    BUCLES
********************************************************************************************************************/




/* *************************************************************************** */
// Crea un programa que utilice un bucle while para imprimir los números del 10 al 1.
/*
let i = 10;
while(i > 0){
    console.log(i);
    i--;
}
*/

/* *************************************************************************** */
// Imprime la tabla de multiplicar del 5 (del 1 al 10) utilizando un bucle for.
/*
console.log("Tabla de multipilcar del 5 (mala rima lleva...)")
console.log("-----------------------------------------------")
for (let i=1; i <= 10; i++){
    console.log("5x", i, "=", 5 * i);
    //console.log(`5x${i}=`, 5 * i);
}
*/

// Crea un programa que imprima una cadena de caracteres (por ejemplo: hola) 5 veces.
/*
for (let i=1; i <= 5; i++){
    console.log("cosa");
}
*/






// FUNCIONES SIMPLES
// copiaypega de Alejandro

/* *************************************************************************** */
/* 
Crea una función llamada esPar que reciba un número como parámetro
y devuelva true si el número es par o false si no lo es.
*/
/*
function esPar(numero) {
    // Un número es par si el resto de su división entre 2 es 0
    return numero % 2 === 0;
}

// Ejemplos de uso
console.log(esPar(4)); // true
console.log(esPar(7)); // false
console.log(esPar(0)); // true
console.log(esPar(-2)); // true
*/

/* *************************************************************************** */
// Implementa una función llamada convertirGrados que convierta grados Celsius a Fahrenheit.
/*
function convertirGrados(celsius) {
    // Fórmula para convertir Celsius a Fahrenheit
    return (celsius * 9/5) + 32;
}

// Ejemplos de uso
console.log(convertirGrados(0)); // 32 (punto de congelación)
console.log(convertirGrados(100)); // 212 (punto de ebullición)
console.log(convertirGrados(-40)); // -40 (Celsius y Fahrenheit coinciden)
console.log(convertirGrados(10));
*/





/* ****************************************************************************************************************** 
                                        Estos son los de Ahora te toca a tí!!!

                                                    FUNCIONES
********************************************************************************************************************/




/* *************************************************************************** */
//Crea una función llamada mayor que reciba dos números y devuelva el mayor de ellos.
/*
function mayor(num1, num2) {
    let texto = null;
    if (num1 > num2) {
        texto = `${num1} es mayor que ${num2}`;
    } else if (num2 > num1) {
        texto = `${num2} es mayor que ${num1}`;
    } else {
        texto = "Ambos números son iguales";
}
return texto;
}

// Ejemplo de uso
console.log(mayor(35, 25));
console.log(mayor(25, 85));
*/

/* *************************************************************************** */
// Escribe una función llamada cuadrado que reciba un número y devuelva su cuadrado.
/*
function cuadrado(numero) {
    // versión cutre pero efectiva
    //return(numero * numero);
    // versión "pro"
    return (Math.pow(numero, 2));

}

let n = parseInt(prompt("Introduce un número:"));
console.log(cuadrado(n));
*/

/* *************************************************************************** */
// Crea una función llamada areaTriangulo que reciba la base y la altura de un triángulo y devuelva su área.
/*
function areaTriangulo(base, altura) {
    // la fórmula es (Base * Altura) / 2
    return ((base * altura) / 2);
}

console.log(areaTriangulo(5,5));    // 12.5
*/

/* *************************************************************************** */
// Escribe una función llamada promedio que reciba tres números y devuelva su promedio.

function promedio(num1, num2, num3) {
    return ((num1 + num2 + num3) / 3);
}

console.log(promedio(2, 2, 2));     //2
console.log(promedio(5, 10, 15));   //10