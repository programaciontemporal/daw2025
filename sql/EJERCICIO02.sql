-- Copia el siguiente script en MySQL y ejecútalo.
-- Comprueba que no genera error y resuelve las siguientes consultas.

-- Crear la base de datos
CREATE DATABASE empresa;
USE empresa;

-- Crear la tabla empleados
CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    fecha_contratacion DATE,
    fecha_salida DATE NULL,
    email VARCHAR(100) UNIQUE NULL,
    activo BOOLEAN DEFAULT TRUE
);

-- Insertar datos de ejemplo
INSERT INTO empleados (nombre, departamento, cargo, salario, fecha_contratacion, fecha_salida, email, activo) VALUES
('Ana Pérez', 'Ventas', 'Ejecutiva de Ventas', 4500.00, '2021-06-15', NULL, 'ana.perez@empresa.com', TRUE),
('Luis Gómez', 'TI', 'Desarrollador', 5500.00, '2019-03-20', NULL, 'luis.gomez@empresa.com', TRUE),
('María López', 'Marketing', 'Analista de Marketing', 4800.00, '2022-02-10', NULL, 'maria.lopez@empresa.com', TRUE),
('Carlos Ramírez', 'Ventas', 'Gerente', 7000.00, '2018-09-05', NULL, 'carlos.ramirez@empresa.com', TRUE),
('Patricia Torres', 'RRHH', 'Coordinadora', 3500.00, '2020-07-01', NULL, 'patricia.torres@empresa.com', TRUE),
('Jorge Herrera', 'TI', 'Desarrollador', 5300.00, '2021-01-12', NULL, 'jorge.herrera@empresa.com', TRUE),
('Laura Sánchez', 'Contabilidad', 'Contadora', 4000.00, '2017-11-25', NULL, 'laura.sanchez@empresa.com', TRUE),
('Fernando Díaz', 'Marketing', 'Director', 8500.00, '2016-04-18', NULL, 'fernando.diaz@empresa.com', TRUE),
('Andrea Ríos', 'TI', 'Ingeniera de Datos', 6200.00, '2020-10-30', NULL, 'andrea.rios@empresa.com', TRUE),
('Roberto Medina', 'Ventas', 'Ejecutivo de Ventas', 4600.00, '2019-08-22', NULL, 'roberto.medina@empresa.com', TRUE),
('Gabriela Castro', 'RRHH', 'Reclutadora', 3700.00, '2023-01-10', NULL, 'gabriela.castro@empresa.com', TRUE),
('Héctor Fuentes', 'TI', 'Administrador de Sistemas', 5800.00, '2015-05-15', NULL, 'hector.fuentes@empresa.com', TRUE),
('Verónica Silva', 'Ventas', 'Ejecutiva de Ventas', 4300.00, '2018-07-29', '2023-02-15', 'veronica.silva@empresa.com', FALSE),
('Alfonso García', 'Marketing', 'Diseñador Gráfico', 4700.00, '2021-12-01', NULL, 'alfonso.garcia@empresa.com', TRUE),
('Beatriz Ortega', 'Contabilidad', 'Asistente Contable', 3600.00, '2019-04-23', NULL, 'beatriz.ortega@empresa.com', TRUE);

-- Filtrar por valores exactos
SELECT * FROM empleados WHERE departamento = 'Ventas';

-- Filtrar por valores distintos
SELECT * FROM empleados WHERE salario != 5000;

-- Filtrar por un rango de valores (BETWEEN)
SELECT * FROM empleados WHERE salario BETWEEN 3000 AND 6000;

-- Filtrar por valores dentro de una lista (IN)
SELECT * FROM empleados WHERE departamento IN ('Ventas', 'Marketing', 'TI');

-- Filtrar por valores que NO están en una lista (NOT IN)
SELECT * FROM empleados WHERE departamento NOT IN ('RRHH', 'Contabilidad');

-- Filtrar por valores nulos (IS NULL)
SELECT * FROM empleados WHERE fecha_salida IS NULL;

-- Filtrar por valores no nulos (IS NOT NULL)
SELECT * FROM empleados WHERE email IS NOT NULL;

-- Filtrar por coincidencias parciales (LIKE)
SELECT * FROM empleados WHERE nombre LIKE 'A%';                     -- Muestra empleados cuyo nombre empieza con "A".
SELECT * FROM empleados WHERE nombre LIKE '%lopez%';                -- Muestra empleados cuyo nombre contiene "lopez" en cualquier posición.
SELECT * FROM empleados WHERE nombre LIKE '_a%';                    -- Muestra empleados cuyo segundo carácter es "a".

-- Filtrar por valores booleanos
SELECT * FROM empleados WHERE activo = TRUE;

-- Filtrar por condiciones compuestas (AND)
SELECT * FROM empleados WHERE departamento = 'TI' AND salario > 4000;

-- Filtrar por condiciones múltiples (OR)
SELECT * FROM empleados WHERE cargo = 'Gerente' OR cargo = 'Director';

-- Filtrar con combinaciones (AND, OR)
SELECT * FROM empleados WHERE (departamento = 'Ventas' OR departamento = 'Marketing') AND salario > 5000;

-- Filtrar por fecha (DATE, NOW())
SELECT * FROM empleados WHERE fecha_contratacion > '2022-01-01';    -- Muestra empleados que ingresaron después del 1 de enero de 2022.
SELECT * FROM empleados WHERE fecha_contratacion < NOW();           -- Muestra empleados cuya fecha de contratación es anterior al día de hoy.

-- . Filtrar por día, mes o año específico
SELECT * FROM empleados WHERE YEAR(fecha_contratacion) = 2023;      -- Muestra empleados contratados en el año 2023.
SELECT * FROM empleados WHERE MONTH(fecha_contratacion) = 12;       -- Muestra empleados contratados en el mes de diciembre.
SELECT * FROM empleados WHERE DAY(fecha_contratacion) = 15;         -- Muestra empleados contratados el día 15 de cualquier mes.

-- . Filtrar por longitud de texto (LENGTH())
SELECT * FROM empleados WHERE LENGTH(nombre) > 10;

-- Filtrar por primera letra (LEFT())
SELECT * FROM empleados WHERE LEFT(nombre, 1) = 'J';

-- Filtrar por última letra (RIGHT())
SELECT * FROM empleados WHERE RIGHT(nombre, 1) = 's';

-- Filtrar con expresiones regulares (REGEXP)
SELECT * FROM empleados WHERE nombre REGEXP '^A[a-z]+';             -- Muestra empleados cuyo nombre empieza con "A" seguida de cualquier letra.
SELECT * FROM empleados WHERE nombre REGEXP 'lopez$';               -- Muestra empleados cuyo nombre termina en "lopez".


-- #####################################################################################################################################################
-- ################################################          Ejercicios de Filtrado y Búsqueda          ################################################
-- #####################################################################################################################################################

-- Obtener todos los empleados que trabajan en el departamento de "TI".
SELECT * FROM empleados WHERE departamento = 'TI';

-- Mostrar los empleados cuyo salario sea mayor a 5000.
SELECT * FROM empleados WHERE salario > 5000;

-- Listar los empleados que trabajan en "Ventas" o "Marketing".
SELECT * FROM empleados WHERE departamento = 'Ventas' OR departamento = 'Marketing';

-- Buscar los empleados cuyo nombre comience con la letra "A".
SELECT * FROM empleados WHERE LEFT(nombre,1) = 'A';
SELECT * FROM empleados WHERE nombre LIKE 'A%';

-- Obtener los empleados que fueron contratados después del año 2020.
-- WHERE YEAR(campo) > 2020
SELECT * FROM empleados WHERE YEAR(fecha_contratacion) > 2020;

-- Listar los empleados que aún siguen activos en la empresa.
SELECT * FROM empleados WHERE activo = TRUE;

-- Mostrar los empleados cuyo correo electrónico contiene "empresa.com".
SELECT * FROM empleados WHERE email LIKE '%empresa.com%';
-- SELECT * FROM empleados WHERE email LIKE '%empresa.com'; -- También es válido

-- Obtener los empleados cuyo cargo es "Gerente" o "Director".
SELECT * FROM empleados WHERE cargo = 'Gerente' OR cargo='Director';

-- Listar los empleados cuyo salario esté entre 4000 y 6000.
SELECT * FROM empleados WHERE salario BETWEEN 4000 AND 6000;

-- Buscar los empleados que NO pertenecen a los departamentos de "RRHH" ni "Contabilidad".
SELECT * FROM empleados WHERE departamento != 'RRHH' AND departamento != 'Contabilidad';




-- #####################################################################################################################################################
-- #############################################          Ejercicios de Funciones y Agregaciones          ##############################################
-- #####################################################################################################################################################

-- Contar cuántos empleados hay en total en la empresa.
SELECT COUNT(*) FROM empleados;

-- Encontrar el salario más alto y más bajo en la empresa.
SELECT salario FROM empleados WHERE salario = (SELECT MAX(salario) FROM empleados) OR salario = (SELECT MIN(salario) FROM empleados);

-- Calcular cuántos empleados hay en cada departamento.
SELECT departamento, COUNT(*) AS cantidad_empleados FROM empleados GROUP BY departamento;

-- Determinar la cantidad de empleados activos y la cantidad de empleados inactivos.
SELECT activo, COUNT(*) AS cantidad_activos FROM empleados GROUP BY activo;

-- Obtener el nombre del empleado con el salario más alto.
SELECT nombre, salario FROM empleados WHERE salario = (SELECT MAX(salario) from empleados);

-- Calcular cuántos empleados fueron contratados en el año 2021.
SELECT COUNT(*) AS contratados_en_2021 FROM empleados WHERE YEAR(fecha_contratacion) = 2021;

-- Mostrar la diferencia entre el salario más alto y el más bajo.
SELECT MAX(salario) - MIN(salario) AS diferencia_salarios FROM empleados;

-- Listar los empleados ordenados por fecha de contratación, del más reciente al más antiguo.
SELECT * FROM empleados ORDER BY fecha_contratacion DESC;


