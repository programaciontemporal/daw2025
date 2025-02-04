/**
 * Ejercicio propuesto 1
 * Cambiar el texto de todos los botones de una página a "Clic aquí". 
 */
/*
let botonUnico = document.getElementById("botonUnico");
botonUnico.addEventListener("click", () =>{
    document.querySelectorAll("button").forEach(button => button.textContent="Click aquí");
});
*/










/**
 * Ejercicio propuesto 2
 * Crear un evento que cambie el fondo del body al hacer clic en un botón.
 */
/*
let btnBody = document.getElementById("botonBody");
btnBody.addEventListener("click", () => {
    let rojo = Math.floor(Math.random() * (255 + 1));
    let verde = Math.floor(Math.random() * (255 + 1));
    let azul = Math.floor(Math.random() * (255 + 1));
    document.body.style.backgroundColor = `rgb(${rojo}, ${verde}, ${azul})`;
});
*/










/**
 * Ejercicio propuesto 3
 * Agregar un párrafo al principio de un contenedor <div>.
 */
/*
let btnCapa = document.getElementById("botonCapa");
btnCapa.addEventListener("click", () => {
    let parrafo = document.createElement("p");
    let capa = document.getElementById("capa1");
    parrafo.textContent = 'Esto es un texto cualquiera';
    capa.appendChild(parrafo);
});
*/










/**
 * Ejercicio propuesto 4
 * Crear un botón que elimine todos los elementos de una lista.
 */
/*
let btnBorrar = document.getElementById("botonBorrar");

// opción 1 (borrar la lista entera)
btnBorrar.addEventListener("click", () => {
    let lista = document.getElementById("listaBorrar");
    /*
    lista.remove();
    */
/*
 console.log(lista);
 // opción 2 (borrar los elementos de la lista)
 while (lista.firstChild){
     lista.removeChild(lista.firstChild);
   };
});
*/









/**
 * Ejercicio propuesto 5
 * Cambiar el color de un párrafo al hacer doble clic.
 */
/*
let p = document.getElementById("colorear");
p.addEventListener("dblclick", () => {
    let rojo = Math.floor(Math.random() * (255 + 1));
    let verde = Math.floor(Math.random() * (255 + 1));
    let azul = Math.floor(Math.random() * (255 + 1));
    p.style.color = `rgb(${rojo}, ${verde}, ${azul})`;
});
*/









/**
 * Ejercicio propuesto 6
 * Mover un elemento hacia la derecha al hacer clic.
 */
/*
let div = document.getElementById("mover");
let posicion = 0;
div.addEventListener("click", () => {
    posicion += 10;
    div.style.left = posicion + "px";
    console.log("posicion =", posicion)
});
*/









/**
 * Ejercicio propuesto 7
 * Crear un botón que habilite o deshabilite un campo de texto.
 */
/*
let btnAct = document.getElementById("btnActivar");
let txt = document.getElementById("campoTexto");

btnAct.addEventListener("click", () => {
    if (txt.disabled) {
        txt.removeAttribute("disabled");
    } else {
        txt.setAttribute("disabled", true);
    }
});
*/










/**
 * Ejercicio propuesto 8
 * Mostrar un mensaje de bienvenida al cargar la página.
*/
/*
window.onload = () => {
    alert("Página cargada");
};
*/









/**
 * Ejercicio propuesto 9
 * Cambiar la imagen de fondo de la página al presionar una tecla.
 */

const images = [
    'url("img/fondo01.jpg")',
    'url("img/fondo02.jpg")',
    'url("img/fondo03.jpg")',
    'url("img/fondo04.jpg")',
    'url("img/fondo05.jpg")',
    'url("img/fondo06.jpg")',
    'url("img/fondo07.jpg")',
    'url("img/fondo08.jpg")',
    'url("img/fondo09.jpg")'
];
let contador = 0;

document.addEventListener("keydown", () => {
    document.body.style.backgroundImage = images[contador];
    contador++;
    if (contador == images.length) contador = 0;
});











/**
 * Ejercicio propuesto 10
 * Crear un evento que duplique un elemento al hacer clic.
 */
/*
document.addEventListener("click", (event) => {
    let target = event.target;
    let clone = target.cloneNode(true);
    target.parentNode.insertBefore(clone, target.nextSibling);
});
*/









/**
 * Ejercicio propuesto 11
 * Crear un selector de colores que cambie el color de un texto.
 */
/*
let color = document.getElementById("color");
let texto = document.getElementById("texto");

color.addEventListener("change", () => {
    texto.style.color = color.value;
});
*/










/**
 * Ejercicio propuesto 12
 * Cambiar el color de un texto mientras se mantiene presionado un botón del mouse.
 */
/*
let cambiar = document.getElementById("cambiarColor");
cambiar.addEventListener("mousedown", () => {
    cambiar.style.color = "blue";
});

cambiar.addEventListener("mouseup", () =>{
    cambiar.style.color = "black";
});
*/









/**
 * Ejercicio propuesto 13
 * Mostrar una notificación en consola cada vez que el valor de un input cambia.
 */
/*
let campo = document.getElementById("texto");
campo.addEventListener("change", () =>{
    console.log("el texto ha cambiado: ", campo.value);
});
*/