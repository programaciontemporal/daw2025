function tituloEjercicio(numero){
    return(`Ejercicio ${numero}\r\n\r\n------------------------------------------------------------------\r\n`);
}


/** ***********************************************************************************************
 * 1.	Crear una Clase Básica:
 * o	Define una clase Persona con las propiedades nombre y edad.
 *      Crea un método presentarse que devuelva un mensaje como:
 *      "Hola, mi nombre es [nombre] y tengo [edad] años".
 *      Luego, crea una instancia de la clase e imprime el mensaje en la consola.
*/
/*
console.log(tituloEjercicio(1));

class Persona {
    constructor(nombre, edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    presentarse() {
        return `Hola, mi nombre es ${this.nombre} y tengo ${this.edad} años.`;
    }
};

// Crear una instancia de la clase Persona
const persona1 = new Persona("Juan", 30);

// Imprimir el mensaje de presentación
console.log(persona1.presentarse());
*/







/** ***********************************************************************************************
 * 2.	Constructores:
 *      o	Añade un constructor a la clase Coche que reciba como parámetros el modelo, la marca y el año.
 *      Crea una instancia de Coche e imprime sus propiedades en la consola.
 */
/*
console.log(tituloEjercicio(2));

class Coche {
    constructor(modelo, marca, año) {
        this.modelo = modelo;
        this.marca = marca;
        this.año = año;
    }
}

// Crear una instancia de la clase Coche
const miCoche = new Coche("Civic", "Honda", 2022);

// Imprimir las propiedades del coche en la consola
console.log(`Modelo: ${miCoche.modelo}`);
console.log(`Marca: ${miCoche.marca}`);
console.log(`Año: ${miCoche.año}`);
*/









/** ***********************************************************************************************
 * 3.	Métodos de una Clase:
 * o	Crea una clase Contador con una propiedad cuenta inicializada en 0.
 *      Añade métodos para incrementar, decrementar y mostrar el valor actual de cuenta.
 */
/*
console.log(tituloEjercicio(3));

class Contador {
    constructor() {
        this.cuenta = 0; // Inicializar la propiedad cuenta en 0
    }

    incrementar() {
        this.cuenta++;
    }

    decrementar() {
        this.cuenta--;
    }

    mostrarCuenta() {
        return `El valor actual de la cuenta es: ${this.cuenta}`;
    }
}

// Crear una instancia de la clase Contador
const contador = new Contador();

// Usar los métodos de la clase
contador.incrementar();
contador.incrementar();
console.log(contador.mostrarCuenta()); // El valor actual de la cuenta es: 2

contador.decrementar();
console.log(contador.mostrarCuenta()); // El valor actual de la cuenta es: 1
*/








/** ***********************************************************************************************
 * 4.	Herencia:
 * o	Define una clase Animal con un método hablar.
 *      Luego, crea una clase Perro que herede de Animal y sobrescriba el método hablar para que devuelva "Guau, guau".
 */
// Definición de la clase Animal
/*
console.log(tituloEjercicio(4));

class Animal {
    hablar() {
        return "El animal hace un sonido.";
    }
}

// Definición de la clase Perro que hereda de Animal
class Perro extends Animal {
    hablar() {
        return "Guau, guau";
    }
}
const miBicho = new Animal();
// Crear una instancia de la clase Perro
const miPerro = new Perro();

// Usar el método hablar
console.log(miBicho.hablar())     // El animal hace un sonido
console.log(miPerro.hablar()); // Guau, guau
*/









/** ***********************************************************************************************
 * 5.	Getters y Setters:
 * o	Crea una clase Rectangulo con propiedades ancho y alto.Añade métodos get para calcular el área y el perímetro.
 *      Instancia un rectángulo e imprime sus valores.
 */
/*
console.log(tituloEjercicio(5));

class Rectangulo {
    constructor(ancho, alto) {
        this.ancho = ancho;
        this.alto = alto;
    }

    // Método get para calcular el área
    get area() {
        return this.ancho * this.alto;
    }

    // Método get para calcular el perímetro
    get perimetro() {
        return 2 * (this.ancho + this.alto);
    }
}

// Crear una instancia de la clase Rectangulo
const miRectangulo = new Rectangulo(10, 5);

// Imprimir los valores del área y el perímetro
console.log(`Ancho: ${miRectangulo.ancho}`);
console.log(`Alto: ${miRectangulo.alto}`);
console.log(`Área: ${miRectangulo.area}`);
console.log(`Perímetro: ${miRectangulo.perimetro}`);
*/









/** ***********************************************************************************************
 * 6.	Encapsulamiento:
 *      o	Implementa una clase Banco con una propiedad privada saldo.Añade métodos públicos para depositar,
 *          retirar y consultar el saldo.
 */
/*
console.log(tituloEjercicio(6));

class Banco {
    #saldo; // Declarar la propiedad privada

    constructor(saldoInicial = 0) {
        this.#saldo = saldoInicial; // Inicializar el saldo
    }

    // Método para depositar dinero
    depositar(cantidad) {
        if (cantidad > 0) {
            this.#saldo += cantidad;
            console.log(`Has depositado ${cantidad}.`);
        } else {
            console.log("La cantidad a depositar debe ser mayor a 0.");
        }
    }

    // Método para retirar dinero
    retirar(cantidad) {
        if (cantidad > 0 && cantidad <= this.#saldo) {
            this.#saldo -= cantidad;
            console.log(`Has retirado ${cantidad}.`);
        } else if (cantidad > this.#saldo) {
            console.log("Fondos insuficientes.");
        } else {
            console.log("La cantidad a retirar debe ser mayor a 0.");
        }
    }

    // Método para consultar el saldo
    consultarSaldo() {
        return `Tu saldo actual es: ${this.#saldo}`;
    }
}

// Crear una instancia de la clase Banco
const miBanco = new Banco(1000);

// Usar los métodos públicos
miBanco.depositar(500);
console.log(miBanco.consultarSaldo()); // Tu saldo actual es: 1500

miBanco.retirar(300);
console.log(miBanco.consultarSaldo()); // Tu saldo actual es: 1200

miBanco.retirar(2000); // Fondos insuficientes.
console.log(miBanco.consultarSaldo()); // Tu saldo actual es: 1200
*/










/** ***********************************************************************************************
 * 7.	Polimorfismo:
 *      o	Crea una clase base Instrumento con un método tocar.
 *      Luego, crea las clases Guitarra y Bateria que hereden de Instrumento y
 *      sobrescriban el método tocar con mensajes diferentes.
 */
/*
console.log(tituloEjercicio(7));

// Clase base Instrumento
class Instrumento {
    tocar() {
        return "Estoy tocando un instrumento.";
    }
}

// Clase Guitarra que hereda de Instrumento
class Guitarra extends Instrumento {
    tocar() {
        return "Estoy tocando la guitarra: Strum, strum!";
    }
}

// Clase Batería que hereda de Instrumento
class Bateria extends Instrumento {
    tocar() {
        return "Estoy tocando la batería: Boom, boom, clap!";
    }
}

// Crear instancias de cada clase
const miGuitarra = new Guitarra();
const miBateria = new Bateria();

// Usar el método tocar en cada instancia
console.log(miGuitarra.tocar()); // Estoy tocando la guitarra: Strum, strum!
console.log(miBateria.tocar());  // Estoy tocando la batería: Boom, boom, clap!
*/









/** ***********************************************************************************************
 *                                      AHORA TE TOCA A TÍ!!!
 *********************************************************************************************** */









/**
 * Ejercicio 1: Clase Persona
 * Crea una clase llamada Persona con las propiedades nombre y edad.
 * Añade un método saludar que devuelva un mensaje como:
 * "Hola, mi nombre es [nombre] y tengo [edad] años."
 * Crea una instancia de la clase y muestra el mensaje en la consola.
 */
/*
console.log(tituloEjercicio(1));
class Persona {
    constructor(nombre, edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    // Método para presentarse
    presentarse() {
        return `Hola, mi nombre es ${this.nombre} y tengo ${this.edad} años.`;
    }
    presentarseDos() {
        return "Hola. Me llamo Íñigo Montoya. Tú mataste a mi padre. Prepárate a morir."
    }
};

let persona = new Persona("Antonio", 48);
console.log(persona.presentarse());
console.log(persona.presentarseDos());
*/










/**
 * Ejercicio 2: Clase Producto
 * Define una clase Producto que tenga las propiedades nombre y precio.
 * Añade un método detalles que devuelva:
 * "El producto [nombre] cuesta $[precio]."
 * Crea dos instancias de la clase y muestra sus detalles.
 */
/*
console.log(tituloEjercicio(2));
class Producto {
    constructor(nombre, precio){
        this.nombre = nombre;
        this.precio = precio;
    }

    // Método detalles
    detalles(){
        return(`El procto ${this.nombre} tiene un precio de ${this.precio}`);
    }

}

let p1 = new Producto("Teclado Logitech", "120,99€");
let p2 = new Producto("Webcam Cutrelux", "12,99€");

console.log(p1.detalles());
console.log(p2.detalles());
*/









/**
 * Ejercicio 3: Herencia de Animales
 * Crea una clase base Animal con un método hacerSonido que devuelva:
 * "El animal hace un sonido."
 * Luego, crea una clase Gato que herede de Animal y sobrescriba el método hacerSonido para devolver:
 * "El gato dice: Miau."
 * Ya puestos, crea una clase Perro que herece de Animal y sobreescriba el método hacerSonido para devovler
 * "El perro dice: Guau."
 * Crea una instancia de cada clase y llama al método hacerSonido.

 */
/*
console.log(tituloEjercicio(3));

class Animal {
    hacerSonido(){
        return("El animal hace un sonido.");
    }
}

class Gato extends Animal{
    hacerSonido(){
        return("El gato hace miau");
    }
}

class Perro extends Animal {
    hacerSonido(){
        return("El perro hace guau");
    }
}

let a1 = new Animal;
let g1 = new Gato;
let p1 = new Perro;

console.log(a1.hacerSonido());
console.log(g1.hacerSonido());
console.log(p1.hacerSonido());
*/










/**
 * Ejercicio 4: Clase Coche
 * Define una clase Coche con las propiedades marca, modelo y año.
 * Añade un método detalles que devuelva:
 * "Este coche es un [marca] [modelo] del año [año]."
 * Crea una instancia y muestra los detalles en la consola.
 */
/*
console.log(tituloEjercicio(4));
class Coche {
    constructor(marca, modelo, anio){
        this.marca = marca;
        this.modelo = modelo;
        this.anio = anio;
    }

    // Método para mostrar los detalles
    detalles(){
        return((`Este coche es un ${this.marca} ${this.modelo} del año ${this.anio}`));
    }
}

let c1 = new Coche("Seat", "600", "1970");
console.log(c1.detalles());
*/









/**
 * Ejercicio 5: Clase Libro
 * Crea una clase Libro con las propiedades titulo, autor y paginas.
 * Añade un método descripcion que devuelva:
 * "El libro '[titulo]' fue escrito por [autor] y tiene [paginas] páginas."
 * Crea una instancia y muestra la descripción.
 */
/*
console.log(tituloEjercicio(5));
class Libro {
    constructor(titulo, autor, paginas){
        this.titulo = titulo;
        this.autor = autor;
        this.paginas = paginas;
    }

    // Método descripción
    descripcion(){
        return(`El libro ${this.titulo} fue escrito por ${this.autor} y tiene ${this.paginas} páginas.`)
    }
}

let l1 = new Libro("HTML DIV-ertido", "Alguien", 680);

console.log(l1.descripcion());
*/









/**
 * Ejercicio 6: Clase Usuario
 * Crea una clase Usuario con las propiedades nombre y correo.
 * Añade un método mostrarDatos que devuelva:
 * "Usuario: [nombre], Correo: [correo]."
 * Crea una instancia y llama al método.
 */
/*
console.log(tituloEjercicio(6));
class Usuario{
    constructor(nombre, correo){
        this.nombre = nombre;
        this.correo = correo;
    }

    mostrarDatos(){
        return(`Usuario: ${this.nombre}, Correo ${this.correo}`);
    }
}

let u1 = new Usuario("Antonio", "antoniogs@gmail.com");
console.log(u1.mostrarDatos());
*/









/**
 * Ejercicio 7: Herencia de Vehículos
 * Crea una clase base Vehiculo con un método mover que devuelva:
 * "El vehículo se está moviendo."
 * Luego, crea una clase Bicicleta que herede de Vehiculo y sobrescriba el método mover para devolver:
 * "La bicicleta está avanzando con pedales."
 * Crea una instancia de cada clase y llama al método mover.
 */
/*
console.log(tituloEjercicio(7))
class Vehiculo {
    mover(){
        return("El vehículo está avanzando.");
    }
}

class Bicicleta extends Vehiculo{
    mover(){
        return("La bicicleta está avanzando con pedales")
    }
}

let v1 = new Vehiculo;
let b1 = new Bicicleta;

console.log(v1.mover());
console.log(b1.mover());
*/









/**
 * Ejercicio 8
 * Como se ha acabado la lista de ejercicios, me invento yo uno.
 * Con la clase Vehículo creada antes, extender y jugar con la herencia
 * y el poliformismo creando otras clases (deportivo, suv, furgoneta, etc)
 * 
 */

console.log(tituloEjercicio(8));
class Vehiculo {
    constructor(marca, modelo, anio, tipoMotor){
        this.marca = marca;
        this.modelo = modelo;
        this.anio = anio;
        this.consume = tipoMotor;
    }

    // Método para mostrar los detalles
    detalles(){
        return(`Este vehículo es un ${this.marca} ${this.modelo} del año ${this.anio} y tiene un motor ${this.tipoMotor}.`);
    }
}

class Deportivo extends Vehiculo {
    constructor(marca, modelo, anio, tipoMotor, caballos){
        super(marca, modelo, anio, tipoMotor);
        this.caballos = caballos;
    }
    detalles(){
        return(`Este deportivo es un ${this.marca} ${this.modelo} del año ${this.anio} y tiene un motor ${this.tipoMotor} de ${this.caballos}.`);
    }

}

class Furgoneta extends Vehiculo {
    constructor(marca, modelo, anio, tipoMotor, tara, pma){
        super(marca, modelo, anio, tipoMotor);
        this.tara = tara;
        this.pma = pma;
    }
    detalles(){
        return(`Esta furgoneta es una ${this.marca} ${this.modelo} del año ${this.anio}, tiene un motor ${this.tipoMotor}, una TARA de ${this.tara} y admite un máximo de carga de ${this.pma}.`)
    }
}


let c1 = new Vehiculo("Seat", "600", "1970","gasolina");
let d1 = new Deportivo("Maserati", "MC20", "2024", "gasolina", "630CV");
let f1 = new Furgoneta("Ford", "Transit", "1998", "diesel", "1366Kg", "2900Kg");

console.log(c1.detalles());
console.log(d1.detalles());
console.log(f1.detalles());