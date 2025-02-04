// DOM
// Copiapega de Alejandro

/**
 * 1.	Cambio de Texto
 *      Crea una página HTML con un elemento <h1> que diga "Hola Mundo".
 *      Escribe un script que cambie el texto del <h1> a "Bienvenidos a la Web".
 */

/*
// Seleccionar el elemento h1 por su ID
let titulo = document.getElementById("titulo");

// Cambiar el texto del h1
titulo.textContent = "Bienvenidos a la Web";
*/

/**
 * 2.	Modificación de Estilos
 *      Agrega un párrafo a tu página con el texto "Este es un texto importante".
 *      Usa JavaScript para cambiar el color de fuente del párrafo a rojo y su tamaño a 20px.
 */
// Seleccionar el párrafo por su ID
/*
const parrafo = document.getElementById("textoImportante");

// Cambiar el color de la fuente a rojo
parrafo.style.color = "#CCCCCC";

// Cambiar el tamaño de la fuente a 20px
parrafo.style.fontSize = "20px";
*/

/**
 * 3.	Agregar Elementos
 *      Crea un script que agregue un nuevo elemento <li> con el texto "Nuevo Elemento" a una lista <ul> ya existente en la página.
 */
/*
// Seleccionar la lista <ul> por su ID
const lista = document.getElementById("miLista");
// Crear un nuevo elemento <li>
const nuevoElemento = document.createElement("li");
// Agregar texto al nuevo <li>
nuevoElemento.textContent = "Nuevo Elemento";
// Añadir el nuevo <li> a la lista <ul>
lista.appendChild(nuevoElemento);
*/


/**
 * 4.	Eliminación de Elementos
 *      Diseña una página HTML con una lista de 3 elementos.
 *      Escribe un script que elimine el primer elemento de la lista.
*/
/*
 // Seleccionar la lista <ul>
 const lista = document.getElementById("miLista2");

 // Eliminar el primer elemento <li>
 if (lista.firstElementChild) {
     lista.removeChild(lista.firstElementChild);
 }
*/

/**
 * 5.	Interactividad con Eventos
 *      Agrega un botón con el texto "Haz clic aquí".
 *      Al hacer clic en el botón, muestra un mensaje de alerta que diga "¡Botón presionado!".
*/
// Seleccionar el botón por su ID
/*
const boton = document.getElementById("miBoton");

// Agregar un evento de clic al botón
let pulsado = 0;
boton.addEventListener("click", () => {
    pulsado++;
    boton.textContent = "Botón presionado " + pulsado + " veces";
    //alert("¡Botón presionado!");
});
*/

/**
 * 6.	Cambiar Imágenes
 *      Crea una página con una imagen.
 *      Usa JavaScript para cambiar la fuente (src) de la imagen al hacer clic en ella.
 */
// Seleccionar la imagen por su ID
/*
const imagen = document.getElementById("miImagen");
// Cambiar el src de la imagen al hacer clic
imagen.addEventListener("click", () => {
    imagen.src = "https://cdn.pixabay.com/photo/2024/12/04/15/37/leaves-9244714_640.jpg";
});
*/

/**
 * Crea un párrafo con el texto "Texto inicial". Usa JavaScript para cambiarlo a "Texto cambiado" al hacer clic en él.
 */
/*
let texto = document.getElementById("cambiarTexto");
texto.addEventListener("click", () => {
    if (texto.textContent == "Texto inicial"){
        texto.textContent="Texto Cambiado";
    }else{
        texto.textContent="Texto inicial";
    }
});
*/

/**
 * Crea un botón que, al hacer clic, cambie el color de fondo de la página a azul.
 */
/*
 let boton =document.getElementById("botonFondo");
 boton.addEventListener("click", () => {
    document.body.style.backgroundColor ="blue";
 });
*/

/**
 * Crea un botón que cambie su propio texto a "Botón presionado" al hacer clic.
 */
/*
let boton3 = document.getElementById("boton3");
boton3.addEventListener("click", () => {
    boton3.textContent = "Cambiado. Te lo dije";
});
*/

/**
 * Crea un párrafo cuyo color cambie a verde al pasar el ratón sobre él y vuelva a negro al quitar el ratón.
 */

let parrafo = document.getElementById("parrafoColor");

parrafo.addEventListener("mouseenter", () => {
    parrafo.style.color="green";
});

parrafo.addEventListener("mouseout", () => {
    parrafo.style.color="black";
});
