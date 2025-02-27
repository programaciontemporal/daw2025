/******************************************************************************\
                            JOINS empresa de Eventos
\******************************************************************************/

CREATE DATABASE eventos_db;
USE eventos_db;;

-- Tablas
CREATE TABLE Organizadores (
    id_organizador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(15)
);

CREATE TABLE Eventos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    nombre_evento VARCHAR(200) NOT NULL,
    fecha DATE NOT NULL,
    lugar VARCHAR(200) NOT NULL,
    id_organizador INT,
    FOREIGN KEY (id_organizador) REFERENCES Organizadores(id_organizador)
);

CREATE TABLE Asistentes (
    id_asistente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(15)
);

CREATE TABLE Registros (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT,
    id_asistente INT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_evento) REFERENCES Eventos(id_evento),
    FOREIGN KEY (id_asistente) REFERENCES Asistentes(id_asistente)
);

-- Datos de ejemplo
INSERT INTO Organizadores (nombre, email, telefono) VALUES
('Carlos Martínez', 'carlos.martinez@example.com', '555-1001'),
('Laura Gómez', 'laura.gomez@example.com', '555-1002'),
('Pedro Sánchez', 'pedro.sanchez@example.com', '555-1003'),
('Ana López', 'ana.lopez@example.com', '555-1004'),
('Miguel Torres', 'miguel.torres@example.com', '555-1005'),
('Sofía Ramírez', 'sofia.ramirez@example.com', '555-1006'),
('Jorge Díaz', 'jorge.diaz@example.com', '555-1007'),
('Elena Ruiz', 'elena.ruiz@example.com', '555-1008'),
('Fernando Herrera', 'fernando.herrera@example.com', '555-1009'),
('Lucía Castro', 'lucia.castro@example.com', '555-1010'),
('Diego Morales', 'diego.morales@example.com', '555-1011'),
('Carmen Ortega', 'carmen.ortega@example.com', '555-1012'),
('Raúl Navarro', 'raul.navarro@example.com', '555-1013'),
('Patricia Jiménez', 'patricia.jimenez@example.com', '555-1014'),
('Alberto Vargas', 'alberto.vargas@example.com', '555-1015'),
('Mónica Rojas', 'monica.rojas@example.com', '555-1016'),
('Roberto Medina', 'roberto.medina@example.com', '555-1017'),
('Silvia Guerrero', 'silvia.guerrero@example.com', '555-1018'),
('Héctor Paredes', 'hector.paredes@example.com', '555-1019'),
('Natalia Flores', 'natalia.flores@example.com', '555-1020');

INSERT INTO Eventos (nombre_evento, fecha, lugar, id_organizador) VALUES
('Conferencia de Tecnología 2025', '2025-01-10', 'Centro de Convenciones Ciudad A', 1),
('Feria de Emprendimiento', '2025-01-15', 'Palacio de Congresos Ciudad B', 2),
('Exposición de Arte Moderno', '2025-01-20', 'Museo de Arte Ciudad C', 3),
('Seminario de Marketing Digital', '2025-01-25', 'Hotel Plaza Ciudad D', 4),
('Taller de Desarrollo Personal', '2025-02-01', 'Centro Cultural Ciudad E', 5),
('Concierto de Música Clásica', '2025-02-05', 'Teatro Municipal Ciudad F', 6),
('Congreso de Medicina', '2025-02-10', 'Centro Médico Ciudad G', 7),
('Feria de Ciencias', '2025-02-15', 'Parque de Exposiciones Ciudad H', 8),
('Charla de Innovación', '2025-02-20', 'Auditorio Ciudad I', 9),
('Exposición de Fotografía', '2025-02-25', 'Galería de Arte Ciudad J', 10),
('Conferencia de Inteligencia Artificial', '2025-01-12', 'Centro de Convenciones Ciudad K', 11),
('Feria de Tecnología', '2025-01-18', 'Palacio de Congresos Ciudad L', 12),
('Seminario de Finanzas', '2025-01-22', 'Hotel Plaza Ciudad M', 13),
('Taller de Robótica', '2025-01-28', 'Centro Cultural Ciudad N', 14),
('Concierto de Jazz', '2025-02-03', 'Teatro Municipal Ciudad O', 15),
('Congreso de Educación', '2025-02-08', 'Centro Educativo Ciudad P', 16),
('Feria de Libros', '2025-02-13', 'Parque de Exposiciones Ciudad Q', 17),
('Charla de Sostenibilidad', '2025-02-18', 'Auditorio Ciudad R', 18),
('Exposición de Escultura', '2025-02-22', 'Galería de Arte Ciudad S', 19),
('Conferencia de Blockchain', '2025-02-27', 'Centro de Convenciones Ciudad T', 20);

INSERT INTO Asistentes (nombre, email, telefono) VALUES
('Juan Pérez', 'juan.perez@example.com', '555-2001'),
('María González', 'maria.gonzalez@example.com', '555-2002'),
('Luis Fernández', 'luis.fernandez@example.com', '555-2003'),
('Ana Martínez', 'ana.martinez@example.com', '555-2004'),
('Carlos Gómez', 'carlos.gomez@example.com', '555-2005'),
('Laura Sánchez', 'laura.sanchez@example.com', '555-2006'),
('Pedro López', 'pedro.lopez@example.com', '555-2007'),
('Sofía Torres', 'sofia.torres@example.com', '555-2008'),
('Jorge Ramírez', 'jorge.ramirez@example.com', '555-2009'),
('Elena Díaz', 'elena.diaz@example.com', '555-2010'),
('Miguel Ruiz', 'miguel.ruiz@example.com', '555-2011'),
('Carmen Herrera', 'carmen.herrera@example.com', '555-2012'),
('Raúl Castro', 'raul.castro@example.com', '555-2013'),
('Patricia Morales', 'patricia.morales@example.com', '555-2014'),
('Alberto Ortega', 'alberto.ortega@example.com', '555-2015'),
('Mónica Navarro', 'monica.navarro@example.com', '555-2016'),
('Roberto Jiménez', 'roberto.jimenez@example.com', '555-2017'),
('Silvia Vargas', 'silvia.vargas@example.com', '555-2018'),
('Héctor Rojas', 'hector.rojas@example.com', '555-2019'),
('Natalia Medina', 'natalia.medina@example.com', '555-2020');

INSERT INTO Registros (id_evento, id_asistente, fecha_registro) VALUES
(1, 1, '2025-01-01 10:00:00'),
(1, 2, '2025-01-02 11:30:00'),
(2, 3, '2025-01-03 09:15:00'),
(2, 4, '2025-01-04 14:20:00'),
(3, 5, '2025-01-05 16:45:00'),
(4, 6, '2025-01-06 12:00:00'),
(5, 7, '2025-01-07 08:30:00'),
(6, 8, '2025-01-08 17:10:00'),
(7, 9, '2025-01-09 13:50:00'),
(8, 10, '2025-01-10 10:45:00');

-- Consultas
-- Listar todos los eventos con sus organizadores
SELECT e.nombre_evento, e.fecha, e.lugar, o.nombre AS organizador
FROM Eventos e
INNER JOIN Organizadores o ON e.id_organizador = o.id_organizador;

-- Listar todos los asistentes de un evento específico
SELECT a.nombre, a.email
FROM Asistentes a
INNER JOIN Registros r ON a.id_asistente = r.id_asistente
WHERE r.id_evento = 1;

-- Listar todos los eventos a los que asistió una persona específica
SELECT e.nombre_evento, e.fecha, e.lugar
FROM Eventos e
INNER JOIN Registros r ON e.id_evento = r.id_evento
WHERE r.id_asistente = 1;

-- Contar el número de asistentes por evento:
SELECT e.nombre_evento, COUNT(r.id_asistente) AS num_asistentes
FROM Eventos e
LEFT JOIN Registros r ON e.id_evento = r.id_evento
GROUP BY e.id_evento;

-- Listar todos los asistentes registrados en un evento específico
SELECT a.nombre, a.email, r.fecha_registro
FROM Asistentes a
INNER JOIN Registros r ON a.id_asistente = r.id_asistente
WHERE r.id_evento = 1;










/******************************************************************************\
                           JOINS Streaming Música
\******************************************************************************/
CREATE DATABASE streaming_db;
USE streaming_db;

-- Tablas
CREATE TABLE Artistas (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    genero_musical VARCHAR(50),
    pais_origen VARCHAR(50)
);

CREATE TABLE Albumes (
    id_album INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    fecha_lanzamiento DATE,
    id_artista INT,
    FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista)
);

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    fecha_registro DATE
);

CREATE TABLE Biblioteca_Usuario (
    id_biblioteca INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_album INT,
    fecha_agregado TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_album) REFERENCES Albumes(id_album)
);

-- Datos de ejemplo
INSERT INTO Artistas (nombre, genero_musical, pais_origen) VALUES
('Bad Bunny', 'Reggaetón', 'Puerto Rico'),
('Taylor Swift', 'Pop', 'Estados Unidos'),
('Beyoncé', 'R&B', 'Estados Unidos'),
('Shakira', 'Pop', 'Colombia'),
('Drake', 'Hip-Hop', 'Canadá'),
('Rosalía', 'Flamenco', 'España'),
('Ed Sheeran', 'Pop', 'Reino Unido'),
('Adele', 'Pop', 'Reino Unido'),
('Kendrick Lamar', 'Hip-Hop', 'Estados Unidos'),
('Rihanna', 'R&B', 'Barbados'),
('The Weeknd', 'R&B', 'Canadá'),
('Coldplay', 'Rock', 'Reino Unido'),
('Dua Lipa', 'Pop', 'Reino Unido'),
('J Balvin', 'Reggaetón', 'Colombia'),
('Karol G', 'Reggaetón', 'Colombia'),
('Travis Scott', 'Hip-Hop', 'Estados Unidos'),
('Billie Eilish', 'Pop', 'Estados Unidos'),
('Post Malone', 'Hip-Hop', 'Estados Unidos'),
('Ariana Grande', 'Pop', 'Estados Unidos'),
('Bruno Mars', 'Pop', 'Estados Unidos');

INSERT INTO Albumes (titulo, fecha_lanzamiento, id_artista) VALUES
('Un Verano Sin Ti', '2022-05-06', 1),
('Midnights', '2022-10-21', 2),
('Renaissance', '2022-07-29', 3),
('She Wolf', '2009-10-09', 4),
('Certified Lover Boy', '2021-09-03', 5),
('El Mal Querer', '2018-11-02', 6),
('÷ (Divide)', '2017-03-03', 7),
('30', '2021-11-19', 8),
('DAMN.', '2017-04-14', 9),
('Anti', '2016-01-28', 10),
('After Hours', '2020-03-20', 11),
('Music of the Spheres', '2021-10-15', 12),
('Future Nostalgia', '2020-03-27', 13),
('Colores', '2020-03-20', 14),
('KG0516', '2021-03-25', 15),
('Astroworld', '2018-08-03', 16),
('Happier Than Ever', '2021-07-30', 17),
("Hollywood's Bleeding", '2019-09-06', 18),
('Positions', '2020-10-30', 19),
('24K Magic', '2016-11-18', 20);

INSERT INTO Usuarios (nombre, email) VALUES
('Juan Pérez', 'juan.perez@example.com'),
('María González', 'maria.gonzalez@example.com'),
('Carlos López', 'carlos.lopez@example.com'),
('Ana Martínez', 'ana.martinez@example.com'),
('Luis Fernández', 'luis.fernandez@example.com'),
('Sofía Ramírez', 'sofia.ramirez@example.com'),
('Pedro Sánchez', 'pedro.sanchez@example.com'),
('Lucía Torres', 'lucia.torres@example.com'),
('Miguel Díaz', 'miguel.diaz@example.com'),
('Elena Ruiz', 'elena.ruiz@example.com'),
('Jorge Morales', 'jorge.morales@example.com'),
('Carmen Ortega', 'carmen.ortega@example.com'),
('Raúl Navarro', 'raul.navarro@example.com'),
('Patricia Jiménez', 'patricia.jimenez@example.com'),
('Alberto Vargas', 'alberto.vargas@example.com'),
('Mónica Rojas', 'monica.rojas@example.com'),
('Roberto Medina', 'roberto.medina@example.com'),
('Silvia Guerrero', 'silvia.guerrero@example.com'),
('Héctor Paredes', 'hector.paredes@example.com'),
('Natalia Flores', 'natalia.flores@example.com');

INSERT INTO Biblioteca_Usuario (id_usuario, id_album) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10);

-- Consultas varias
-- Listar todos los álbumes de un artista específico
SELECT a.titulo, a.fecha_lanzamiento
FROM Albumes a
INNER JOIN Artistas ar ON a.id_artista = ar.id_artista
WHERE ar.nombre = 'Bad Bunny';

-- Listar todos los álbumes en la biblioteca de un usuario específico
SELECT al.titulo, ar.nombre AS artista
FROM Biblioteca_Usuario bu
INNER JOIN Albumes al ON bu.id_album = al.id_album
INNER JOIN Artistas ar ON al.id_artista = ar.id_artista
WHERE bu.id_usuario = 1;

-- Contar cuántos álbumes tiene cada usuario en su biblioteca
SELECT u.nombre, COUNT(bu.id_album) AS total_albumes
FROM Usuarios u
LEFT JOIN Biblioteca_Usuario bu ON u.id_usuario = bu.id_usuario
GROUP BY u.id_usuario;

-- Listar todos los usuarios que tienen un álbum específico en su biblioteca
SELECT u.nombre, u.email
FROM Usuarios u
INNER JOIN Biblioteca_Usuario bu ON u.id_usuario = bu.id_usuario
WHERE bu.id_album = 1;

-- Mostrar todos los álbumes lanzados en un año específico
SELECT titulo, fecha_lanzamiento
FROM Albumes
WHERE YEAR(fecha_lanzamiento) = 2022;










/******************************************************************************\
                                JOINS Restaurante
\******************************************************************************/
CREATE DATABASE IF NOT EXISTS restaurante_db;
USE restaurante_db;

-- Tablas
CREATE TABLE Mesas (
    id_mesa INT AUTO_INCREMENT PRIMARY KEY,
    numero_mesa INT NOT NULL UNIQUE,
    capacidad INT NOT NULL,
    estado ENUM('libre', 'ocupada') DEFAULT 'libre'
);

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Ordenes (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    id_mesa INT,
    id_cliente INT,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('pendiente', 'en_proceso', 'completada') DEFAULT 'pendiente',
    FOREIGN KEY (id_mesa) REFERENCES Mesas(id_mesa),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Platos (
    id_plato INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Orden_Platos (
    id_orden_plato INT AUTO_INCREMENT PRIMARY KEY,
    id_orden INT,
    id_plato INT,
    cantidad INT NOT NULL DEFAULT 1,
    FOREIGN KEY (id_orden) REFERENCES Ordenes(id_orden),
    FOREIGN KEY (id_plato) REFERENCES Platos(id_plato)
);

-- Datos de ejemplo
INSERT INTO Mesas (numero_mesa, capacidad) VALUES
(1, 4),
(2, 6),
(3, 2),
(4, 8),
(5, 4),
(6, 6),
(7, 4),
(8, 2),
(9, 8),
(10, 4),
(11, 6),
(12, 4),
(13, 2),
(14, 8),
(15, 4),
(16, 6),
(17, 4),
(18, 2),
(19, 8),
(20, 4);

INSERT INTO Clientes (nombre, telefono, email) VALUES
('Juan Pérez', '555-1001', 'juan.perez@example.com'),
('María González', '555-1002', 'maria.gonzalez@example.com'),
('Carlos López', '555-1003', 'carlos.lopez@example.com'),
('Ana Martínez', '555-1004', 'ana.martinez@example.com'),
('Luis Fernández', '555-1005', 'luis.fernandez@example.com'),
('Sofía Ramírez', '555-1006', 'sofia.ramirez@example.com'),
('Pedro Sánchez', '555-1007', 'pedro.sanchez@example.com'),
('Lucía Torres', '555-1008', 'lucia.torres@example.com'),
('Miguel Díaz', '555-1009', 'miguel.diaz@example.com'),
('Elena Ruiz', '555-1010', 'elena.ruiz@example.com'),
('Jorge Morales', '555-1011', 'jorge.morales@example.com'),
('Carmen Ortega', '555-1012', 'carmen.ortega@example.com'),
('Raúl Navarro', '555-1013', 'raul.navarro@example.com'),
('Patricia Jiménez', '555-1014', 'patricia.jimenez@example.com'),
('Alberto Vargas', '555-1015', 'alberto.vargas@example.com'),
('Mónica Rojas', '555-1016', 'monica.rojas@example.com'),
('Roberto Medina', '555-1017', 'roberto.medina@example.com'),
('Silvia Guerrero', '555-1018', 'silvia.guerrero@example.com'),
('Héctor Paredes', '555-1019', 'hector.paredes@example.com'),
('Natalia Flores', '555-1020', 'natalia.flores@example.com');

INSERT INTO Platos (nombre, descripcion, precio) VALUES
('Hamburguesa Clásica', 'Hamburguesa con queso, lechuga y tomate', 120.00),
('Pizza Margarita', 'Pizza con salsa de tomate, mozzarella y albahaca', 180.00),
('Ensalada César', 'Ensalada con pollo, crutones y aderezo César', 90.00),
('Tacos al Pastor', 'Tacos de cerdo con piña y cebolla', 60.00),
('Sushi Variado', 'Surtido de sushi con pescado fresco', 250.00),
('Pasta Carbonara', 'Pasta con salsa de huevo, queso y tocino', 150.00),
('Filete Mignon', 'Filete de res a la parrilla con guarnición', 300.00),
('Ceviche Peruano', 'Ceviche de pescado con limón y ají', 110.00),
('Lasagna', 'Lasagna de carne con salsa boloñesa', 140.00),
('Paella Valenciana', 'Paella con mariscos y arroz', 220.00),
('Ramen', 'Sopa de fideos con cerdo y huevo', 130.00),
('Burrito', 'Burrito de carne con frijoles y queso', 80.00),
('Pollo al Curry', 'Pollo con salsa de curry y arroz', 160.00),
('Tarta de Manzana', 'Postre de manzana con masa quebrada', 70.00),
('Helado de Vainilla', 'Helado de vainilla con toppings', 50.00),
('Café Americano', 'Café negro americano', 30.00),
('Jugo de Naranja', 'Jugo natural de naranja', 40.00),
('Agua Mineral', 'Agua mineral sin gas', 20.00),
('Cerveza Artesanal', 'Cerveza rubia artesanal', 60.00),
('Vino Tinto', 'Vino tinto de la casa', 90.00);

INSERT INTO Ordenes (id_mesa, id_cliente) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO Orden_Platos (id_orden, id_plato, cantidad) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1),
(3, 4, 3),
(3, 5, 1),
(4, 6, 2),
(5, 7, 1),
(6, 8, 2),
(7, 9, 1),
(8, 10, 1);


-- Consultas de prueba
-- Listar todas las órdenes con sus detalles
SELECT o.id_orden, m.numero_mesa, c.nombre AS cliente, p.nombre AS plato, op.cantidad
FROM Ordenes o
INNER JOIN Mesas m ON o.id_mesa = m.id_mesa
INNER JOIN Clientes c ON o.id_cliente = c.id_cliente
INNER JOIN Orden_Platos op ON o.id_orden = op.id_orden
INNER JOIN Platos p ON op.id_plato = p.id_plato;

-- Mostrar el total de ventas por plato
SELECT p.nombre, SUM(op.cantidad * p.precio) AS total_ventas
FROM Orden_Platos op
INNER JOIN Platos p ON op.id_plato = p.id_plato
GROUP BY p.id_plato;
-- Listar las mesas ocupadas
SELECT numero_mesa, capacidad
FROM Mesas
WHERE estado = 'ocupada';

-- Mostrar las órdenes pendientes
SELECT o.id_orden, m.numero_mesa, c.nombre AS cliente, o.fecha_hora
FROM Ordenes o
INNER JOIN Mesas m ON o.id_mesa = m.id_mesa
INNER JOIN Clientes c ON o.id_cliente = c.id_cliente
WHERE o.estado = 'pendiente';

-- Calcular el total de una orden específica
SELECT o.id_orden, SUM(op.cantidad * p.precio) AS total
FROM Ordenes o
INNER JOIN Orden_Platos op ON o.id_orden = op.id_orden
INNER JOIN Platos p ON op.id_plato = p.id_plato
WHERE o.id_orden = 1
GROUP BY o.id_orden;










/******************************************************************************\
                     JOINS Sistema Biblioteca Universitaria
\******************************************************************************/
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS biblioteca_db;
USE biblioteca_db;

-- Tabla Estudiantes
CREATE TABLE Estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(15)
);

-- Tabla Libros
CREATE TABLE Libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    año_publicacion INT
);

-- Tabla Autores
CREATE TABLE Autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50)
);

-- Tabla Préstamos
CREATE TABLE Prestamos (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_libro INT,
    fecha_prestamo DATE DEFAULT (CURDATE()),
    fecha_devolucion DATE,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro)
);


-- Datos de ejemplo
-- Insertar 20 registros en Estudiantes
INSERT INTO Estudiantes (nombre, email, telefono) VALUES
('Juan Pérez', 'juan.perez@example.com', '555-1001'),
('María González', 'maria.gonzalez@example.com', '555-1002'),
('Carlos López', 'carlos.lopez@example.com', '555-1003'),
('Ana Martínez', 'ana.martinez@example.com', '555-1004'),
('Luis Fernández', 'luis.fernandez@example.com', '555-1005'),
('Sofía Ramírez', 'sofia.ramirez@example.com', '555-1006'),
('Pedro Sánchez', 'pedro.sanchez@example.com', '555-1007'),
('Lucía Torres', 'lucia.torres@example.com', '555-1008'),
('Miguel Díaz', 'miguel.diaz@example.com', '555-1009'),
('Elena Ruiz', 'elena.ruiz@example.com', '555-1010'),
('Jorge Morales', 'jorge.morales@example.com', '555-1011'),
('Carmen Ortega', 'carmen.ortega@example.com', '555-1012'),
('Raúl Navarro', 'raul.navarro@example.com', '555-1013'),
('Patricia Jiménez', 'patricia.jimenez@example.com', '555-1014'),
('Alberto Vargas', 'alberto.vargas@example.com', '555-1015'),
('Mónica Rojas', 'monica.rojas@example.com', '555-1016'),
('Roberto Medina', 'roberto.medina@example.com', '555-1017'),
('Silvia Guerrero', 'silvia.guerrero@example.com', '555-1018'),
('Héctor Paredes', 'hector.paredes@example.com', '555-1019'),
('Natalia Flores', 'natalia.flores@example.com', '555-1020');

-- Insertar 20 registros en Libros
INSERT INTO Libros (titulo, isbn, año_publicacion) VALUES
('Cien Años de Soledad', '978-0307474728', 1967),
('1984', '978-0451524935', 1949),
('El Principito', '978-0156012195', 1943),
('Don Quijote de la Mancha', '978-8424116196', 1605),
('Orgullo y Prejuicio', '978-0141439518', 1813),
('Crimen y Castigo', '978-0486415871', 1866),
('El Gran Gatsby', '978-0743273565', 1925),
('Matar a un Ruiseñor', '978-0446310789', 1960),
('Ulises', '978-0679722762', 1922),
('En Busca del Tiempo Perdido', '978-2070404309', 1913),
('Fahrenheit 451', '978-1451673319', 1953),
('El Hobbit', '978-0547928227', 1937),
('Los Juegos del Hambre', '978-0439023481', 2008),
('Harry Potter y la Piedra Filosofal', '978-8478884456', 1997),
('El Señor de los Anillos', '978-0544003415', 1954),
('Las Crónicas de Narnia', '978-0064471190', 1950),
('El Alquimista', '978-0062315007', 1988),
('La Sombra del Viento', '978-8408079545', 2001),
('Rayuela', '978-0307474729', 1963),
('La Casa de los Espíritus', '978-0307474730', 1982);

-- Insertar 20 registros en Autores
INSERT INTO Autores (nombre, nacionalidad) VALUES
('Gabriel García Márquez', 'Colombiano'),
('George Orwell', 'Británico'),
('Antoine de Saint-Exupéry', 'Francés'),
('Miguel de Cervantes', 'Español'),
('Jane Austen', 'Británica'),
('Fyodor Dostoevsky', 'Ruso'),
('F. Scott Fitzgerald', 'Estadounidense'),
('Harper Lee', 'Estadounidense'),
('James Joyce', 'Irlandés'),
('Marcel Proust', 'Francés'),
('Ray Bradbury', 'Estadounidense'),
('J.R.R. Tolkien', 'Británico'),
('Suzanne Collins', 'Estadounidense'),
('J.K. Rowling', 'Británica'),
('C.S. Lewis', 'Británico'),
('Paulo Coelho', 'Brasileño'),
('Carlos Ruiz Zafón', 'Español'),
('Julio Cortázar', 'Argentino'),
('Isabel Allende', 'Chilena'),
('Mario Vargas Llosa', 'Peruano');

-- Insertar 10 registros en Préstamos
INSERT INTO Prestamos (id_estudiante, id_libro, fecha_prestamo, fecha_devolucion) VALUES
(1, 1, '2023-10-01', '2023-10-15'),
(2, 2, '2023-10-02', '2023-10-16'),
(3, 3, '2023-10-03', '2023-10-17'),
(4, 4, '2023-10-04', '2023-10-18'),
(5, 5, '2023-10-05', '2023-10-19'),
(6, 6, '2023-10-06', '2023-10-20'),
(7, 7, '2023-10-07', '2023-10-21'),
(8, 8, '2023-10-08', '2023-10-22'),
(9, 9, '2023-10-09', '2023-10-23'),
(10, 10, '2023-10-10', '2023-10-24');


-- consultas de ejemplo
-- 1. Listar todos los préstamos con detalles de estudiantes y libros
SELECT p.id_prestamo, e.nombre AS estudiante, l.titulo AS libro, p.fecha_prestamo, p.fecha_devolucion
FROM Prestamos p
INNER JOIN Estudiantes e ON p.id_estudiante = e.id_estudiante
INNER JOIN Libros l ON p.id_libro = l.id_libro;

-- 2. Mostrar los libros prestados actualmente (sin devolver)
SELECT l.titulo, e.nombre AS estudiante, p.fecha_prestamo
FROM Prestamos p
INNER JOIN Libros l ON p.id_libro = l.id_libro
INNER JOIN Estudiantes e ON p.id_estudiante = e.id_estudiante
WHERE p.fecha_devolucion IS NULL;

-- 3. Contar cuántos libros ha prestado cada estudiante
SELECT e.nombre, COUNT(p.id_prestamo) AS total_prestamos
FROM Estudiantes e
LEFT JOIN Prestamos p ON e.id_estudiante = p.id_estudiante
GROUP BY e.id_estudiante;

-- 4. Mostrar los libros publicados después del año 2000
SELECT titulo, año_publicacion
FROM Libros
WHERE año_publicacion > 2000;

-- 5. Listar los autores y sus nacionalidades
SELECT nombre, nacionalidad
FROM Autores;










