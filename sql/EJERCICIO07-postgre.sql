-- Creación de la base de datos
CREATE DATABASE empresa;

-- Uso de la base de datos
\c empresa;

-- Creación de la tabla principal (1 lado de la relación)
CREATE TABLE departamentos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Creación de la tabla dependiente (n lado de la relación)
CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2),
    departamento_id INT REFERENCES departamentos(id)
);

-- Inserción de datos en la tabla departamentos
INSERT INTO departamentos (nombre) VALUES ('Recursos Humanos');
INSERT INTO departamentos (nombre) VALUES ('Tecnología');
INSERT INTO departamentos (nombre) VALUES ('Ventas');

-- Inserción de datos en la tabla empleados
INSERT INTO empleados (nombre, salario, departamento_id) VALUES ('Ana López', 3000.00, 1);
INSERT INTO empleados (nombre, salario, departamento_id) VALUES ('Carlos Pérez', 4500.00, 2);
INSERT INTO empleados (nombre, salario, departamento_id) VALUES ('Elena Ruiz', 5000.00, 2);
INSERT INTO empleados (nombre, salario, departamento_id) VALUES ('Mario Gómez', 2800.00, 3);
INSERT INTO empleados (nombre, salario, departamento_id) VALUES ('Sara Medina', 3200.00, 1);

-- Consultas Sencillas en PostgreSQL
-- 1. Seleccionar todos los empleados
SELECT * FROM empleados;

-- 2. Seleccionar todos los departamentos
SELECT * FROM departamentos;

-- 3. Contar cuántos empleados hay en la empresa
SELECT COUNT(*) FROM empleados;

-- 4. Obtener los nombres de todos los empleados que ganan más de 4000
SELECT nombre FROM empleados WHERE salario > 4000;

-- 5. Listar empleados ordenados por salario descendente
SELECT * FROM empleados ORDER BY salario DESC;

-- 6. Obtener los empleados de un departamento específico (ejemplo: Tecnología)
SELECT * FROM empleados WHERE departamento_id = 2;

-- 7. Obtener el salario promedio de los empleados
SELECT AVG(salario) FROM empleados;

-- 8. Obtener el salario máximo y mínimo de la empresa
SELECT MAX(salario) AS salario_maximo, MIN(salario) AS salario_minimo FROM empleados;

-- 9. Contar cuántos empleados hay en cada departamento
SELECT departamento_id, COUNT(*) FROM empleados GROUP BY departamento_id;

-- 10. Obtener los empleados cuyo nombre comienza con 'C'
SELECT * FROM empleados WHERE nombre LIKE 'C%';

-- 11. Listar los nombres de empleados junto con su departamento
SELECT empleados.nombre, departamentos.nombre FROM empleados JOIN departamentos ON empleados.departamento_id = departamentos.id;

-- 12. Mostrar empleados con un salario entre 3000 y 5000
SELECT * FROM empleados WHERE salario BETWEEN 3000 AND 5000;

-- 13. Obtener el nombre y salario de los empleados ordenados por nombre
SELECT nombre, salario FROM empleados ORDER BY nombre ASC;

-- 14. Listar empleados que no pertenezcan al departamento de Ventas
SELECT * FROM empleados WHERE departamento_id <> 3;

-- 15. Obtener el departamento con más empleados
SELECT departamento_id, COUNT(*) AS total_empleados FROM empleados GROUP BY departamento_id ORDER BY total_empleados DESC LIMIT 1;

-- 16. Mostrar solo los nombres de los empleados en mayúsculas
SELECT UPPER(nombre) FROM empleados;

-- 17. Obtener la suma total de los salarios de todos los empleados
SELECT SUM(salario) FROM empleados;

-- 18. Listar los empleados ordenados por salario ascendente
SELECT * FROM empleados ORDER BY salario ASC;

-- 19. Mostrar los empleados que tienen un nombre de 5 caracteres
SELECT * FROM empleados WHERE LENGTH(nombre) = 5;

-- 20. Seleccionar empleados cuyo nombre termina en 'z'
SELECT * FROM empleados WHERE nombre LIKE '%z';

-Enunciados Similares a Resolver:
-- 1. Seleccionar los empleados cuyo salario sea menor a 3500.
SELECT * FROM empleados WHERE salario < 3500;

-- 2. Obtener los nombres de los departamentos que tienen empleados.
SELECT DISTINCT departamentos.nombre
FROM departamentos
JOIN empleados ON departamentos.id = empleados.departamento_id;

-- 3. Contar cuántos empleados ganan más de 4000.
SELECT COUNT(*) FROM empleados WHERE salario > 4000;

-- 4. Listar todos los departamentos en orden alfabético.
SELECT * FROM departamentos ORDER BY nombre ASC;

-- 5. Mostrar los empleados con un salario mayor al promedio.
SELECT * FROM empleados WHERE salario > (SELECT AVG(salario) FROM empleados);

-- 6. Obtener la cantidad de empleados en cada departamento.
SELECT departamento_id, COUNT(*) FROM empleados GROUP BY departamento_id;

-- 7. Listar los empleados cuyo nombre contenga la letra 'o'.
SELECT * FROM empleados WHERE nombre LIKE '%o%';

-- 8. Mostrar el departamento con menos empleados.
SELECT departamento_id, COUNT(*) AS total_empleados
FROM empleados
GROUP BY departamento_id
ORDER BY total_empleados ASC
LIMIT 1;

-- 9. Obtener el segundo salario más alto de la empresa.
SELECT MAX(salario) AS segundo_salario
FROM empleados
WHERE salario < (SELECT MAX(salario) FROM empleados);

-- 10. Listar empleados con nombre de más de 6 caracteres.
SELECT * FROM empleados WHERE LENGTH(nombre) > 6;

-- 11. Obtener los empleados cuyo salario sea un número par.
SELECT * FROM empleados WHERE MOD(salario, 2) = 0;

-- 12. Contar cuántos empleados hay en el departamento de Recursos Humanos.
SELECT COUNT(*) FROM empleados WHERE departamento_id = (SELECT id FROM departamentos WHERE nombre = 'Recursos Humanos');

-- 13. Obtener el nombre del empleado con el salario más alto.
SELECT nombre FROM empleados WHERE salario = (SELECT MAX(salario) FROM empleados);

-- 14. Mostrar el nombre del departamento al que pertenece cada empleado.
SELECT empleados.nombre AS empleado, departamentos.nombre AS departamento
FROM empleados
JOIN departamentos ON empleados.departamento_id = departamentos.id;

-- 15. Obtener la cantidad total de dinero que la empresa gasta en salarios.
SELECT SUM(salario) FROM empleados;

-- 16. Seleccionar empleados cuyo salario sea un múltiplo de 500.
SELECT * FROM empleados WHERE MOD(salario, 500) = 0;

-- 17. Listar los departamentos que no tienen empleados.
SELECT nombre FROM departamentos
WHERE id NOT IN (SELECT DISTINCT departamento_id FROM empleados);

-- 18. Obtener los tres empleados con los salarios más bajos.
SELECT * FROM empleados ORDER BY salario ASC LIMIT 3;

-- 19. Mostrar el nombre y el salario de los empleados con el salario más alto por departamento.
SELECT empleados.nombre, empleados.salario
FROM empleados
WHERE (empleados.salario, empleados.departamento_id) IN (
    SELECT MAX(salario), departamento_id
    FROM empleados
    GROUP BY departamento_id
);

-- 20. Contar cuántos empleados tienen un nombre que empieza con la letra 'S'.
SELECT COUNT(*) FROM empleados WHERE nombre LIKE 'S%';
