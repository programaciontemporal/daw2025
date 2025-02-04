/*
const numeros = [50, 20, 10, 40, 30];
const ordenado = numeros.slice().sort((a, b) => a - b);

console.log("Array original (numeros):", numeros);
console.log("Array ordenado:", ordenado);



let numeros2 = [51, 21, 11, 41, 31];
let ordenado2 = numeros2.toSorted();
console.log("Array original (numeros2):", numeros2);
console.log("Array ordenado2:", ordenado2);

console.log(numeros2[0]+numeros2[1]);
*/

/**
 * 1.	Cambio de Texto de un Elemento
 * o	Cambia el texto de un elemento con id="titulo" a "Hola, DOM".
 * 
 * Yo añado un botón para cambiarlo
*/

let boton = document.getElementById("boton1");
boton.addEventListener("click", () => {
    document.getElementById("titulo1").textContent = "Hola, cambiado con DOM";
});


/**
 * 2.	Cambiar Color de un Elemento
 * o	Cambia el color de texto de un párrafo con id="parrafo" a rojo.
*/

// reusando variables
boton = document.getElementById("boton2");
boton.addEventListener("click", () => {
    document.getElementById("parrafo1").style.color = "red";
});

/**
 * 3.	Ocultar un Elemento
 * o	Crea un script que agregue un nuevo elemento <li>
 *      con el texto "Nuevo Elemento" a una lista <ul> ya existente en la página.
 * 
 * el enunciado no corresponde al ejercicio.
 * o    Crea un script que oculte una capa <div> al pulsarla
 */

// reusando el botón
boton = document.getElementById("boton3");
boton.addEventListener("click", () => {
    if (document.querySelector(".caja").style.display === "none") {
        document.querySelector(".caja").style.display = "block"
    } else {
        document.querySelector(".caja").style.display = "none"
    };
});

/**
 * 4.	Agregar una Clase a un Elemento
 * o	Agrega la clase resaltado a un párrafo con id="parrafo".
 * (en el ejercicio no lo pone, pero voy asignar ese estilo en CSS)
 */
let element = null;
boton = document.getElementById("boton4");
boton.addEventListener("click", () => {
    let clase = document.getElementById("parrafo2").classList.contains('normal');
    if (clase) {
        document.getElementById("parrafo2").className = "resaltado";
    } else {
        document.getElementById("parrafo2").className = "normal";
    }
});
