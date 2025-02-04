/**
 * 5.	Animar un Elemento
 * o	Agrega un botón con el texto "Haz clic aquí".
 * Al hacer clic en el botón, muestra un mensaje de alerta que diga "¡Botón presionado!".
 */

/*
let posicion = 0;
setInterval(() => {
    posicion += 10;
    document.getElementById("caja").style.left = posicion + "px";
}, 50);
*/

/**
 * 6.	Evento Change
 * o	Detecta cambios en un campo 
 */
/*
document.getElementById("campo").addEventListener("change", (e) => {
    document.getElementById("resultado").textContent = `Has escrito: ${e.target.value}`;
});
*/

/* ********************************************************************************************* */
/*                         Ejercicio de la parte Ahora te toca a tí!!!                           */
/* ********************************************************************************************* */

/**
 * Inserta un párrafo con texto dentro de un div con JavaScript.
 */

// CASO 01: El div ya exite
/*
let div = document.getElementById("caja");
let texto = document.createElement("p");
texto.textContent = "Este es un texto escrito con JavaScript"
div.appendChild(texto);
*/

// CASO 02: El div no existe...
/*
let body = document.body;
let div = document.createElement("div");
div.innerHTML="<p>mierdaypeo";
body.appendChild(div);
*/

/**
 * Quita la clase activo de un elemento div con id="menu".
 */

// document.getElementById("menu").classList.remove("activo");

/**
 * Cambia el texto de un párrafo cuando el mouse pasa sobre él. 
 */

/*
let parrafo = document.getElementById("menu");
parrafo.addEventListener("mouseenter", () =>{
    parrafo.textContent = "Ahora el ratón está sobre el párrafo"
});

parrafo.addEventListener("mouseleave", () =>{
    parrafo.textContent = "El ratón ya no está sobre el párrafo"
});
*/

/**
 * Muestra un mensaje cuando la página ha cargado completamente
 */
// Opción 1
/*
document.addEventListener("DOMContentLoaded", () => {
    alert("DOM listo!");
});
*/

// Opción 2, con document.body.onload()
// En esta opción creamos una función que se llama con el onload del body
/*
const cuerpoDelDocumento = document.body;
cuerpoDelDocumento.onload = avisoCarga;

function avisoCarga() {
  alert('La página terminó de cargar');
}
*/

