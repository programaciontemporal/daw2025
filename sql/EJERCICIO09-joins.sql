/**************************************************************************************************\
 Ejercicios SQL con Joins
 \*************************************************************************************************/

CREATE DATABASE ventas_db;
USE ventas_db;
-- (Para MySQL, en PostgreSQL usa `\c ventas_db`)

-- Tabla clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    email VARCHAR(50)
);

-- Tabla pedidos
CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    fecha DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Tabla productos
CREATE TABLE productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10, 2)
);

-- Tabla detalle_pedidos
CREATE TABLE detalle_pedidos (
    id INT PRIMARY KEY,
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Datos de ejemplo
INSERT INTO clientes (id, nombre, email)
VALUES
    (1, 'Ana López', 'ana@mail.com'),
    (2, 'Carlos Pérez', 'carlos@mail.com'),
    (3, 'Elena Ramírez', 'elena@mail.com');

INSERT INTO pedidos (id, cliente_id, fecha)
VALUES
    (1, 1, '2024-02-10'),
    (2, 2, '2024-02-11'),
    (3, 3, '2024-02-12');

INSERT INTO productos (id, nombre, precio)
VALUES
    (1, 'Laptop', 1000.00),
    (2, 'Teléfono', 500.00),
    (3, 'Teclado', 50.00);

INSERT INTO detalle_pedidos (id, pedido_id, producto_id, cantidad)
VALUES
    (1, 1, 1, 1),   -- Ana compra una Laptop
    (2, 1, 3, 2),   -- Ana compra 2 teclados
    (3, 2, 2, 1),   -- Carlos compra un teléfono
    (4, 3, 3, 1);   -- Elena compra un teclado


-- Ejercicios resueltos JOIN
-- 1. Obtener los nombres de los clientes y los productos que han comprado
SELECT clientes.nombre,
    productos.nombre AS producto
FROM clientes
    JOIN pedidos ON clientes.id = pedidos.cliente_id
    JOIN detalle_pedidos ON pedidos.id = detalle_pedidos.pedido_id
    JOIN productos ON detalle_pedidos.producto_id = productos.id;

-- 2. Mostrar todos los clientes y sus pedidos (incluso si no han hecho pedidos)
SELECT clientes.nombre,
    pedidos.id AS pedido_id,
    pedidos.fecha
FROM clientes
    LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id;

-- 3. Mostrar productos comprados y la cantidad vendida
SELECT productos.nombre,
    SUM(detalle_pedidos.cantidad) AS total_vendido
FROM productos
    JOIN detalle_pedidos ON productos.id = detalle_pedidos.producto_id
GROUP BY productos.nombre;

-- 4. Listar los clientes que NO han hecho pedidos
SELECT clientes.nombre
FROM clientes
    LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id
WHERE pedidos.id IS NULL;

-- 5. Mostrar los pedidos con su respectivo cliente
SELECT pedidos.id AS pedido_id,
    clientes.nombre
FROM pedidos
    JOIN clientes ON pedidos.cliente_id = clientes.id;

-- 6. Obtener la cantidad total de productos comprados por cliente
SELECT clientes.nombre,
    SUM(detalle_pedidos.cantidad) AS total_productos
FROM clientes
    JOIN pedidos ON clientes.id = pedidos.cliente_id
    JOIN detalle_pedidos ON pedidos.id = detalle_pedidos.pedido_id
GROUP BY clientes.nombre;

-- 7. Mostrar productos que no han sido comprados
SELECT productos.nombre
FROM productos
    LEFT JOIN detalle_pedidos ON productos.id = detalle_pedidos.producto_id
WHERE detalle_pedidos.id IS NULL;

--- 8. Mostrar el total gastado por cada cliente
SELECT clientes.nombre,
    SUM(productos.precio * detalle_pedidos.cantidad) AS total_gastado
FROM clientes
    JOIN pedidos ON clientes.id = pedidos.cliente_id
    JOIN detalle_pedidos ON pedidos.id = detalle_pedidos.pedido_id
    JOIN productos ON detalle_pedidos.producto_id = productos.id
GROUP BY clientes.nombre;

-- 9. Obtener los clientes con más de un pedido
SELECT clientes.nombre,
    COUNT(pedidos.id) AS total_pedidos
FROM clientes
    JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.nombre
HAVING COUNT(pedidos.id) > 1;

-- 10. Mostrar los productos más vendidos
SELECT productos.nombre,
    SUM(detalle_pedidos.cantidad) AS cantidad_vendida
FROM productos
    JOIN detalle_pedidos ON productos.id = detalle_pedidos.producto_id
GROUP BY productos.nombre
ORDER BY cantidad_vendida DESC;

-- 11. Obtener los pedidos realizados después del 2024-02-10
SELECT *
FROM pedidos
WHERE fecha > '2024-02-10';

-- 12. Mostrar clientes que han comprado laptops
SELECT DISTINCT clientes.nombre
FROM clientes
    JOIN pedidos ON clientes.id = pedidos.cliente_id
    JOIN detalle_pedidos ON pedidos.id = detalle_pedidos.pedido_id
    JOIN productos ON detalle_pedidos.producto_id = productos.id
WHERE productos.nombre = 'Laptop';







/*************************************************************************************************\
                                Base de Datos para Ejercicios
\*************************************************************************************************/

CREATE DATABASE biblioteca_db;
USE biblioteca_db;

-- Tabla usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    email VARCHAR(50)
);

-- Tabla libros
CREATE TABLE libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(50)
);

-- Tabla préstamos
CREATE TABLE prestamos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    libro_id INT,
    fecha_prestamo DATE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (libro_id) REFERENCES libros(id)
);


-- Insertar datos de prueba
INSERT INTO usuarios (nombre, email) VALUES
('Juan Pérez', 'juan.perez@example.com'),
('María García', 'maria.garcia@example.com'),
('Carlos López', 'carlos.lopez@example.com'),
('Ana Martínez', 'ana.martinez@example.com'),
('Luis Rodríguez', 'luis.rodriguez@example.com'),
('Sofía Hernández', 'sofia.hernandez@example.com'),
('Miguel González', 'miguel.gonzalez@example.com'),
('Elena Díaz', 'elena.diaz@example.com'),
('Jorge Sánchez', 'jorge.sanchez@example.com'),
('Lucía Ramírez', 'lucia.ramirez@example.com'),
('Diego Flores', 'diego.flores@example.com'),
('Paula Cruz', 'paula.cruz@example.com'),
('Alejandro Morales', 'alejandro.morales@example.com'),
('Carmen Ortega', 'carmen.ortega@example.com'),
('Francisco Ruiz', 'francisco.ruiz@example.com'),
('Isabel Vargas', 'isabel.vargas@example.com'),
('Antonio Jiménez', 'antonio.jimenez@example.com'),
('Marta Silva', 'marta.silva@example.com'),
('Roberto Medina', 'roberto.medina@example.com'),
('Patricia Rojas', 'patricia.rojas@example.com'),
('Laura Fernández', 'laura.fernandez@example.com'),
('Pedro Gómez', 'pedro.gomez@example.com'),
('Clara Ruiz', 'clara.ruiz@example.com'),
('Andrés Navarro', 'andres.navarro@example.com'),
('Sara Castro', 'sara.castro@example.com'),
('Javier Méndez', 'javier.mendez@example.com'),
('Eva Torres', 'eva.torres@example.com'),
('Daniel Molina', 'daniel.molina@example.com'),
('Natalia Gil', 'natalia.gil@example.com'),
('Héctor Serrano', 'hector.serrano@example.com');

INSERT INTO libros (titulo, autor) VALUES
('Cien años de soledad', 'Gabriel García Márquez'),
('1984', 'George Orwell'),
('El Principito', 'Antoine de Saint-Exupéry'),
('Don Quijote de la Mancha', 'Miguel de Cervantes'),
('Orgullo y prejuicio', 'Jane Austen'),
('Crimen y castigo', 'Fyodor Dostoevsky'),
('El señor de los anillos', 'J.R.R. Tolkien'),
('Harry Potter y la piedra filosofal', 'J.K. Rowling'),
('La sombra del viento', 'Carlos Ruiz Zafón'),
('Los juegos del hambre', 'Suzanne Collins'),
('El código Da Vinci', 'Dan Brown'),
('El alquimista', 'Paulo Coelho'),
('Rayuela', 'Julio Cortázar'),
('Fahrenheit 451', 'Ray Bradbury'),
('El retrato de Dorian Gray', 'Oscar Wilde'),
('La metamorfosis', 'Franz Kafka'),
('El gran Gatsby', 'F. Scott Fitzgerald'),
('Moby Dick', 'Herman Melville'),
('Drácula', 'Bram Stoker'),
('Las crónicas de Narnia', 'C.S. Lewis'),
('El amor en los tiempos del cólera', 'Gabriel García Márquez'),
('La casa de los espíritus', 'Isabel Allende'),
('Los pilares de la Tierra', 'Ken Follett'),
('El nombre del viento', 'Patrick Rothfuss'),
('El hobbit', 'J.R.R. Tolkien'),
('La ladrona de libros', 'Markus Zusak'),
('El perfume', 'Patrick Süskind'),
('El silmarillion', 'J.R.R. Tolkien'),
('La historia interminable', 'Michael Ende'),
('El guardián entre el centeno', 'J.D. Salinger'),
('Las ventajas de ser invisible', 'Stephen Chbosky'),
('El psicoanalista', 'John Katzenbach'),
('El túnel', 'Ernesto Sábato'),
('La ciudad y los perros', 'Mario Vargas Llosa'),
('Cien sonetos de amor', 'Pablo Neruda'),
('Rayuela', 'Julio Cortázar'),
('Ficciones', 'Jorge Luis Borges'),
('La insoportable levedad del ser', 'Milan Kundera'),
('El viejo y el mar', 'Ernest Hemingway'),
('Matar a un ruiseñor', 'Harper Lee');

INSERT INTO prestamos (usuario_id, libro_id, fecha_prestamo) VALUES
(1, 3, '2023-10-01'),
(2, 5, '2023-10-02'),
(3, 7, '2023-10-03'),
(4, 9, '2023-10-04'),
(5, 11, '2023-10-05'),
(6, 13, '2023-10-06'),
(7, 15, '2023-10-07'),
(8, 17, '2023-10-08'),
(9, 19, '2023-10-09'),
(10, 2, '2023-10-10'),
(11, 4, '2023-10-11'),
(12, 6, '2023-10-12'),
(13, 8, '2023-10-13'),
(14, 10, '2023-10-14'),
(15, 12, '2023-10-15'),
(16, 14, '2023-10-16'),
(17, 16, '2023-10-17'),
(18, 18, '2023-10-18'),
(19, 20, '2023-10-19'),
(20, 1, '2023-10-20'),
(1, 1, '2023-11-01'),
(1, 2, '2023-11-02'),
(1, 4, '2023-11-03'),
(1, 4, '2023-11-04'),
(1, 5, '2023-11-05'),
(1, 1, '2025-02-10'),
(1, 2, '2025-02-15'),
(1, 3, '2025-02-20'),
(2, 4, '2025-02-12'),
(2, 5, '2025-02-18'),
(2, 6, '2025-02-25'),
(3, 7, '2025-02-11'),
(3, 8, '2025-02-16'),
(3, 9, '2025-02-22'),
(4, 10, '2025-02-28');

/**************************************************************************************************\
                                    Ejercicios para Resolver
\**************************************************************************************************/
-- 01 Obtener los nombres de los usuarios y los libros que han prestado.
SELECT
    usuarios.nombre, 
    libros.titulo
FROM 
    prestamos
JOIN 
    usuarios ON prestamos.usuario_id = usuarios.id
JOIN 
    libros ON prestamos.libro_id = libros.id

-- 02 Mostrar todos los usuarios y sus préstamos (incluso si no han prestado libros).
SELECT 
    usuarios.nombre,
    prestamos.id,
    prestamos.libro_id,
    prestamos.fecha_prestamo
FROM 
    usuarios
LEFT JOIN 
    prestamos ON usuarios.id = prestamos.usuario_id;

-- 03 Mostrar cuántas veces ha sido prestado cada libro.
SELECT 
    libros.titulo,
    COUNT(prestamos.libro_id) AS veces_prestado
FROM 
    libros
LEFT JOIN 
    prestamos ON libros.id = prestamos.libro_id
GROUP BY 
    libros.titulo;

-- 04 Listar los usuarios que NO han prestado libros.
SELECT 
    usuarios.nombre
FROM 
    usuarios
LEFT JOIN 
    prestamos ON usuarios.id = prestamos.usuario_id
WHERE 
    prestamos.id IS NULL;

-- 05 Mostrar los préstamos con su respectivo usuario.
SELECT 
    prestamos.id AS prestamo_id,
    usuarios.nombre AS nombre_usuario,
    libros.titulo AS titulo_libro,
    prestamos.fecha_prestamo
FROM 
    prestamos
JOIN 
    usuarios ON prestamos.usuario_id = usuarios.id
JOIN 
    libros ON prestamos.libro_id = libros.id;

-- 06 Obtener la cantidad total de libros prestados por usuario.
SELECT 
    usuarios.nombre AS nombre_usuario,
    COUNT(prestamos.libro_id) AS total_libros_prestados
FROM 
    usuarios
LEFT JOIN 
    prestamos ON usuarios.id = prestamos.usuario_id
GROUP BY 
    usuarios.nombre;

-- 07 Mostrar libros que no han sido prestados.
SELECT 
    libros.titulo
FROM 
    libros
LEFT JOIN 
    prestamos ON libros.id = prestamos.libro_id
WHERE 
    prestamos.id IS NULL;

-- 08 Obtener la cantidad de libros prestados por autor.
SELECT 
    libros.autor,
    COUNT(prestamos.libro_id) AS cantidad_libros_prestados
FROM 
    libros
LEFT JOIN 
    prestamos ON libros.id = prestamos.libro_id
GROUP BY 
    libros.autor;

-- 09 Mostrar los usuarios que han prestado más de 3 libros.
SELECT 
    usuarios.nombre,
    COUNT(prestamos.libro_id) AS total_libros_prestados
FROM 
    usuarios
JOIN 
    prestamos ON usuarios.id = prestamos.usuario_id
GROUP BY 
    usuarios.nombre
HAVING 
    COUNT(prestamos.libro_id) > 3;

-- 10 Mostrar los libros más prestados.
SELECT 
    libros.titulo,
    COUNT(prestamos.libro_id) AS veces_prestado
FROM 
    libros
LEFT JOIN 
    prestamos ON libros.id = prestamos.libro_id
GROUP BY 
    libros.titulo
ORDER BY 
    veces_prestado DESC;

-- 11 Obtener los préstamos realizados en el último mes.
SELECT 
    prestamos.id AS prestamo_id,
    usuarios.nombre AS nombre_usuario,
    libros.titulo AS titulo_libro,
    prestamos.fecha_prestamo
FROM 
    prestamos
JOIN 
    usuarios ON prestamos.usuario_id = usuarios.id
JOIN 
    libros ON prestamos.libro_id = libros.id
WHERE 
    prestamos.fecha_prestamo >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
ORDER BY 
    prestamos.fecha_prestamo DESC;

-- 12 Mostrar los usuarios que han prestado libros de un autor específico.
SELECT DISTINCT
    usuarios.nombre AS nombre_usuario,
    libros.autor AS autor_libro
FROM 
    prestamos
JOIN 
    usuarios ON prestamos.usuario_id = usuarios.id
JOIN 
    libros ON prestamos.libro_id = libros.id
WHERE 
    libros.autor = 'Gabriel García Márquez';  -- Cambia el autor según necesites
