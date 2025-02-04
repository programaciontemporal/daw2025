// Funciones más complejas
// copiaypega de Alejandro


/*
Crea una función llamada calcularAreaCirculo que reciba como parámetro
el radio de un círculo y devuelva el área del círculo.
*/
/*
function calcularAreaCirculo(radio) {
    return Math.PI * Math.pow(radio, 2);
}

// Ejemplo de uso
console.log(calcularAreaCirculo(5)); // 78.53981633974483
console.log(calcularAreaCirculo(10)); // 314.1592653589793
*/

/* ****************************************************************************************************************** 
                                        Estos son los de Ahora te toca a tí!!!

                                               FUNCIONES COMPLEJAS
********************************************************************************************************************/

/* *************************************************************************** */
/*
Crea una función llamada calcularPerimetro que reciba como parámetros el largo y el ancho de un rectángulo
y devuelva su perímetro.
*/
/*
function calcularPerimetro(largo, ancho){
    // el perímetro es la suma de los 4 lados, así que...
    // largo * 2 + ancho * 2
    return((largo * 2) + (ancho * 2));
}

console.log(calcularPerimetro(10, 10));     // Fácil para empezar, 40
console.log(calcularPerimetro(230, 420));   // 1300
*/

/* *************************************************************************** */
//Crea una función llamada volumenCubo que reciba un lado del cubo y devuelva su volumen.
/*
function volumenCubo(lado){
    // versión cutrelux que funciona
    return(lado * lado * lado)
    // versión pro
    //return(Math.pow(lado, 3));
}

console.log(volumenCubo(10));       // 1000
console.log(volumenCubo(25));       // 15625
*/




// Objetos
// copiaypega de Alejandro




/* *************************************************************************** */
/* 
Crea un objeto llamado persona con las propiedades nombre, edad y ocupacion.
Luego, muestra en la consola su nombre y edad.
*/
/*
// Definimos el objeto
const persona = {
    nombre: "Juan",
    edad: 25,
    ocupacion: "Desarrollador"
};

// Accedemos a las propiedades
console.log("Nombre:", persona.nombre); // "Juan"
console.log("Edad:", persona.edad); // 25
*/


/* *************************************************************************** */
/**
 * Crea un objeto llamado auto con las propiedades marca, modelo y matrícula. 
*/
/*
// Definimos el objeto
const auto = {
    marca: "Toyota",
    modelo: "Corolla",
    matricula: "2222FFF"
};
console.log(auto); // Resultado: { marca: 'Toyota', modelo: 'Camry', matricula: 2222FFF}
*/



/* ****************************************************************************************************************** 
                                    Estos son los de Ahora te toca a tí!!!

                                                OBJETOS
********************************************************************************************************************/



/* *************************************************************************** */
/**
 * Crea un objeto llamado libro con las propiedades titulo, autor y anio.
 * Luego, muestra en la consola el título y el autor del libro.
*/
/*
const libro = {
    titulo: "Manual de JavaScript",
    autor: "Jose Antonio Rodríguez",
    anio: "1999"
};

console.log(libro.titulo);
console.log(libro.autor);
console.log(libro.anio);
*/

/* *************************************************************************** */
// Crea un objeto llamado producto con las propiedades nombre, stock y precio. 
/*
const producto = {
    nombre: "Ratón Logitech",
    stock: 230,
    precio: 59.95
};

console.log(producto.nombre);
console.log(producto.stock);
console.log(producto.precio);
*/

/* *************************************************************************** */
// Crea un objeto llamado estudiante con las propiedades nombre, edad, carrera y universidad. 
/*
const estudiante = {
    nombre: "Paco Pepe",
    edad: 25,
    carrera: "Matemáticas",
    universidad: "Carlos III"
};

console.log(estudiante.nombre);
console.log(estudiante.edad);
console.log(estudiante.carrera);
console.log(estudiante.universidad);
*/




// Arrays
// copiaypega de Alejandro

/* *************************************************************************** */
// Crea un programa que tome un array de números y calcule la suma de todos sus elementos.
// Definir el array de números
/*
const numeros = [10, 20, 30, 40, 50];

// Inicializar la variable para la suma
let suma = 0;

// Recorrer el array y sumar cada elemento
for (let i = 0; i < numeros.length; i++) {
    suma += numeros[i];
}

// Imprimir la suma total
console.log("La suma de los números es:", suma);    // 150
*/

/* *************************************************************************** */
// Crea un array que contenga los números del 1 al 10 e imprime cada número en la consola.
// Crear el array con los números del 1 al 10
/*
const numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
// Recorrer el array e imprimir cada número
for (let i = 0; i < numeros.length; i++) {
    console.log(numeros[i]);
}
*/

/* *************************************************************************** */
// Crea un programa que tome un array de números y lo ordene de menor a mayor.
/*
const numeros = [50, 20, 10, 40, 30];
//const ordenado = numeros.slice().sort((a, b) => a - b);
//const ordenado = numeros.sort();
const ordenado = numeros.sort(function(a, b){return a-b});
console.log("Array principal:", numeros)
console.log("Array ordenado:", ordenado);
*/

/* *************************************************************************** */
// Crea un array y verifica si contiene un valor dado.
/*
const numeros = [10, 20, 30, 40, 50];
const buscar = 30;
const existe = numeros.includes(buscar);
console.log(`¿El número ${buscar} está en el array?`, existe);
*/

/* *************************************************************************** */
// Crea un array vacío y agrega un elemento al final.
/*
const frutas = [];
frutas.push("manzana");
console.log("Array después de agregar un elemento:", frutas);
*/





/* ****************************************************************************************************************** 
                                    Estos son los de Ahora te toca a tí!!!

                                                ARRAYS
********************************************************************************************************************/



/* *************************************************************************** */
// Crea un array con los números pares del 2 al 20 e imprime cada número en la consola.
/*
const pares = [];
for (let i = 2; i <= 20; i += 2) {
    pares.push(i);
}
for (let i = 0;i <= pares.length-1; i++){
    console.log(pares[i]);    
}
*/

/* *************************************************************************** */
// Crea un array con tres nombres de colores e imprime cada uno en la consola.
const colores = ["rojo", "verde", "azul"];
console.log(colores[0]);
console.log(colores[1]);
console.log(colores[2]);
