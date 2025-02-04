/**
 * Ejercicio 1
 * función que convierte de kilómetros a millas
 */
/*
function millas(km){
    return(km / 0.62137);
}

console.log(millas(100));
console.log(millas(74));
console.log(millas(1));
*/









/**
 * Ejercicio 2
 * escribe un programa que cuente las palabras de una frase.
 */
/*
let texto = "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Explicabo hic sapiente consequuntur qui quos soluta cumque eum fugiat quam fuga quas sequi beatae iste, repellat magnam earum error quis ut ea officia voluptates? Commodi ipsum laudantium iure nobis animi dolorum at veniam culpa tenetur nostrum corrupti voluptatibus deserunt, dolore similique?";
console.log(texto.split(" ").length);
*/








/**
 * Ejercicio 3
 * Crea una función que devuelva el número mayor de tres números dados.
 */
/*
let num1 = 100;
let num2 = 40;
let num3 = 75;

function numeroMayor(n1, n2, n3) {
    //resultado = "El mayor de los tres números es: "
    if (n1 > n2 && n1 > n3) {
        return(n1);
    } else if (n2 > 1 && n2 > n3) {
        return(n2);
    } else {
        return(n3);
    }
    //return(resutlado)
}

console.log(numeroMayor(num1, num2, num3))
*/









/**
 * Ejercicio 4
 *Crea un array con los números del 1 al 10 y calcula la suma de todos los elementos.
 */
/*
let array = [];
let suma = 0;
for (let i = 1; i <= 10; i++){
    array[i] = i;
}

array.forEach(valor => {
    suma += valor;
});

console.log(suma);
*/









/**
 * Ejercicio 5
 * Escribe un programa que devuelva los números impares del 1 al 20.
 */
/*
for (let i = 1; i <= 20; i+=2){
    console.log(i);
}
*/









/**
 * Crea una función que devuelva el menor número de un array.
 */
/*
let numeros = [ 67, 6, 23, 11, 100, 8, 3, 93, 0, 17, 24, 7, -2, 33, 45, 28, 33, 23, -12, 99, 100 ];
console.log(Math.min.apply(Math, numeros));
console.log(Math.min(...numeros));
*/









/**
 * Ejercicio 7
 * Escribe una función que devuelva true si una palabra tiene más de 5 caracteres.
 */
/*
let cadena = prompt("Introduce una palabra:");
function masDeCinco(texto) {
    if (texto.length >= 5) {
        return(true);
    }else{
        return(false);
    }
}

console.log(masDeCinco(cadena));
*/









/**
 * Ejercicio 8
 * Crea un programa que cuente cuántas veces aparece un número en un array.
 */
/*
let numero = parseInt(prompt('Introduce un número de -12 a 100:'));
let arrayDeNumeros = [ 67, 6, 23, 11, 100, 8, 3, 93, 0, 17, 24, 7, -2, 33, 45, 28, 33, 23, -12, 99, 100 ];
let repeticiones = 0;

arrayDeNumeros.forEach(valor =>{
    if (valor === numero){
        repeticiones++;
    }
})

console.log(`El número ${numero} se repite ${repeticiones} veces.`)
*/









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

