/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Gestión de Biblioteca
    Una biblioteca necesita llevar el control de los libros y los usuarios que los toman prestados.
    De un libro se necesita conocer el título, autor y año de publicación.
    De un usuario se requiere nombre, email y teléfono.
    *   Genera la base de datos completa e introducir algunos datos.
    *   Consulta: Obtener todos los libros publicados después del año 2000.

*/

CREATE DATABASE biblioteca;
USE biblioteca;

-- Tablas
-- Tabla de usuarios
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

-- Tabla de libros
CREATE TABLE libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    ano_publicacion INT NOT NULL
);

-- Tabla de prestamos
-- Relaciona a los usuarios con los libros que toman prestados
CREATE TABLE prestamos (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_libro INT,
    fecha_prestamo DATE DEFAULT (CURRENT_DATE),
    fecha_devolucion DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

-- Datos de ejemplo
-- Insertar datos en la tabla de usuarios
INSERT INTO usuarios (nombre, email, telefono) VALUES
('Juan Pérez', 'juan.perez@example.com', '123456789'),
('María Gómez', 'maria.gomez@example.com', '987654321'),
('Carlos Ruiz', 'carlos.ruiz@example.com', '456789123'),
('Ana López', 'ana.lopez@example.com', '321654987'),
('Pedro Sánchez', 'pedro.sanchez@example.com', '654987321'),
('Laura Martínez', 'laura.martinez@example.com', '741258963'),
('Miguel Torres', 'miguel.torres@example.com', '159753456'),
('Sofía Ramírez', 'sofia.ramirez@example.com', '753159874'),
('Jorge Díaz', 'jorge.diaz@example.com', '963258741'),
('Lucía Hernández', 'lucia.hernandez@example.com', '852369741');

-- Insertar datos en la tabla de libros
INSERT INTO libros (titulo, autor, ano_publicacion) VALUES
('La sombra del viento', 'Carlos Ruiz Zafón', 2001),
('Cien años de soledad', 'Gabriel García Márquez', 1967),
('El código Da Vinci', 'Dan Brown', 2003),
('El Alquimista', 'Paulo Coelho', 1988),
('La Casa de los Espíritus', 'Isabel Allende', 1982),
('Harry Potter y la piedra filosofal', 'J.K. Rowling', 1997),
('1984', 'George Orwell', 1949),
('Fahrenheit 451', 'Ray Bradbury', 1953),
('Matar a un ruiseñor', 'Harper Lee', 1960),
('Don Quijote de la Mancha', 'Miguel de Cervantes', 1605);

-- Insertar datos en la tabla de prestamos
INSERT INTO prestamos (id_usuario, id_libro, fecha_prestamo) VALUES
(1, 1, '2023-10-01'),
(2, 3, '2023-10-02'),
(3, 5, '2023-10-03'),
(4, 7, '2023-10-04'),
(5, 9, '2023-10-05'),
(6, 10, '2023-10-06'),
(7, 2, '2023-10-07'),
(8, 6, '2023-10-08'),
(9, 8, '2023-10-09'),
(10, 4, '2023-10-10');


-- Consulta de ejemplo
SELECT * 
FROM libros 
WHERE ano_publicacion > 2000;





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Tienda de Mascotas
    Una tienda vende diferentes tipos de mascotas y necesita registrar sus ventas. 
    De cada mascota se almacena el tipo, raza y precio. De un cliente, se guarda su nombre, email y teléfono.
    *   Genera la base de datos completa e introducir algunos datos.
    *   Consulta: Listar todas las mascotas cuyo precio sea mayor a 100 dólares.

*/

CREATE DATABASE tienda_mascotas;
USE tienda_mascotas;

-- Tablas
-- Tabla de mascotas
CREATE TABLE mascotas (
    id_mascota INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,        -- Tipo de mascota (perro, gato, etc.)
    raza VARCHAR(50) NOT NULL,        -- Raza de la mascota
    precio DECIMAL(10, 2) NOT NULL    -- Precio de la mascota
);

-- Tabla de clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(15)
);

-- Tabla de ventas
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_mascota INT,
    fecha_venta DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_mascota) REFERENCES mascotas(id_mascota)
);


-- Datos de ejemplo
-- Insertar mascotas
INSERT INTO mascotas (tipo, raza, precio) VALUES
('Perro', 'Labrador', 250.00),
('Gato', 'Siames', 150.00),
('Pájaro', 'Canario', 50.00),
('Perro', 'Bulldog', 120.00),
('Conejo', 'Enano', 45.00),
('Hamster', 'Ruso', 25.00),
('Perro', 'Golden Retriever', 300.00),
('Gato', 'Persa', 180.00),
('Tortuga', 'Aldabra', 75.00),
('Perro', 'Beagle', 200.00);

-- Insertar clientes
INSERT INTO clientes (nombre, email, telefono) VALUES
('Juan Pérez', 'juan.perez@example.com', '123456789'),
('María Gómez', 'maria.gomez@example.com', '987654321'),
('Carlos Ruiz', 'carlos.ruiz@example.com', '555555555'),
('Laura Martínez', 'laura.martinez@example.com', '777777777'),
('Ana López', 'ana.lopez@example.com', '333333333');

-- Insertar ventas
INSERT INTO ventas (id_cliente, id_mascota, fecha_venta) VALUES
(1, 1, '2025-01-15'),
(2, 2, '2025-02-10'),
(3, 4, '2025-02-20'),
(4, 7, '2025-02-25'),
(5, 8, '2025-03-01');


-- Consulta de prueba
SELECT tipo, raza, precio
FROM mascotas
WHERE precio > 100;





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Sistema de Reservas de Hotel
    Un hotel gestiona reservas de habitaciones. Cada habitación tiene un número,
    tipo y precio por noche. De cada reserva, se almacena la fecha y el cliente que la hizo.
    *   Genera la base de datos completa e introducir algunos datos.
    *   Consulta: Mostrar todas las habitaciones con un precio menor a 50 dólares por noche.
*/

CREATE DATABASE hotel_reservas;
USE hotel_reservas;


-- Tablas
-- Tabla de habitaciones
CREATE TABLE habitaciones (
    id_habitacion INT AUTO_INCREMENT PRIMARY KEY,
    numero INT NOT NULL,             -- Número de la habitación
    tipo VARCHAR(50) NOT NULL,       -- Tipo de habitación (individual, doble, suite, etc.)
    precio_noche DECIMAL(10, 2) NOT NULL  -- Precio por noche de la habitación
);

-- Tabla de clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(15)
);

-- Tabla de reservas
CREATE TABLE reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_habitacion INT,
    fecha_reserva DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_habitacion) REFERENCES habitaciones(id_habitacion)
);


-- Datos de ejemplo
-- Insertar habitaciones
INSERT INTO habitaciones (numero, tipo, precio_noche) VALUES
(101, 'Individual', 40.00),
(102, 'Doble', 60.00),
(103, 'Suite', 120.00),
(104, 'Individual', 45.00),
(105, 'Doble', 75.00),
(106, 'Suite', 150.00),
(107, 'Individual', 30.00),
(108, 'Doble', 55.00),
(109, 'Suite', 200.00),
(110, 'Individual', 50.00);

-- Insertar clientes
INSERT INTO clientes (nombre, email, telefono) VALUES
('Pedro Pérez', 'pedro.perez@example.com', '123456789'),
('María García', 'maria.garcia@example.com', '987654321'),
('Juan López', 'juan.lopez@example.com', '555555555'),
('Ana Martínez', 'ana.martinez@example.com', '777777777'),
('Luis Rodríguez', 'luis.rodriguez@example.com', '333333333');

-- Insertar reservas
INSERT INTO reservas (id_cliente, id_habitacion, fecha_reserva) VALUES
(1, 1, '2025-03-15'),
(2, 4, '2025-03-20'),
(3, 7, '2025-03-25'),
(4, 10, '2025-03-30'),
(5, 2, '2025-04-01');


-- Consulta de prueba
SELECT numero, tipo, precio_noche
FROM habitaciones
WHERE precio_noche < 50;





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Clínica Veterinaria
    Una clínica necesita registrar a las mascotas atendidas. Se almacena su nombre, especie y edad.
    También se guardan los datos de los dueños.
    *   Genera la base de datos completa e introducir algunos datos.
    *   Consulta: Contar cuántas mascotas atendidas tienen más de 5 años.
*/

CREATE DATABASE clinica_veterinaria;
USE clinica_veterinaria;


-- Tablas
-- Tabla de dueños de mascotas
CREATE TABLE duenos (
    id_dueno INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(15)
);

-- Tabla de mascotas
CREATE TABLE mascotas (
    id_mascota INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    edad INT NOT NULL,
    id_dueno INT,
    FOREIGN KEY (id_dueno) REFERENCES duenos(id_dueno)
);

-- Tabla de atenciones (si se quiere registrar información de las consultas)
CREATE TABLE atenciones (
    id_atencion INT AUTO_INCREMENT PRIMARY KEY,
    id_mascota INT,
    fecha DATE DEFAULT CURRENT_DATE,
    descripcion TEXT,
    FOREIGN KEY (id_mascota) REFERENCES mascotas(id_mascota)
);


-- Datos de ejemplo
-- Insertar dueños
INSERT INTO duenos (nombre, email, telefono) VALUES
('Laura Pérez', 'laura.perez@example.com', '123456789'),
('Carlos García', 'carlos.garcia@example.com', '987654321'),
('Ana López', 'ana.lopez@example.com', '555555555'),
('Pedro Martínez', 'pedro.martinez@example.com', '777777777'),
('Maria Rodríguez', 'maria.rodriguez@example.com', '333333333');

-- Insertar mascotas
INSERT INTO mascotas (nombre, especie, edad, id_dueno) VALUES
('Bobby', 'Perro', 3, 1),
('Milo', 'Gato', 6, 2),
('Luna', 'Conejo', 2, 3),
('Rex', 'Perro', 7, 4),
('Bella', 'Gato', 8, 5),
('Chester', 'Perro', 9, 1),
('Coco', 'Gato', 4, 2),
('Max', 'Perro', 10, 3),
('Rocky', 'Conejo', 1, 4),
('Simba', 'Perro', 12, 5);

-- Insertar atenciones
INSERT INTO atenciones (id_mascota, fecha, descripcion) VALUES
(1, '2025-02-01', 'Consulta general'),
(2, '2025-02-10', 'Vacunación de rutina'),
(3, '2025-02-15', 'Revisión de dientes'),
(4, '2025-02-20', 'Chequeo de salud'),
(5, '2025-02-25', 'Atención por alergia'),
(6, '2025-03-01', 'Revisión de peso y dieta'),
(7, '2025-03-05', 'Vacuna contra la rabia'),
(8, '2025-03-10', 'Desparacitación'),
(9, '2025-03-15', 'Examen de sangre'),
(10, '2025-03-20', 'Chequeo general');


-- Consulta de prueba
SELECT COUNT(*) AS "Mascotas mayores a 5 años"
FROM mascotas
WHERE edad > 5;





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Venta de Autos Usados
    Un concesionario de autos usados quiere gestionar su inventario.
    Se guardan datos como la marca, modelo y año del auto.
    También se registran las ventas realizadas a clientes.
    *   Genera la base de datos completa e introducir algunos datos.
    *   Consulta: Obtener la lista de autos del año 2020 en adelante.
*/

CREATE DATABASE concesionario_autos;
USE concesionario_autos;

-- Tabla de clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(15)
);


-- Tablas
-- Tabla de autos
CREATE TABLE autos (
    id_auto INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(100) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    anio INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

-- Tabla de ventas
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_auto INT,
    id_cliente INT,
    fecha_venta DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_auto) REFERENCES autos(id_auto),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


-- Datos de ejemplo
-- Insertar algunos clientes
INSERT INTO clientes (nombre, email, telefono) VALUES
('Juan Pérez', 'juan.perez@email.com', '123456789'),
('María Gómez', 'maria.gomez@email.com', '987654321'),
('Carlos Rodríguez', 'carlos.rodriguez@email.com', '456789123');

-- Insertar algunos autos
INSERT INTO autos (marca, modelo, anio, precio) VALUES
('Toyota', 'Corolla', 2018, 15000.00),
('Honda', 'Civic', 2020, 22000.00),
('Ford', 'Focus', 2021, 25000.00),
('Chevrolet', 'Spark', 2019, 13000.00),
('Nissan', 'Altima', 2020, 24000.00);

-- Insertar algunas ventas
INSERT INTO ventas (id_auto, id_cliente) VALUES
(1, 1),
(2, 2),
(3, 3);


-- Consulta de prueba
SELECT * FROM autos
WHERE anio >= 2020;





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Aplicación de Comida a Domicilio
    Una app de pedidos almacena los restaurantes y los clientes que hacen órdenes. 
    Se necesita registrar el nombre del restaurante, tipo de comida y ubicación.
    *   Genera la base de datos completa e introducir algunos datos.
    *   Consulta: Mostrar todos los restaurantes que ofrecen comida italiana
*/

CREATE DATABASE app_comida_domicilio;
USE app_comida_domicilio;

-- Tablas
-- Tabla de restaurantes
CREATE TABLE restaurantes (
    id_restaurante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    tipo_comida VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(255) NOT NULL
);

-- Tabla de clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(15)
);

-- Tabla de órdenes
CREATE TABLE ordenes (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    id_restaurante INT,
    id_cliente INT,
    fecha_orden DATE DEFAULT CURRENT_DATE,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_restaurante) REFERENCES restaurantes(id_restaurante),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


-- Datos de ejemplo
-- Insertar algunos restaurantes
INSERT INTO restaurantes (nombre, tipo_comida, ubicacion) VALUES
('La Trattoria', 'Italiana', 'Calle Principal 123'),
('Sushi Time', 'Japonesa', 'Avenida 7 456'),
('El Mexicano', 'Mexicana', 'Calle 5 789'),
('Pasta & Pizza', 'Italiana', 'Calle 3 101'),
('Tacos El Güero', 'Mexicana', 'Calle 4 202');

-- Insertar algunos clientes
INSERT INTO clientes (nombre, email, telefono) VALUES
('Ana López', 'ana.lopez@email.com', '123456789'),
('Luis Martínez', 'luis.martinez@email.com', '987654321'),
('Elena Pérez', 'elena.perez@email.com', '456789123'),
('Carlos Gómez', 'carlos.gomez@email.com', '654321987'),
('Sandra Díaz', 'sandra.diaz@email.com', '789123456');

-- Insertar algunas órdenes
INSERT INTO ordenes (id_restaurante, id_cliente, total) VALUES
(1, 1, 25.50),
(2, 2, 18.00),
(3, 3, 12.30),
(1, 4, 30.00),
(4, 5, 28.70);


-- Consulta de prueba
SELECT * FROM restaurantes
WHERE tipo_comida = 'Italiana';





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Gimnasio y Membresías
    Un gimnasio gestiona sus clientes y membresías.
    Cada cliente tiene un nombre, edad y tipo de membresía contratada.
    *   Genera la base de datos completa e introducir algunos datos.
    *   Consulta: Obtener los nombres de los clientes con membresía "Premium".
*/

CREATE DATABASE gimnasio;
USE gimnasio;


-- Tablas
-- Tabla de membresías
CREATE TABLE membresias (
    id_membresia INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);

-- Tabla de clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    edad INT NOT NULL,
    id_membresia INT,
    FOREIGN KEY (id_membresia) REFERENCES membresias(id_membresia)
);


-- Datos de ejemplo
-- Insertar tipos de membresía
INSERT INTO membresias (tipo) VALUES
('Básica'),
('Premium'),
('VIP'),
('Silver');

-- Insertar algunos clientes
INSERT INTO clientes (nombre, edad, id_membresia) VALUES
('Juan Pérez', 30, 2),  -- Premium
('Ana Gómez', 25, 1),   -- Básica
('Luis Martínez', 35, 3),  -- VIP
('Carlos Fernández', 28, 4),  -- Silver
('Elena Sánchez', 40, 2);  -- Premium


-- Consulta de prueba
SELECT nombre FROM clientes
JOIN membresias ON clientes.id_membresia = membresias.id_membresia
WHERE membresias.tipo = 'Premium';





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Plataforma de Streaming de Películas
    Un servicio de streaming almacena las películas disponibles y los usuarios registrados.
    Se guardan datos como título, año y género de cada película.
    *   Genera la base de datos completa e introducir algunos datos.
    *   Consulta: Listar todas las películas de género "Ciencia Ficción".
*/

CREATE DATABASE streaming;
USE streaming;


-- Tablas
-- Tabla de películas
CREATE TABLE peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    anio INT NOT NULL,
    genero VARCHAR(100) NOT NULL
);

-- Tabla de usuarios
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Tabla de visualizaciones (relación entre usuarios y películas)
CREATE TABLE visualizaciones (
    id_visualizacion INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_pelicula INT,
    fecha_visualizacion DATE NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula)
);


-- Datos de ejemplo
-- Insertar películas
INSERT INTO peliculas (titulo, anio, genero) VALUES
('Interstellar', 2014, 'Ciencia Ficción'),
('The Matrix', 1999, 'Ciencia Ficción'),
('El Señor de los Anillos: La Comunidad del Anillo', 2001, 'Fantasía'),
('Avatar', 2009, 'Ciencia Ficción'),
('Jurassic Park', 1993, 'Aventura');

-- Insertar usuarios
INSERT INTO usuarios (nombre, email) VALUES
('Juan Pérez', 'juan@example.com'),
('Ana Gómez', 'ana@example.com'),
('Luis Martínez', 'luis@example.com');

-- Insertar visualizaciones
INSERT INTO visualizaciones (id_usuario, id_pelicula, fecha_visualizacion) VALUES
(1, 1, '2025-02-20'),
(2, 2, '2025-02-19'),
(3, 1, '2025-02-18'),
(1, 4, '2025-02-17');


--  Consulta de prueba
SELECT titulo, anio FROM peliculas
WHERE genero = 'Ciencia Ficción';





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Farmacia y Medicamentos
    Una farmacia necesita registrar sus medicamentos en stock.
    De cada medicamento se guarda el nombre, laboratorio y fecha de vencimiento.
    *   Genera la base de datos completa e introducir algunos datos.
    *   Consulta: Obtener los medicamentos que vencen en los próximos 30 días.
*/

CREATE DATABASE farmacia;
USE farmacia;

-- Tabla
-- Tabla de medicamentos
CREATE TABLE medicamentos (
    id_medicamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    laboratorio VARCHAR(255) NOT NULL,
    fecha_vencimiento DATE NOT NULL
);


-- Datos
-- Insertar medicamentos
INSERT INTO medicamentos (nombre, laboratorio, fecha_vencimiento) VALUES
('Aspirina', 'Laboratorio A', '2025-03-15'),
('Paracetamol', 'Laboratorio B', '2025-03-10'),
('Ibuprofeno', 'Laboratorio C', '2025-03-20'),
('Amoxicilina', 'Laboratorio A', '2025-02-28'),
('Clorfenamina', 'Laboratorio D', '2025-04-05');


-- Consulta de prueba
SELECT nombre, laboratorio, fecha_vencimiento
FROM medicamentos
WHERE fecha_vencimiento BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Tienda de Ropa Online
    Una tienda en línea vende ropa y necesita almacenar los productos disponibles.
    Se guarda la categoría, talla y precio de cada prenda.
    *   Genera la base de datos completa e introducir algunos datos.
    *   Consulta: Mostrar todas las prendas de la categoría "Zapatos" que tengan un precio menor a 50 dólares.
*/

CREATE DATABASE tienda_ropa;
USE tienda_ropa;

-- Tabla de productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    categoria VARCHAR(255) NOT NULL,
    talla VARCHAR(10) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);


-- Insertar productos
INSERT INTO productos (nombre, categoria, talla, precio) VALUES
('Camiseta de algodón', 'Ropa', 'M', 19.99),
('Pantalón vaquero', 'Ropa', 'L', 39.99),
('Zapatos deportivos', 'Zapatos', '42', 45.00),
('Zapatos de cuero', 'Zapatos', '40', 120.00),
('Chaqueta de invierno', 'Ropa', 'S', 59.99),
('Sandalias', 'Zapatos', '38', 30.00),
('Vestido largo', 'Ropa', 'M', 70.00),
('Botas de montaña', 'Zapatos', '44', 80.00),
('Blusa de seda', 'Ropa', 'S', 35.00),
('Zapatillas de correr', 'Zapatos', '41', 50.00);


SELECT nombre, categoria, talla, precio
FROM productos
WHERE categoria = 'Zapatos' AND precio < 50;
