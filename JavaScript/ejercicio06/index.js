/**
 * Ejercicio 9
 * Crea una función que elimine los números negativos de un array.
 */
/*
let numeros = [67, 6, 23, 11, 100, 8, 3, 93, 0, 17, 24, 7, -2, 33, 45, 28, 33, 23, -12, 99, 100];

numeros.forEach(numero => {
    if (numero < 0)
        numeros.splice(numeros.indexOf(numero), 1);
});

console.log(numeros);
*/









/**
 * Ejercicio 10
 * Crea un programa que determine si un número es divisible entre 3 y 5
 */
/*
let num = parseInt(prompt("Introduce un número"));

function divisible(numero){
    let retorno;
    if (numero % 3 == 0 && numero % 5 == 0){
        retorno="El número es dibisible entre 3 y entre 5.";
    }else{
        retorno = "El número no es divisible entre 3 y entre 5.";
    }
    return(retorno)
}

console.log(divisible(num));
*/









/**
 * Ejercicio 11
 * Escribe un programa que multiplique todos los números de un array por un número dado.
 */
/*
let numero = parseInt(prompt("Introduce un número para hacer su tabla de multiplicar:"));

const numeros = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

console.log("**************************************************")
console.log("*              Tabla de multiplicar *             ")
console.log("**************************************************")
console.log(`Tabla del ${numero}:`);
for (i=0;i<=10;i++){
    console.log(`${numeros[i]} x ${numero} = ${numeros[i]*numero}`);
}
console.log("**************************************************");
*/









/**
 * Ejercicio 12
 * Escribe un programa que genere un número aleatorio entre 1 y 100.
 */
const numero = Math.random()*100;
//const min = 1;
//const max = 5;
// realmente sería Math.floor(Math.random() * (max - min + 1) + min)
for(i=0;i<= 100; i++)
    console.log(Math.floor(Math.random() * (100 - 1) + 1));
