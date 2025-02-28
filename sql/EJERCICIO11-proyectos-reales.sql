/*************************************************************************************************\
                         Ejercicio 1: Gestión de Pedidos en un Restaurante
\*************************************************************************************************/

CREATE DATABASE IF NOT EXISTS restaurante11_db;
USE restaurante11_db;

-- Tablas:
CREATE TABLE IF NOT EXISTS Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

CREATE TABLE IF NOT EXISTS Productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Pedidos_Productos (
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (pedido_id, producto_id),
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);



-- Datos ejemplo
-- Clientes
INSERT INTO Clientes (nombre, email) VALUES
('Juan Pérez', 'juan.perez@example.com'),
('María López', 'maria.lopez@example.com'),
('Carlos Sánchez', 'carlos.sanchez@example.com'),
('Ana García', 'ana.garcia@example.com'),
('Luis Martínez', 'luis.martinez@example.com'),
('Sofía Rodríguez', 'sofia.rodriguez@example.com'),
('Jorge Fernández', 'jorge.fernandez@example.com'),
('Laura Gómez', 'laura.gomez@example.com'),
('Miguel Díaz', 'miguel.diaz@example.com'),
('Elena Ruiz', 'elena.ruiz@example.com'),
('Pedro Hernández', 'pedro.hernandez@example.com'),
('Carmen Jiménez', 'carmen.jimenez@example.com'),
('David Torres', 'david.torres@example.com'),
('Isabel Ramírez', 'isabel.ramirez@example.com'),
('Francisco Morales', 'francisco.morales@example.com'),
('Lucía Ortiz', 'lucia.ortiz@example.com'),
('Antonio Castro', 'antonio.castro@example.com'),
('Marta Navarro', 'marta.navarro@example.com'),
('Javier Romero', 'javier.romero@example.com'),
('Rosa Álvarez', 'rosa.alvarez@example.com'),
('Daniel Méndez', 'daniel.mendez@example.com'),
('Patricia Gutiérrez', 'patricia.gutierrez@example.com'),
('Alejandro Cruz', 'alejandro.cruz@example.com'),
('Silvia Reyes', 'silvia.reyes@example.com'),
('Manuel Ortega', 'manuel.ortega@example.com'),
('Eva Vargas', 'eva.vargas@example.com'),
('Rubén Medina', 'ruben.medina@example.com'),
('Nuria Guerrero', 'nuria.guerrero@example.com'),
('Alberto Rojas', 'alberto.rojas@example.com'),
('Clara Peña', 'clara.pena@example.com'),
('Sergio Silva', 'sergio.silva@example.com'),
('Beatriz Flores', 'beatriz.flores@example.com'),
('Héctor Delgado', 'hector.delgado@example.com'),
('Adriana Vega', 'adriana.vega@example.com'),
('Raúl Paredes', 'raul.paredes@example.com'),
('Cristina Mora', 'cristina.mora@example.com'),
('Víctor Valdez', 'victor.valdez@example.com'),
('Lorena Cabrera', 'lorena.cabrera@example.com'),
('Oscar Ríos', 'oscar.rios@example.com'),
('Natalia Campos', 'natalia.campos@example.com'),
('Fernando Salazar', 'fernando.salazar@example.com'),
('Alicia Fuentes', 'alicia.fuentes@example.com'),
('Roberto Núñez', 'roberto.nunez@example.com'),
('Verónica Espinoza', 'veronica.espinoza@example.com'),
('Andrés Carrillo', 'andres.carrillo@example.com'),
('Diana Ponce', 'diana.ponce@example.com'),
('José Ávila', 'jose.avila@example.com'),
('Gabriela Cervantes', 'gabriela.cervantes@example.com'),
('Ricardo Lugo', 'ricardo.lugo@example.com');

-- Productos
INSERT INTO Productos (nombre, precio) VALUES
('Hamburguesa Clásica', 8.50),
('Pizza Margarita', 10.00),
('Ensalada César', 6.00),
('Sopa de Tomate', 4.50),
('Pasta Alfredo', 9.00),
('Tacos de Carne', 7.50),
('Sushi Roll', 12.00),
('Pollo a la Parrilla', 11.00),
('Lasagna', 9.50),
('Burrito de Pollo', 8.00),
('Café Americano', 2.50),
('Té Verde', 2.00),
('Refresco de Cola', 1.50),
('Agua Mineral', 1.00),
('Helado de Vainilla', 3.00),
('Tarta de Manzana', 4.50),
('Batido de Fresa', 3.50),
('Nachos con Queso', 5.00),
('Alitas de Pollo', 6.50),
('Papas Fritas', 3.00),
('Sandwich de Jamón', 5.50),
('Bagel con Queso Crema', 4.00),
('Pan de Ajo', 3.50),
('Ceviche', 10.50),
('Empanadas de Carne', 6.00),
('Churrasco', 15.00),
('Risotto de Champiñones', 11.50),
('Tiramisú', 5.00),
('Flan', 4.00),
('Cerveza Artesanal', 4.50),
('Vino Tinto', 6.00),
('Mojito', 5.50),
('Margarita', 6.50),
('Cóctel de Frutas', 4.00),
('Jugo de Naranja', 3.00),
('Smoothie de Mango', 4.50),
('Tostadas de Aguacate', 5.50),
('Quesadilla', 6.00),
('Tamales', 5.50),
('Chiles en Nogada', 12.50),
('Mole Poblano', 13.00),
('Pozole', 9.50),
('Tostones', 4.50),
('Camarones al Ajillo', 14.00),
('Paella', 16.00),
('Gazpacho', 5.00),
('Crema de Espárragos', 4.50),
('Ravioles de Ricotta', 10.00),
('Canelones de Espinaca', 9.00);

-- Pedidos
INSERT INTO Pedidos (cliente_id, fecha_pedido) VALUES
(1, '2023-10-01 12:00:00'),
(2, '2023-10-01 12:30:00'),
(3, '2023-10-01 13:00:00'),
(4, '2023-10-02 14:00:00'),
(5, '2023-10-02 15:00:00'),
(6, '2023-10-03 16:00:00'),
(7, '2023-10-03 17:00:00'),
(8, '2023-10-04 18:00:00'),
(9, '2023-10-04 19:00:00'),
(10, '2023-10-05 20:00:00'),
(11, '2023-10-05 21:00:00'),
(12, '2023-10-06 22:00:00'),
(13, '2023-10-06 23:00:00'),
(14, '2023-10-07 12:00:00'),
(15, '2023-10-07 13:00:00');

-- Pedidos_Productos
INSERT INTO Pedidos_Productos (pedido_id, producto_id, cantidad) VALUES
(1, 1, 2), (1, 3, 1), (1, 5, 1),
(2, 2, 1), (2, 4, 2),
(3, 6, 3), (3, 7, 1),
(4, 8, 1), (4, 9, 1), (4, 10, 2),
(5, 11, 1), (5, 12, 1),
(6, 13, 2), (6, 14, 1),
(7, 15, 1), (7, 16, 1),
(8, 17, 2), (8, 18, 1),
(9, 19, 1), (9, 20, 1),
(10, 21, 1), (10, 22, 1),
(11, 23, 2), (11, 24, 1),
(12, 25, 1), (12, 26, 1),
(13, 27, 1), (13, 28, 1),
(14, 29, 1), (14, 30, 1),
(15, 31, 1), (15, 32, 1);

-- Consultas de prueba
-- Obtener todos los pedidos con el nombre del cliente (INNER JOIN).
SELECT 
    p.id AS ID_Pedido, 
    p.fecha_pedido, 
    c.nombre AS nombre_cliente
FROM 
    Pedidos p
INNER JOIN 
    Clientes c ON p.cliente_id = c.id;

-- Listar los productos de un pedido específico (INNER JOIN).
SELECT
    p.nombre AS Nombre_Producto,
    pp.cantidad,
    p.precio AS Precio_Unitario,
    (pp.cantidad * p.precio) as Subtotal
FROM
    Pedidos_Productos pp
INNER JOIN
    productos p ON pp.producto_id = p.id
WHERE
    pp.pedido_id = 1;

-- Mostrar todos los clientes, incluso aquellos que no han realizado pedidos (LEFT JOIN).
SELECT
    c.id AS ID_Cliente,
    c.nombre AS Nombre_Cliente,
    p.id AS ID_Pedido,
    p.fecha_pedido
FROM
    Clientes c
LEFT JOIN
    Pedidos p ON p.cliente_id = c.id;

-- Mostrar todos los pedidos, incluso si aún no contienen productos (LEFT JOIN).
SELECT
    p.id AS ID_Pedido,
    p.fecha_pedido,
    pp.producto_id,
    pp.cantidad,
    c.id AS ID_Cliente,
    c.nombre
FROM
    pedidos p
LEFT JOIN
    pedidos_productos pp ON p.id = pp.producto_id
INNER JOIN
	 clientes c ON p.cliente_id = c.id;

-- Listar todos los productos del menú, incluso si no han sido vendidos (RIGHT JOIN).
SELECT
    p.id,
    p.nombre,
    pp.producto_id,
    pp.cantidad
FROM
    productos p
RIGHT JOIN
    pedidos_productos pp ON p.id = pp.producto_id;











/*************************************************************************************************\
                         Ejercicio 2: Plataforma de Streaming de Video 
\*************************************************************************************************/

CREATE DATABASE IF NOT EXISTS streaming11_db;
USE streaming11_db;

-- Tablas
-- Usuarios
CREATE TABLE IF NOT EXISTS Usuarios(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL
);

-- Directores
CREATE TABLE IF NOT EXISTS Directores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150)
);

-- Películas
CREATE TABLE IF NOT EXISTS Peliculas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    anio INT NOT NULL,
    director_id INT,
    FOREIGN KEY (director_id) REFERENCES Directores(id)
);

-- Visualizaciones
CREATE TABLE IF NOT EXISTS Visualizaciones (
    usuario_id INT NOT NULL,
    pelicula_id INT NOT NULL,
    fecha_visualizacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (usuario_id, pelicula_id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (pelicula_id) REFERENCES Peliculas(id)
);

-- Datos de ejemplo
-- Insertar 50 registros en la tabla Usuarios
INSERT INTO Usuarios (nombre, email) VALUES
('Carlos Pérez', 'carlos.perez@example.com'),
('Ana Gómez', 'ana.gomez@example.com'),
('Luis Rodríguez', 'luis.rodriguez@example.com'),
('María López', 'maria.lopez@example.com'),
('José Martínez', 'jose.martinez@example.com'),
('Patricia Sánchez', 'patricia.sanchez@example.com'),
('David García', 'david.garcia@example.com'),
('Laura Fernández', 'laura.fernandez@example.com'),
('Pedro Jiménez', 'pedro.jimenez@example.com'),
('Isabel Díaz', 'isabel.diaz@example.com'),
('Antonio Morales', 'antonio.morales@example.com'),
('Cristina López', 'cristina.lopez@example.com'),
('Juan Ruiz', 'juan.ruiz@example.com'),
('Marta González', 'marta.gonzalez@example.com'),
('Manuel Pérez', 'manuel.perez@example.com'),
('Lucía Rodríguez', 'lucia.rodriguez@example.com'),
('Fernando Sánchez', 'fernando.sanchez@example.com'),
('Rosa Hernández', 'rosa.hernandez@example.com'),
('Miguel Torres', 'miguel.torres@example.com'),
('Sofía García', 'sofia.garcia@example.com'),
('Javier Romero', 'javier.romero@example.com'),
('Elena Díaz', 'elena.diaz@example.com'),
('Alberto Martín', 'alberto.martin@example.com'),
('Alicia Gómez', 'alicia.gomez@example.com'),
('Rafael Fernández', 'rafael.fernandez@example.com'),
('Natalia García', 'natalia.garcia@example.com'),
('Pablo Ruiz', 'pablo.ruiz@example.com'),
('Eva Pérez', 'eva.perez@example.com'),
('José Luis Gómez', 'jose.luis.gomez@example.com'),
('Marina Sánchez', 'marina.sanchez@example.com'),
('Ricardo Fernández', 'ricardo.fernandez@example.com'),
('Carmen Romero', 'carmen.romero@example.com'),
('Daniel Pérez', 'daniel.perez@example.com'),
('Julia Martín', 'julia.martin@example.com'),
('Fernando González', 'fernando.gonzalez@example.com'),
('Nuria García', 'nuria.garcia@example.com'),
('Santiago Rodríguez', 'santiago.rodriguez@example.com'),
('Begoña Díaz', 'begona.diaz@example.com'),
('Óscar Fernández', 'oscar.fernandez@example.com'),
('María José Sánchez', 'maria.jose.sanchez@example.com'),
('Juan Carlos Rodríguez', 'juan.carlos.rodriguez@example.com'),
('Sara López', 'sara.lopez@example.com'),
('Eduardo Gómez', 'eduardo.gomez@example.com'),
('Luis María Martínez', 'luis.maria.martinez@example.com'),
('Pilar González', 'pilar.gonzalez@example.com'),
('Carlos Hernández', 'carlos.hernandez@example.com'),
('Inés García', 'ines.garcia@example.com'),
('Antonio López', 'antonio.lopez@example.com'),
('Lucía Sánchez', 'lucia.sanchez@example.com'),
('Cristina Pérez', 'cristina.perez@example.com');

-- Insertar 50 registros en la tabla Directores
INSERT INTO Directores (nombre) VALUES
('Steven Spielberg'),
('Martin Scorsese'),
('Quentin Tarantino'),
('Christopher Nolan'),
('James Cameron'),
('Ridley Scott'),
('Alfred Hitchcock'),
('Francis Ford Coppola'),
('Stanley Kubrick'),
('Woody Allen'),
('The Coen Brothers'),
('David Fincher'),
('Peter Jackson'),
('George Lucas'),
('Tim Burton'),
('Clint Eastwood'),
('David Lynch'),
('Terrence Malick'),
('Coen Brothers'),
('Ang Lee'),
('Ron Howard'),
('Danny Boyle'),
('Paul Thomas Anderson'),
('Joel Coen'),
('Wes Anderson'),
('Guy Ritchie'),
('David Cronenberg'),
('Christopher McQuarrie'),
('Tarantino'),
('Michael Bay'),
('Zack Snyder'),
('Ridley Scott'),
('Ridley Scott'),
('Christopher Nolan'),
('Steven Soderbergh'),
('Joe Wright'),
('M. Night Shyamalan'),
('James Wan'),
('Lana Wachowski'),
('Joel Schumacher'),
('Steven Spielberg'),
('George Miller'),
('Martin Scorsese'),
('Ang Lee'),
('John Carpenter'),
('Ron Howard'),
('Ridley Scott'),
('Robert Zemeckis'),
('David Lynch'),
('Michael Mann');

-- Insertar 50 registros en la tabla Peliculas
INSERT INTO Peliculas (titulo, anio, director_id) VALUES
('Jurassic Park', 1993, 1),
('Goodfellas', 1990, 2),
('Pulp Fiction', 1994, 3),
('Inception', 2010, 4),
('Titanic', 1997, 5),
('Alien', 1979, 6),
('Psycho', 1960, 7),
('The Godfather', 1972, 8),
('2001: A Space Odyssey', 1968, 9),
('Annie Hall', 1977, 10),
('Fargo', 1996, 11),
('The Social Network', 2010, 12),
('The Lord of the Rings: The Fellowship of the Ring', 2001, 13),
('Star Wars: A New Hope', 1977, 14),
('Beetlejuice', 1988, 15),
('Gran Torino', 2008, 16),
('Mulholland Drive', 2001, 17),
('The Tree of Life', 2011, 18),
('No Country for Old Men', 2007, 11),
('Life of Pi', 2012, 19),
('A Beautiful Mind', 2001, 20),
('Trainspotting', 1996, 21),
('Boogie Nights', 1997, 22),
('The Royal Tenenbaums', 2001, 23),
('Snatch', 2000, 24),
('Videodrome', 1983, 25),
('Mission: Impossible – Fallout', 2018, 26),
('Transformers', 2007, 27),
('Watchmen', 2009, 28),
('Gladiator', 2000, 29),
('Saving Private Ryan', 1998, 1),
('The Departed', 2006, 2),
('Fight Club', 1999, 12),
('The Dark Knight', 2008, 4),
('Avatar', 2009, 5),
('The Martian', 2015, 6),
('Pulp Fiction', 1994, 3),
('The Shining', 1980, 9),
('The Big Lebowski', 1998, 11),
('Jaws', 1975, 1),
('The Silence of the Lambs', 1991, 12),
('The Fifth Element', 1997, 6),
('The Matrix', 1999, 28),
('The Incredibles', 2004, 29),
('Django Unchained', 2012, 3),
('Interstellar', 2014, 4),
('The Wolf of Wall Street', 2013, 2),
('The Prestige', 2006, 4),
('Kill Bill', 2003, 3);

-- Insertar 15 registros en la tabla Visualizaciones
INSERT INTO Visualizaciones (usuario_id, pelicula_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);


-- Consultas de prueba
-- Obtener todas las películas vistas por cada usuario (INNER JOIN).
SELECT
    u.id AS ID_Usuario,
    u.nombre AS Nombre_Usuario,
    p.titulo AS Pelicula,
    v.fecha_visualizacion AS Fecha
FROM
    Visualizaciones v
INNER JOIN
    Usuarios u ON v.usuario_id = u.id
INNER JOIN
    Peliculas p ON v.pelicula_id = p.id;

-- Listar las películas con el nombre del director (INNER JOIN).
SELECT
    p.id AS ID_Pelicula,
    p.titulo AS Titulo_Pelicula,
    d.nombre AS Director
FROM
    Peliculas p
INNER JOIN
    Directores d ON p.director_id = d.id
ORDER BY
    p.titulo ASC;

-- Mostrar todos los usuarios, incluso aquellos que no han visto ninguna película (LEFT JOIN).
SELECT
    u.id AS ID_Usuario,
    u.nombre,
    v.pelicula_id
FROM
    Usuarios u
LEFT JOIN
    Visualizaciones v ON u.id = v.usuario_id;


-- Mostrar todas las películas, incluso si nadie las ha visto aún (LEFT JOIN).
SELECT
    p.id AS ID_Pelicula,
    p.titulo AS Titulo,
    v.fecha_visualizacion AS Fecha_Visto
FROM
    Peliculas p
LEFT JOIN
    Visualizaciones v ON p.id = v.pelicula_id;

-- Listar todos los directores y las películas que han dirigido (RIGHT JOIN).
SELECT
    d.nombre AS Director,
    p.titulo AS Pelicula
FROM
    Directores d
RIGHT JOIN
    Peliculas p ON d.id = p.director_id;

