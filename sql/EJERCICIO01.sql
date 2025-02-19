-- Crear una base de datos llamada "universidad".
CREATE DATABASE universidad;
USE universidad;

-- Crear una tabla "estudiantes" con los campos:
-- id (clave primaria), nombre, apellido, edad y carrera.
CREATE TABLE estudiantes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(100),
    edad INT,
    carrera VARCHAR(50)
);

-- Insertar al menos 3 registros en la tabla "estudiantes".
INSERT INTO estudiantes (nombre, apellidos, edad, carrera) VALUES
('Juan', 'Pérez', 20, 'Ingeniería'),
('María', 'Gómez', 22, 'Medicina'),
('Luis', 'Martínez', 21, 'Derecho'),
('Ana', 'López', 23, 'Arquitectura'),
('Carlos', 'Fernández', 19, 'Economía');

-- Modificar la estructura de la tabla "estudiantes" agregando la columna "correo" de tipo VARCHAR(100).
ALTER TABLE estudiantes ADD COLUMN correo VARCHAR(100);

-- Actualizar la edad de un estudiante específico en la tabla "estudiantes".
UPDATE estudiantes SET edad=25 WHERE id=3;

-- Eliminar un estudiante por su ID
DELETE FROM estudiantes WHERE id=4;

-- Crear una tabla "profesores" con los campos:
-- id (clave primaria), nombre, apellido, especialidad y email.
CREATE TABLE profesores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(100),
    especialidad VARCHAR(50),
    email VARCHAR(100)
);

-- Insertar al menos 2 registros en la tabla "profesores"
INSERT INTO profesores (nombre, apellidos, especialidad, email) VALUES
('María', 'González', 'Historia', 'maria.gonzalez@example.com'),
('Ana', 'Martínez', 'Matemáticas', 'ana.martinez@example.com'),
('Luis', 'Pérez', 'Física', 'luis.perez@example.com'),
('Elena', 'Torres', 'Química', 'elena.torres@example.com'),
('Jorge', 'Ramírez', 'Biología', 'jorge.ramirez@example.com'),
('Laura', 'Fernández', 'Geografía', 'laura.fernandez@example.com'),
('Carlos', 'López', 'Ciencias', 'carlos.lopez@example.com');

-- Crear una tabla "materias" con los campos:
-- id (clave primaria), nombre de la materia, profesor_id (clave foránea de la tabla profesores).
CREATE TABLE materias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profesor_id INT,
    nombre_materia VARCHAR(50),
    FOREIGN KEY (profesor_id) REFERENCES profesores(id)
);

-- Insertar al menos 3 materias, asignando a cada una un profesor.
INSERT INTO materias (nombre_maeria, profesor_id) VALUES
('Historia Antigua', 1),
('Álgebra', 2),
('Mecánica', 3),
('Química Orgánica', 4),
('Botánica', 5);

-- Eliminar la tabla "materias" de la base de datos.
DROP TABLE materias;

-- Eliminar completamente la base de datos "universidad".
DROP DATABASE universidad;
