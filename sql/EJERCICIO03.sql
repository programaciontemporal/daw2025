/*
    1.	Crea una base de datos llamada Universidad y define las tablas
    necesarias para manejar estudiantes y cursos con una relación muchos a muchos.
*/

CREATE DATABASE universidad;
USE universidad;

-- Tabla de estudiantes (simple)
CREATE TABLE estudiantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla de cursos
CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla de inscripciones
CREATE TABLE inscripciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    fecha_inscripcion DATE NOT NULL,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id) ON DELETE CASCADE,
    FOREIGN KEY (id_curso) REFERENCES cursos(id) ON DELETE CASCADE
);


-- Introduzco 20 alumnos para poder hacer pruebas
INSERT INTO estudiantes (nombre) VALUES
('Juan Pérez García'),
('María López Fernández'),
('Carlos Sánchez Martínez'),
('Ana Gómez Rodríguez'),
('Luis Díaz Hernández'),
('Marta Ruiz Jiménez'),
('José Torres Morales'),
('Laura Ramírez Ortiz'),
('Pedro Flores Castillo'),
('Elena Romero Vega'),
('Miguel Navarro Soto'),
('Carmen Ramos Gil'),
('Javier Molina Cruz'),
('Isabel Ortega Peña'),
('Antonio Castro Rivas'),
('Lucía Herrera Campos'),
('Francisco Márquez León'),
('Sara Vázquez Fuentes'),
('David Medina Paredes'),
('Patricia Aguilar Blanco');

-- Introduzco 5 cursos para poder hacer pruebas
INSERT INTO cursos (nombre) VALUES
('Matemáticas Avanzadas'),
('Física Cuántica'),
('Historia del Arte'),
('Programación en Python'),
('Economía Internacional');

-- Introduzco aletoriamente los 20 alumnos en un curso
INSERT INTO inscripciones (id_estudiante, id_curso, fecha_inscripcion) VALUES
(1, 1, '2024-12-01'),
(2, 2, '2024-11-15'),
(3, 3, '2024-10-10'),
(4, 4, '2024-09-25'),
(5, 5, '2024-08-30'),
(6, 1, '2024-07-18'),
(7, 2, '2024-06-20'),
(8, 3, '2024-05-10'),
(9, 4, '2024-04-15'),
(10, 5, '2024-03-25'),
(11, 1, '2024-02-10'),
(12, 2, '2024-01-30'),
(13, 3, '2024-01-05'),
(14, 4, '2023-12-20'),
(15, 5, '2023-11-10'),
(16, 1, '2023-10-05'),
(17, 2, '2023-09-15'),
(18, 3, '2023-08-25'),
(19, 4, '2023-07-30'),
(20, 5, '2023-06-10');

-- Genero una consulta para filtrar los alunos por curso
SELECT e.nombre AS estudiante, c.nombre AS curso
FROM estudiantes e
JOIN inscripciones i ON e.id = i.id_estudiante
JOIN cursos c ON i.id_curso = c.id
ORDER BY c.nombre ASC, e.nombre ASC;


/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    2.	Diseña un esquema de base de datos para un sistema de gestión de empleados y departamentos
    con una relación uno a muchos.
*/

CREATE DATABASE empersa;
USE empresa;

-- Tabla de Departamentos
CREATE TABLE departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,              -- Identificador único del departamento
    nombre VARCHAR(100) NOT NULL                    -- Nombre del departamento
);

-- Tabla de Empleados
CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,              -- Identificador único del empleado
    nombre VARCHAR(100) NOT NULL,                   -- Nombre del empleado
    apellido VARCHAR(100) NOT NULL,                 -- Apellido del empleado
    id_departamento INT,                            -- Clave foránea que hace referencia a la tabla departamentos
    FOREIGN KEY (id_departamento)                   -- Relación con la tabla departamentos
    REFERENCES departamentos(id) ON DELETE CASCADE  -- Si el departamento se elimina, los empleados también
);

-- Creamos departamentos varios
INSERT INTO departamentos (nombre) VALUES
('Recursos Humanos'),
('Tecnologías de la Información'),
('Marketing'),
('Ventas'),
('Finanzas'),
('Investigación y Desarrollo'),
('Atención al Cliente'),
('Logística'),
('Producción'),
('Legal');

-- Creamos empleados varios
INSERT INTO empleados (nombre, apellido, id_departamento) VALUES
('Juan', 'Pérez', 1),
('María', 'González', 2),
('Carlos', 'Martínez', 3),
('Ana', 'López', 4),
('Luis', 'Sánchez', 5),
('Marta', 'Ramírez', 6),
('José', 'Torres', 7),
('Laura', 'Hernández', 8),
('Pedro', 'Flores', 9),
('Elena', 'Rodríguez', 10),
('Miguel', 'Navarro', 1),
('Carmen', 'Ramos', 2),
('Javier', 'Molina', 3),
('Isabel', 'Ortega', 4),
('Antonio', 'Castro', 5),
('Lucía', 'Herrera', 6),
('Francisco', 'Márquez', 7),
('Sara', 'Vázquez', 8),
('David', 'Medina', 9),
('Patricia', 'Aguilar', 10),
('Juan', 'Ruiz', 1),
('Ana', 'Gómez', 2),
('Luis', 'Martín', 3),
('María', 'Fernández', 4),
('Carlos', 'García', 5),
('Laura', 'Díaz', 6),
('José', 'Pérez', 7),
('Marta', 'Serrano', 8),
('Javier', 'González', 9),
('Elena', 'Martínez', 10),
('Miguel', 'Vega', 1),
('Carmen', 'Sánchez', 2),
('Javier', 'Romero', 3),
('Isabel', 'Jiménez', 4),
('Antonio', 'Ruiz', 5),
('Lucía', 'Pérez', 6),
('Francisco', 'González', 7),
('Sara', 'Moreno', 8),
('David', 'Torres', 9),
('Patricia', 'López', 10),
('Juan', 'Gómez', 1),
('Ana', 'Fernández', 2),
('Luis', 'García', 3),
('María', 'Pérez', 4),
('Carlos', 'Torres', 5),
('Laura', 'Molina', 6),
('José', 'Romero', 7),
('Marta', 'Sánchez', 8),
('Javier', 'Vázquez', 9),
('Elena', 'Serrano', 10);

-- Creo una consulta para listarlos por departamento
SELECT d.nombre AS departamento, e.nombre AS nombre, e.apellido
FROM empleados e
JOIN departamentos d ON e.id_departamento = d.id
ORDER BY d.nombre ASC, e.nombre ASC;


/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Crea las tablas necesarias para un sistema de hospital
    donde cada paciente tenga un historial médico único (relación 1:1).
*/

-- Tabla de pacientes
CREATE TABLE pacientes (
    id INT AUTO_INCREMENT PRIMARY KEY,        -- Identificador único del paciente
    nombre VARCHAR(100) NOT NULL,              -- Nombre del paciente
    apellido VARCHAR(100) NOT NULL,            -- Apellido del paciente
    fecha_nacimiento DATE NOT NULL,            -- Fecha de nacimiento del paciente
    direccion VARCHAR(255),                    -- Dirección del paciente
    telefono VARCHAR(15),                      -- Teléfono de contacto
    email VARCHAR(100)                         -- Correo electrónico
);

-- Tabla de los historiales médicos
CREATE TABLE historial_medico (
    id INT AUTO_INCREMENT PRIMARY KEY,        -- Identificador único del historial médico
    id_paciente INT,                          -- Clave foránea que hace referencia al paciente
    diagnostico TEXT,                         -- Diagnóstico médico del paciente
    tratamiento TEXT,                         -- Tratamiento recomendado
    fecha_visita DATE,                        -- Fecha de la última visita médica
    notas TEXT,                               -- Notas adicionales sobre el paciente
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id) ON DELETE CASCADE  -- Relación con la tabla pacientes
);

-- Datos aleatorios de pacientes (Gracias, chatGPT)
INSERT INTO pacientes (nombre, apellido, fecha_nacimiento, direccion, telefono, email) VALUES
('Juan', 'Pérez', '1980-05-15', 'Calle Ficticia 123, Madrid', '612345678', 'juan.perez@email.com'),
('María', 'González', '1990-08-25', 'Avenida de la Paz 45, Barcelona', '612345679', 'maria.gonzalez@email.com'),
('Carlos', 'Martínez', '1975-12-02', 'Calle Real 789, Sevilla', '612345680', 'carlos.martinez@email.com'),
('Ana', 'López', '1985-03-10', 'Plaza Mayor 123, Valencia', '612345681', 'ana.lopez@email.com'),
('Luis', 'Sánchez', '1995-07-21', 'Calle del Sol 56, Bilbao', '612345682', 'luis.sanchez@email.com'),
('Marta', 'Ramírez', '1992-10-18', 'Calle de los Olivos 34, Zaragoza', '612345683', 'marta.ramirez@email.com'),
('José', 'Torres', '1987-11-03', 'Avenida de Europa 80, Madrid', '612345684', 'jose.torres@email.com'),
('Laura', 'Hernández', '1989-04-27', 'Calle Mayor 44, Alicante', '612345685', 'laura.hernandez@email.com'),
('Pedro', 'Flores', '1993-09-15', 'Calle Luna 12, Málaga', '612345686', 'pedro.flores@email.com'),
('Elena', 'Rodríguez', '1982-01-22', 'Calle del Río 67, Salamanca', '612345687', 'elena.rodriguez@email.com'),
('Miguel', 'Navarro', '1988-02-05', 'Avenida Libertad 89, Cádiz', '612345688', 'miguel.navarro@email.com'),
('Carmen', 'Ramos', '1994-06-12', 'Calle Vía 23, Valencia', '612345689', 'carmen.ramos@email.com'),
('Javier', 'Molina', '1996-03-30', 'Calle León 90, Valladolid', '612345690', 'javier.molina@email.com'),
('Isabel', 'Ortega', '1983-11-16', 'Calle del Mar 15, Bilbao', '612345691', 'isabel.ortega@email.com'),
('Antonio', 'Castro', '1984-07-10', 'Plaza Mayor 87, Sevilla', '612345692', 'antonio.castro@email.com'),
('Lucía', 'Herrera', '1997-02-02', 'Calle Puente 4, Madrid', '612345693', 'lucia.herrera@email.com'),
('Francisco', 'Márquez', '1986-09-05', 'Avenida de Castilla 21, Zaragoza', '612345694', 'francisco.marquez@email.com'),
('Sara', 'Vázquez', '1991-04-20', 'Calle del Sol 39, Alicante', '612345695', 'sara.vazquez@email.com'),
('David', 'Medina', '1998-11-30', 'Calle Real 72, Bilbao', '612345696', 'david.medina@email.com'),
('Patricia', 'Aguilar', '1981-05-28', 'Calle Larga 99, Valencia', '612345697', 'patricia.aguilar@email.com'),
('Juan', 'Ruiz', '1992-01-18', 'Calle del Carmen 55, Sevilla', '612345698', 'juan.ruiz@email.com'),
('Ana', 'Gómez', '1994-03-22', 'Calle Alta 38, Barcelona', '612345699', 'ana.gomez@email.com'),
('Luis', 'Martín', '1986-06-12', 'Calle de la Luna 24, Madrid', '612345700', 'luis.martin@email.com'),
('María', 'Fernández', '1980-09-04', 'Calle Despacho 49, Valencia', '612345701', 'maria.fernandez@email.com'),
('Carlos', 'García', '1995-10-25', 'Avenida de los Naranjos 56, Bilbao', '612345702', 'carlos.garcia@email.com'),
('Laura', 'Díaz', '1991-11-17', 'Plaza de la Virgen 13, Salamanca', '612345703', 'laura.diaz@email.com'),
('José', 'Pérez', '1989-04-03', 'Calle San José 16, Cádiz', '612345704', 'jose.perez@email.com'),
('Marta', 'Serrano', '1993-07-08', 'Calle del Prado 10, Zaragoza', '612345705', 'marta.serrano@email.com'),
('Javier', 'González', '1997-02-19', 'Calle del Sol 18, Alicante', '612345706', 'javier.gonzalez@email.com'),
('Elena', 'Martínez', '1984-12-12', 'Calle del Río 42, Bilbao', '612345707', 'elena.martinez@email.com'),
('Miguel', 'Vega', '1996-11-21', 'Avenida la Paz 32, Madrid', '612345708', 'miguel.vega@email.com'),
('Carmen', 'Sánchez', '1985-10-09', 'Calle San Antonio 27, Salamanca', '612345709', 'carmen.sanchez@email.com'),
('Javier', 'Romero', '1982-09-14', 'Calle Mayor 15, Valencia', '612345710', 'javier.romero@email.com'),
('Isabel', 'Jiménez', '1992-06-11', 'Plaza de España 22, Zaragoza', '612345711', 'isabel.jimenez@email.com'),
('Antonio', 'Ruiz', '1980-07-02', 'Calle el Sol 31, Madrid', '612345712', 'antonio.ruiz@email.com'),
('Lucía', 'Pérez', '1993-04-04', 'Avenida Libertad 51, Alicante', '612345713', 'lucia.perez@email.com'),
('Francisco', 'González', '1991-05-05', 'Calle del Mar 88, Cádiz', '612345714', 'francisco.gonzalez@email.com'),
('Sara', 'Moreno', '1987-01-13', 'Calle Real 26, Barcelona', '612345715', 'sara.moreno@email.com'),
('David', 'Torres', '1990-03-07', 'Calle Alta 45, Valencia', '612345716', 'david.torres@email.com'),
('Patricia', 'López', '1983-09-20', 'Calle León 63, Madrid', '612345717', 'patricia.lopez@email.com'),
('Juan', 'Gómez', '1996-10-10', 'Calle del Sol 99, Sevilla', '612345718', 'juan.gomez@email.com'),
('Ana', 'Fernández', '1989-05-25', 'Avenida la Paz 67, Zaragoza', '612345719', 'ana.fernandez@email.com'),
('Luis', 'García', '1988-11-12', 'Calle del Río 90, Barcelona', '612345720', 'luis.garcia@email.com'),
('María', 'Pérez', '1995-04-17', 'Plaza Mayor 21, Valencia', '612345721', 'maria.perez@email.com'),
('Carlos', 'Torres', '1990-06-04', 'Calle de la Loma 18, Madrid', '612345722', 'carlos.torres@email.com'),
('Laura', 'Molina', '1991-09-29', 'Calle del Sol 34, Bilbao', '612345723', 'laura.molina@email.com'),
('José', 'Romero', '1985-03-12', 'Calle Real 71, Alicante', '612345724', 'jose.romero@email.com'),
('Marta', 'Sánchez', '1993-05-20', 'Avenida de los Naranjos 45, Sevilla', '612345725', 'marta.sanchez@email.com'),
('Javier', 'Vázquez', '1992-08-14', 'Calle Alta 66, Madrid', '612345726', 'javier.vazquez@email.com'),
('Elena', 'Serrano', '1987-12-29', 'Calle León 54, Zaragoza', '612345727', 'elena.serrano@email.com');

-- Datos aleatorios para los historias (Gracias otra vez, ChatGPT)
INSERT INTO historial_medico (id_paciente, diagnostico, tratamiento, fecha_visita, notas) VALUES
(1, 'Dolor en el pecho', 'Exámenes cardíacos', '2025-02-15', 'Se recomienda seguimiento en 6 meses.'),
(2, 'Migraña crónica', 'Analgésicos y descanso', '2025-01-20', 'Requiere control regular.'),
(3, 'Tensión alta', 'Medicamentos antihipertensivos', '2024-12-10', 'Requiere control mensual.'),
(4, 'Problemas digestivos', 'Dieta especial y medicación', '2025-01-15', 'Debe evitar ciertos alimentos.'),
(5, 'Fractura en el brazo', 'Reposo y fisioterapia', '2025-02-10', 'Recuperación esperada en 2 meses.'),
(6, 'Resfriado severo', 'Antibióticos y descanso', '2025-02-12', 'Se recomienda reposo completo.'),
(7, 'Infección urinaria', 'Antibióticos', '2025-01-05', 'Mejora notable tras tratamiento.'),
(8, 'Dolor lumbar', 'Terapia física y analgésicos', '2025-02-09', 'Se sugiere evitar esfuerzos físicos.'),
(9, 'Fatiga crónica', 'Cambio de dieta y descanso', '2025-01-18', 'Se recomienda reducción de estrés.'),
(10, 'Hipotiroidismo', 'Terapia con hormona tiroidea', '2025-02-01', 'Control regular de niveles.'),
(11, 'Alergias estacionales', 'Antihistamínicos', '2025-01-23', 'Mantener medicación preventiva.'),
(12, 'Neumonía', 'Antibióticos intravenosos', '2025-01-08', 'Recuperación satisfactoria, seguimiento necesario.'),
(13, 'Gripe', 'Reposo y tratamiento antiviral', '2025-02-03', 'Se espera mejoría en 1 semana.'),
(14, 'Asma', 'Inhaladores y control de alergias', '2025-01-25', 'Se sugiere evitar alérgenos.'),
(15, 'Colitis', 'Medicamentos antiinflamatorios', '2025-01-28', 'Evitar alimentos picantes y grasos.'),
(16, 'Depresión', 'Terapia cognitiva y antidepresivos', '2025-02-05', 'Mejoría progresiva, seguimiento psicológico.'),
(17, 'Dolor de cabeza', 'Analgésicos y descanso', '2025-01-17', 'Controlado, pero se recomienda chequeo en 3 meses.'),
(18, 'Insomnio', 'Melatonina y relajación', '2025-02-06', 'Recuperación gradual, con cambios en hábitos.'),
(19, 'Artritis', 'Medicamentos antiinflamatorios', '2025-01-21', 'Requiere fisioterapia regular.'),
(20, 'Estrés', 'Terapia y reducción de carga laboral', '2025-02-08', 'Recomendación de ejercicios de relajación.'),
(21, 'Cálculos renales', 'Medicamentos y cirugía menor', '2025-01-10', 'Seguimiento necesario para evitar nuevas formaciones.'),
(22, 'Ulceras estomacales', 'Antibióticos y dieta especial', '2025-02-13', 'Dieta suave recomendada.'),
(23, 'Desnutrición', 'Suplementos nutricionales y seguimiento', '2025-01-18', 'Se requiere una dieta balanceada.'),
(24, 'Faringitis', 'Antibióticos y reposo', '2025-02-02', 'Recuperación en proceso.'),
(25, 'Hipertensión', 'Medicamentos antihipertensivos', '2025-01-30', 'Controlar el nivel de sal en la dieta.'),
(26, 'Anemia', 'Suplementos de hierro', '2025-01-22', 'Se requiere seguimiento sanguíneo regular.'),
(27, 'Gastritis', 'Inhibidores de ácido gástrico', '2025-01-14', 'Dieta baja en grasas recomendada.'),
(28, 'Tinnitus', 'Recomendaciones auditivas y descanso', '2025-02-07', 'Mejora con tratamiento, pero persiste.'),
(29, 'Esquizofrenia', 'Medicamentos antipsicóticos', '2025-01-19', 'Terapia regular y control médico.'),
(30, 'Sinusitis', 'Antibióticos y descongestionantes', '2025-02-01', 'Mejoría significativa con tratamiento.'),
(31, 'Eczema', 'Crema tópica y antihistamínicos', '2025-01-29', 'Evitar el contacto con productos irritantes.'),
(32, 'Cáncer de piel', 'Tratamiento quirúrgico y radioterapia', '2025-02-14', 'Seguimiento constante necesario.'),
(33, 'Hepatitis A', 'Reposo y dieta especial', '2025-01-15', 'Se espera recuperación total en 3 meses.'),
(34, 'Migraña', 'Medicamentos para aliviar dolores', '2025-02-04', 'Controlado, pero se recomienda evitar estrés.'),
(35, 'Problemas de visión', 'Lentes y cirugía láser', '2025-01-28', 'Revisión periódica para evaluar progreso.'),
(36, 'Toxoplasmosis', 'Antibióticos', '2025-02-09', 'Seguimiento necesario para evitar recaídas.'),
(37, 'Fobia social', 'Terapia cognitiva y antidepresivos', '2025-01-13', 'Mejora tras sesiones de terapia.'),
(38, 'Esclerosis múltiple', 'Medicamentos inmunosupresores', '2025-01-10', 'Seguimiento constante necesario.'),
(39, 'Endometriosis', 'Cirugía y tratamiento hormonal', '2025-01-05', 'Tratamiento efectivo, seguimiento recomendado.'),
(40, 'Cardiopatía', 'Medicamentos cardiológicos', '2025-01-22', 'Controlar la dieta y el ejercicio.'),
(41, 'Diabetes tipo 2', 'Insulina y dieta controlada', '2025-01-08', 'Seguimiento de niveles de azúcar requerido.'),
(42, 'Psoriasis', 'Tratamiento tópico y fototerapia', '2025-02-11', 'Episodios bajo control, seguir tratamiento preventivo.'),
(43, 'Reflujo gástrico', 'Inhibidores de ácido', '2025-02-12', 'Evitar comidas pesadas por la noche.'),
(44, 'Fibromialgia', 'Analgésicos y terapia física', '2025-01-06', 'Terapia de relajación recomendada.'),
(45, 'Trombosis', 'Anticoagulantes', '2025-01-27', 'Requiere control de la circulación sanguínea.'),
(46, 'Bronquitis', 'Antibióticos y expectorantes', '2025-02-01', 'Recuperación en proceso, mantener reposo.'),
(47, 'Lumbalgia', 'Fisioterapia y analgésicos', '2025-02-05', 'Se recomienda evitar el levantamiento de pesas.'),
(48, 'Apendicitis', 'Cirugía de apendicectomía', '2025-01-18', 'Recuperación satisfactoria post-cirugía.'),
(49, 'Dermatitis', 'Crema corticoide', '2025-01-24', 'Se recomienda evitar irritantes externos.'),
(50, 'Cáncer de mama', 'Quimioterapia y cirugía', '2025-01-31', 'Seguimiento continuo con oncología.');

-- Genero una consulta para saber cuantos pacientes tienen cancer
SELECT p.id AS paciente_id, p.nombre AS paciente_nombre, h.diagnostico, h.tratamiento, h.fecha_visita, h.notas
FROM pacientes p
JOIN historial_medico h ON p.id = h.id_paciente
WHERE h.diagnostico LIKE '%cáncer%';





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
   Implementa una base de datos para una biblioteca donde los libros
   puedan ser prestados a múltiples usuarios (relación M:N).
*/

CREATE DATABASE biblioteca;
USE biblioteca;

-- Crear tabla de libros
CREATE TABLE libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    fecha_publicacion DATE,
    isbn VARCHAR(20) UNIQUE NOT NULL
);

-- Crear tabla de usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    direccion TEXT
);

-- Crear tabla de préstamos (relación M:N entre libros y usuarios)
CREATE TABLE prestamos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT,
    id_usuario INT,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    estado ENUM('prestado', 'devuelto', 'vencido') DEFAULT 'prestado',
    FOREIGN KEY (id_libro) REFERENCES libros(id) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- Libros de ejemplo
INSERT INTO libros (titulo, autor, fecha_publicacion, isbn) VALUES
('Cien años de soledad', 'Gabriel García Márquez', '1967-06-05', '978-3-16-148410-0'),
('Don Quijote de la Mancha', 'Miguel de Cervantes', '1605-01-16', '978-3-16-148411-7'),
('1984', 'George Orwell', '1949-06-08', '978-3-16-148412-4'),
('El gran Gatsby', 'F. Scott Fitzgerald', '1925-04-10', '978-3-16-148413-1'),
('Matar a un ruiseñor', 'Harper Lee', '1960-07-11', '978-3-16-148414-8');

-- Usuarios de ejemplo
INSERT INTO usuarios (nombre, email, telefono, direccion) VALUES
('Juan Pérez', 'juan.perez@email.com', '123456789', 'Calle Ficticia 123, Ciudad A'),
('María López', 'maria.lopez@email.com', '987654321', 'Avenida Real 456, Ciudad B'),
('Carlos Sánchez', 'carlos.sanchez@email.com', '555555555', 'Calle Ejemplo 789, Ciudad C'),
('Ana Gómez', 'ana.gomez@email.com', '666666666', 'Calle Famosa 101, Ciudad D'),
('Luis Díaz', 'luis.diaz@email.com', '444444444', 'Avenida Central 202, Ciudad E');

-- Préstamos de ejemplo
INSERT INTO prestamos (id_libro, id_usuario, fecha_prestamo, fecha_devolucion, estado) VALUES
(1, 1, '2025-02-01', '2025-02-15', 'prestado'),
(2, 1, '2025-02-03', '2025-02-17', 'prestado'),
(3, 2, '2025-01-20', '2025-02-03', 'devuelto'),
(4, 2, '2025-02-05', '2025-02-19', 'prestado'),
(5, 3, '2025-01-25', '2025-02-08', 'devuelto'),
(1, 4, '2025-02-10', '2025-02-24', 'prestado'),
(2, 5, '2025-02-12', '2025-02-26', 'prestado'),
(3, 4, '2025-02-01', '2025-02-15', 'prestado');

-- Ver todos los libros prestados a un usuario
SELECT l.titulo, l.autor, p.fecha_prestamo, p.fecha_devolucion, p.estado
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
WHERE p.id_usuario = 1;

-- Ver todos los usuarios que han tomado un libro en préstamo
SELECT u.nombre, u.email, p.fecha_prestamo, p.fecha_devolucion, p.estado
FROM prestamos p
JOIN usuarios u ON p.id_usuario = u.id
WHERE p.id_libro = 1;

-- Ver libros prestados que no han sido devueltos
SELECT l.titulo, l.autor, u.nombre, p.fecha_prestamo, p.fecha_devolucion
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN usuarios u ON p.id_usuario = u.id
WHERE p.estado = 'prestado';





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Diseña una base de datos para un supermercado en donde una factura pueda contener
    múltiples productos (relación 1:N).
*/

CREATE DATABASE supermercado;
USE supermercado;

-- Tabla para las facturas
CREATE TABLE IF NOT EXISTS facturas (
    factura_id INT AUTO_INCREMENT PRIMARY KEY,
    numero_factura VARCHAR(20) NOT NULL,
    fecha DATE NOT NULL
);

-- Tabla para los productos
CREATE TABLE IF NOT EXISTS productos (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    cantidad INT NOT NULL,
    factura_id INT,
    FOREIGN KEY (factura_id) REFERENCES facturas(factura_id) ON DELETE CASCADE
);

-- Insertar facturas
INSERT INTO facturas (numero_factura, fecha) VALUES
('FAC-001', '2025-02-20'),
('FAC-002', '2025-02-21');


-- Insertar productos
INSERT INTO productos (nombre, precio, cantidad, factura_id) VALUES
('Leche', 1.50, 2, 1),  -- Producto de la factura 1
('Pan', 0.80, 3, 1),    -- Producto de la factura 1
('Arroz', 2.50, 1, 2),  -- Producto de la factura 2
('Jugo', 1.20, 2, 2);   -- Producto de la factura 2

-- consulta
SELECT f.factura_id, f.fecha, p.nombre AS producto, p.precio, p.cantidad, (p.precio * p.cantidad) AS total_producto
FROM facturas f
JOIN productos p ON f.factura_id = p.factura_id
ORDER BY f.factura_id;

-- consulta para ver las facuras con total
SELECT f.numero_factura, f.fecha,
       SUM(p.precio * p.cantidad) AS total_factura
FROM facturas f
JOIN productos p ON f.factura_id = p.factura_id
GROUP BY f.factura_id;





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/*
    6.	Crea las tablas necesarias para gestionar empresas y sus sucursales con una relación de composición
    (cuando se borra una empresa, se eliminan sus sucursales).
*/

CREATE DATABASE

CREATE DATABASE empresa_con_sucursales:
USE empresa_con_sucursales;

-- Crear la tabla de empresas
CREATE TABLE empresas (
    id INT AUTO_INCREMENT PRIMARY KEY,              -- ID único para cada empresa
    nombre VARCHAR(255) NOT NULL,                   -- Nombre de la empresa
    direccion VARCHAR(255),                         -- Dirección de la empresa
    telefono VARCHAR(15)                            -- Teléfono de contacto de la empresa
);

-- Crear la tabla de sucursales
CREATE TABLE sucursales (
    id INT AUTO_INCREMENT PRIMARY KEY,              -- ID único para cada sucursal
    id_empresa INT,                                 -- ID de la empresa a la que pertenece la sucursal
    nombre VARCHAR(255) NOT NULL,                   -- Nombre de la sucursal
    direccion VARCHAR(255),                         -- Dirección de la sucursal
    telefono VARCHAR(15),                           -- Teléfono de contacto de la sucursal
    FOREIGN KEY (id_empresa) REFERENCES empresas(id)
        ON DELETE CASCADE                           -- Eliminación en cascada cuando se borra una empresa
        
);


-- Insertar una empresa
INSERT INTO empresas (nombre, direccion, telefono)
VALUES ('Empresa A', 'Calle Ficticia 123', '555-1234');

-- Insertar sucursales asociadas a la empresa A (id_empresa = 1)
INSERT INTO sucursales (id_empresa, nombre, direccion, telefono)
VALUES (1, 'Sucursal Centro', 'Av. Central 456', '555-5678'),
       (1, 'Sucursal Norte', 'Calle del Norte 789', '555-8765');

-- Eliminar una empresa y todas sus sucursales relacionadas
DELETE FROM empresas WHERE id_empresa = 1;





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    7.	Desarrolla una base de datos para gestionar aeropuertos y ciudades con una relación de agregación
    (una ciudad puede tener múltiples aeropuertos, pero los aeropuertos pueden existir sin la ciudad).
*/

CREATE DATABASE aviacion_civil;
USE aviacion_civil;

-- Crear la tabla de ciudades
CREATE TABLE ciudades (
    id_ciudad INT AUTO_INCREMENT PRIMARY KEY,       -- ID único para cada ciudad
    nombre VARCHAR(255) NOT NULL,                   -- Nombre de la ciudad
    pais VARCHAR(255),                              -- País donde está ubicada la ciudad
    poblacion INT                                   -- Población de la ciudad
);

-- Crear la tabla de aeropuertos
CREATE TABLE aeropuertos (
    id_aeropuerto INT AUTO_INCREMENT PRIMARY KEY,   -- ID único para cada aeropuerto
    id_ciudad INT,                                  -- ID de la ciudad a la que pertenece el aeropuerto (puede ser NULL)
    nombre VARCHAR(255) NOT NULL,                   -- Nombre del aeropuerto
    codigo_iata VARCHAR(3),                         -- Código IATA del aeropuerto
    direccion VARCHAR(255),                         -- Dirección del aeropuerto
    FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad) ON DELETE SET NULL
    -- Cuando se elimina una ciudad, se pone a NULL el id_ciudad de los aeropuertos
);

-- Insertar ciudades
INSERT INTO ciudades (nombre, pais, poblacion)
VALUES ('Ciudad A', 'País X', 5000000),
       ('Ciudad B', 'País Y', 1500000);

-- Insertar aeropuertos asociados a la ciudad A (id_ciudad = 1)
INSERT INTO aeropuertos (id_ciudad, nombre, codigo_iata, direccion)
VALUES (1, 'Aeropuerto Internacional A', 'AAA', 'Calle del Aeropuerto 123'),
       (1, 'Aeropuerto Nacional A', 'ANA', 'Calle Secundaria 456');

-- Insertar un aeropuerto sin ciudad asociada (id_ciudad = NULL)
INSERT INTO aeropuertos (id_ciudad, nombre, codigo_iata, direccion)
VALUES (NULL, 'Aeropuerto Independiente', 'AII', 'Calle Autónoma 789');

-- Eliminar la ciudad A (id_ciudad = 1)
DELETE FROM ciudades WHERE id_ciudad = 1;

-- Ver los aeropuertos
SELECT * FROM aeropuertos;





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Crea una base de datos para un sistema escolar donde cada profesor pueda impartir múltiples
    materias, y cada materia pueda ser impartida por varios profesores (relación M:N).
*/

CREATE DATABASE escuela;
USE escuela;

-- Tabla de profesores
CREATE TABLE profesores (
    profesor_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100),
    fecha_contratacion DATE
);

-- Tabla de materias (o asignaturas)
CREATE TABLE materias (
    materia_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla intermedia par la relación
CREATE TABLE  profesor_materia (
    profesor_id INT,
    materia_id INT,
    PRIMARY KEY (profesor_id, materia_id),
    FOREIGN KEY (profesor_id) REFERENCES profesores(profesor_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (materia_id) REFERENCES materias(materia_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Insertamos algunos profesores
INSERT INTO profesores (nombre, correo, fecha_contratacion) VALUES
('Juan Pérez', 'juan.perez@escuela.com', '2020-01-15'),
('María Gómez', 'maria.gomez@escuela.com', '2019-09-23');

-- Insertamos algunas materias
INSERT INTO materias (nombre) VALUES
('Matemáticas'),
('Lengua Española'),
('Historia'),
('Ciencias');

-- Asignamos materias a los profesores
INSERT INTO profesor_materia (profesor_id, materia_id) VALUES
(1, 1),  -- Juan Pérez enseña Matemáticas
(1, 2),  -- Juan Pérez enseña Lengua Española
(2, 3),  -- María Gómez enseña Historia
(2, 4);  -- María Gómez enseña Ciencias

-- Consulta de prueba para ver "la tabla intermedia" con valores de texto
SELECT p.nombre AS profesor, m.nombre AS materia
FROM profesores p
JOIN profesor_materia pm ON p.profesor_id = pm.profesor_id
JOIN materias m ON pm.materia_id = m.materia_id;





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Diseña una base de datos que registre países y sus respectivas
    provincias con una relación uno a muchos.
*/

CREATE DATABASE IF NOT EXISTS geografia;
USE geografia;

-- Tabla de países
CREATE TABLE IF NOT EXISTS paises (
    pais_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    capital VARCHAR(100),
    continente VARCHAR(100)
);

-- Tabla de provincias
CREATE TABLE IF NOT EXISTS provincias (
    provincia_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais_id INT,
    FOREIGN KEY (pais_id) REFERENCES paises(pais_id) ON DELETE CASCADE
);

-- Insertamos algunos países
INSERT INTO paises (nombre, capital, continente) VALUES
('México', 'Ciudad de México', 'América'),
('España', 'Madrid', 'Europa'),
('Argentina', 'Buenos Aires', 'América');

-- Insertamos algunas provincias
INSERT INTO provincias (nombre, pais_id) VALUES
('Jalisco', 1),  -- Jalisco pertenece a México
('Guadalajara', 1),  -- Guadalajara pertenece a México
('Buenos Aires', 3),  -- Buenos Aires pertenece a Argentina
-- Insertamos todas las provincias de España
('Álava', 2),
('Albacete', 2),
('Alicante', 2),
('Almería', 2),
('Asturias', 2),
('Ávila', 2),
('Badajoz', 2),
('Barcelona', 2),
('Burgos', 2),
('Cáceres', 2),
('Cádiz', 2),
('Cantabria', 2),
('Castellón', 2),
('Cataluña', 2),
('Ceuta', 2),
('Ciudad Real', 2),
('Córdoba', 2),
('La Coruña', 2),
('Cuenca', 2),
('Girona', 2),
('Granada', 2),
('Guadalajara', 2),
('Gipuzkoa', 2),
('Huelva', 2),
('Huesca', 2),
('Islas Baleares', 2),
('Jaén', 2),
('La Rioja', 2),
('Las Palmas', 2),
('León', 2),
('Lleida', 2),
('Lugo', 2),
('Madrid', 2),
('Málaga', 2),
('Melilla', 2),
('Murcia', 2),
('Navarra', 2),
('Ourense', 2),
('Palencia', 2),
('Pontevedra', 2),
('Salamanca', 2),
('Santa Cruz de Tenerife', 2),
('Segovia', 2),
('Sevilla', 2),
('Soria', 2),
('Tarragona', 2),
('Teruel', 2),
('Toledo', 2),
('Valencia', 2),
('Valladolid', 2),
('Vizcaya', 2),
('Zamora', 2),
('Zaragoza', 2);


-- consulta para ver la relación
SELECT p.nombre AS pais, pr.nombre AS provincia
FROM paises p
JOIN provincias pr ON p.pais_id = pr.pais_id;

-- consulta para ver sólo las de España
SELECT pr.nombre AS provincia
FROM provincias pr
JOIN paises p ON pr.pais_id = p.pais_id
WHERE p.nombre = 'España';





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Crea una base de datos para gestionar compañías de transporte,
    donde cada autobús pertenece a una empresa, y cada empresa puede
    tener múltiples autobuses (relación 1:N).
*/

CREATE DATABASE IF NOT EXISTS transporte;
USE transporte;

-- Tabla de la empresa
CREATE TABLE IF NOT EXISTS empresas (
    empresa_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

-- Tabla Autobuses
CREATE TABLE IF NOT EXISTS autobuses (
    autobus_id INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(100),
    capacidad INT,
    matricula VARCHAR(15),
    empresa_id INT,
    FOREIGN KEY (empresa_id) REFERENCES empresas(empresa_id) ON DELETE CASCADE
);

-- Insertamos algunas empresas
INSERT INTO empresas (nombre, direccion, telefono) VALUES
('Transporte Rápido S.A.', 'Av. Libertador 1234, Buenos Aires', '011-12345678'),
('Autobuses del Sol', 'Calle 45, Madrid', '915-987654'),
('Viajes Express', 'Av. Constitución 567, Barcelona', '932-112233');

-- Insertar Autobuses
INSERT INTO autobuses (modelo, capacidad, matricula, empresa_id) VALUES
('Mercedes-Benz Sprinter', 30, '1234ABC', 1),       -- Autobús de Transporte Rápido S.A.
('Scania Irizar', 50, '5678DEF', 1),                -- Autobús de Transporte Rápido S.A.
('Volvo 9700', 40, '2345GHI', 2),                   -- Autobús de Autobuses del Sol
('MAN Lions Coach', 60, '6789JKL', 3);              -- Autobús de Viajes Express

-- Consulta de prueba
SELECT a.modelo AS autobus, a.capacidad, a.matricula, e.nombre AS empresa
FROM autobuses a
JOIN empresas e ON a.empresa_id = e.empresa_id;





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Crea una base de datos para gestionar un sistema de alquiler de vehículos donde los
    clientes puedan reservar distintos modelos de autos
*/

CREATE DATABASE IF NOT EXISTS alquiler_vehiculos;
USE alquiler_vehiculos;

-- Tabla clientes
CREATE TABLE IF NOT EXISTS clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla con los modelos de coches
CREATE TABLE IF NOT EXISTS modelos (
    modelo_id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    nombre_modelo VARCHAR(100) NOT NULL,
    anio INT NOT NULL,
    color VARCHAR(30),  -- Ahora el color pertenece al modelo, no al vehículo
    descripcion TEXT
);

-- Vehículos
CREATE TABLE IF NOT EXISTS vehiculos (
    vehiculo_id INT AUTO_INCREMENT PRIMARY KEY,
    modelo_id INT,
    matricula VARCHAR(15) NOT NULL UNIQUE,
    estado ENUM('Disponible', 'Reservado', 'Mantenimiento') DEFAULT 'Disponible',
    FOREIGN KEY (modelo_id) REFERENCES modelos(modelo_id) ON DELETE CASCADE
);

-- Reservas
CREATE TABLE IF NOT EXISTS reservas (
    reserva_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    vehiculo_id INT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado ENUM('Confirmada', 'Cancelada', 'Completada') DEFAULT 'Confirmada',
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id) ON DELETE CASCADE,
    FOREIGN KEY (vehiculo_id) REFERENCES vehiculos(vehiculo_id) ON DELETE CASCADE
);

-- Insertar modelos de vehículos
INSERT INTO modelos (marca, nombre_modelo, anio, color, descripcion) VALUES
('Ford', 'Focus', 2020, 'Azul', 'Vehículo compacto, ideal para la ciudad y viajes cortos.'),
('Ford', 'Fiesta', 2020, 'Rojo', 'Auto subcompacto, de bajo consumo y excelente maniobrabilidad.'),
('Ford', 'Mondeo', 2020, 'Negro', 'Sedán familiar de gran confort y tecnología avanzada.'),
('Seat', 'Ibiza', 2020, 'Blanco', 'Vehículo compacto, moderno y eficiente en consumo de combustible.'),
('Seat', 'León', 2020, 'Gris', 'Auto de gama media, con diseño deportivo y cómodo interior.'),
('Seat', 'Ateca', 2020, 'Verde', 'SUV compacto, ideal para viajes largos y terrenos irregulares.'),
('Peugeot', '208', 2020, 'Amarillo', 'Coche urbano, pequeño y ágil con tecnología moderna.'),
('Peugeot', '308', 2020, 'Plata', 'Vehículo de gama media, cómodo y con buena relación calidad-precio.'),
('Peugeot', '3008', 2020, 'Azul', 'SUV con diseño elegante y alto rendimiento en carretera.');

-- Insertar vehículos correspondientes a los modelos
INSERT INTO vehiculos (modelo_id, matricula, estado) VALUES
(1, 'ABC1234', 'Disponible'),  -- Ford Focus
(2, 'XYZ5678', 'Disponible'),  -- Ford Fiesta
(3, 'DEF4321', 'Disponible'),  -- Ford Mondeo
(4, 'GHI8765', 'Disponible'),  -- Seat Ibiza
(5, 'JKL6543', 'Disponible'),  -- Seat León
(6, 'MNO3210', 'Disponible'),  -- Seat Ateca
(7, 'PQR9087', 'Disponible'),  -- Peugeot 208
(8, 'STU4567', 'Disponible'),  -- Peugeot 308
(9, 'VWX2345', 'Disponible');  -- Peugeot 3008

-- Consulta e prueba
SELECT modelo_id, marca, nombre_modelo, anio, color, descripcion FROM modelos;

-- Vehículos con su modelo asociado
SELECT v.vehiculo_id, v.matricula, m.marca, m.nombre_modelo, v.estado
FROM vehiculos v
JOIN modelos m ON v.modelo_id = m.modelo_id;





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Diseña un esquema de base de datos para un sistema de gestión de
    pedidos en una tienda en línea, donde se registren clientes y sus compras.
*/

CREATE DATABASE IF NOT EXISTS tienda_online;
USE tienda_online;

-- Tabla clientes
CREATE TABLE IF NOT EXISTS clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de productos
CREATE TABLE IF NOT EXISTS productos (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

-- Tabla de pedidos
CREATE TABLE IF NOT EXISTS pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fecha_pedido DATE NOT NULL,
    estado ENUM('Pendiente', 'Confirmado', 'Enviado', 'Entregado', 'Cancelado') DEFAULT 'Pendiente',
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id) ON DELETE CASCADE
);

-- Tabla intermedia para la relación
CREATE TABLE IF NOT EXISTS detalle_pedidos (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id) ON DELETE CASCADE
);

-- Datos de ejemplo
INSERT INTO clientes (nombre, direccion, telefono, email) VALUES
('Juan Pérez', 'Calle Falsa 123', '612345678', 'juanperez@email.com'),
('Ana Gómez', 'Avenida Real 456', '612987654', 'anagomez@email.com');

INSERT INTO productos (nombre_producto, descripcion, precio, stock) VALUES
('Camiseta', 'Camiseta de algodón, color azul', 10.00, 100),
('Pantalón', 'Pantalón de mezclilla, color negro', 25.00, 50),
('Zapatos', 'Zapatos deportivos, talla 42', 50.00, 30);

-- Pedido 1 (Cliente 1)
INSERT INTO pedidos (cliente_id, fecha_pedido, estado) VALUES
(1, '2025-02-20', 'Confirmado');

-- Pedido 2 (Cliente 2)
INSERT INTO pedidos (cliente_id, fecha_pedido, estado) VALUES
(2, '2025-02-21', 'Pendiente');

-- Detalles del Pedido 1
INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio) VALUES
(1, 1, 2, 10.00),  -- 2 camisetas
(1, 2, 1, 25.00);  -- 1 pantalón

-- Detalles del Pedido 2
INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio) VALUES
(2, 3, 1, 50.00);  -- 1 par de zapatos

-- Consultar todos los pedidos de un cliente con detalles de productos:
SELECT p.pedido_id, p.fecha_pedido, p.estado, prod.nombre_producto, dp.cantidad, dp.precio
FROM pedidos p
JOIN detalle_pedidos dp ON p.pedido_id = dp.pedido_id
JOIN productos prod ON dp.producto_id = prod.producto_id
WHERE p.cliente_id = 1;

-- Consultar el total de un pedido (suma del precio por la cantidad de productos):
SELECT p.pedido_id, SUM(dp.cantidad * dp.precio) AS total_pedido
FROM pedidos p
JOIN detalle_pedidos dp ON p.pedido_id = dp.pedido_id
WHERE p.pedido_id = 1
GROUP BY p.pedido_id;





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Crea las tablas necesarias para un sistema de gestión de hoteles,
    donde se almacene la información de habitaciones y huéspedes.
*/

CREATE DATABASE IF NOT EXISTS gestion_hotel;
USE gestion_hotel;

-- Tabla de habitaciones
CREATE TABLE IF NOT EXISTS habitaciones (
    habitacion_id INT AUTO_INCREMENT PRIMARY KEY,
    numero_habitacion VARCHAR(10) NOT NULL UNIQUE,
    tipo ENUM('Individual', 'Doble', 'Suite', 'Triple') NOT NULL,
    capacidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

-- Tabla de huéspedes
CREATE TABLE IF NOT EXISTS huespedes (
    huesped_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    documento_identidad VARCHAR(50) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de reservas
CREATE TABLE IF NOT EXISTS reservas (
    reserva_id INT AUTO_INCREMENT PRIMARY KEY,
    huesped_id INT,
    habitacion_id INT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    FOREIGN KEY (huesped_id) REFERENCES huespedes(huesped_id) ON DELETE CASCADE,
    FOREIGN KEY (habitacion_id) REFERENCES habitaciones(habitacion_id) ON DELETE CASCADE
);

-- Datos de ejemplo
INSERT INTO habitaciones (numero_habitacion, tipo, capacidad, precio) VALUES
('101', 'Individual', 1, 50.00),
('102', 'Doble', 2, 80.00),
('103', 'Suite', 3, 150.00),
('201', 'Triple', 3, 120.00);

INSERT INTO huespedes (nombre, apellido, documento_identidad, telefono, email) VALUES
('Juan', 'Pérez', '12345678A', '612345678', 'juanperez@email.com'),
('Ana', 'Gómez', '23456789B', '612987654', 'anagomez@email.com'),
('Luis', 'Martínez', '34567890C', '613456789', 'luismartinez@email.com');

-- Reserva 1: Juan Pérez en la habitación 101
INSERT INTO reservas (huesped_id, habitacion_id, fecha_inicio, fecha_fin) VALUES
(1, 1, '2025-03-01', '2025-03-05');

-- Reserva 2: Ana Gómez en la habitación 102
INSERT INTO reservas (huesped_id, habitacion_id, fecha_inicio, fecha_fin) VALUES
(2, 2, '2025-03-02', '2025-03-07');

-- Reserva 3: Luis Martínez en la habitación 103
INSERT INTO reservas (huesped_id, habitacion_id, fecha_inicio, fecha_fin) VALUES
(3, 3, '2025-03-03', '2025-03-08');

-- Consultar todas las reservas de un huésped:
SELECT r.reserva_id, h.nombre AS nombre_huesped, ha.numero_habitacion, r.fecha_inicio, r.fecha_fin
FROM reservas r
JOIN huespedes h ON r.huesped_id = h.huesped_id
JOIN habitaciones ha ON r.habitacion_id = ha.habitacion_id
WHERE h.huesped_id = 1;  -- Cambia el ID para consultar otro huésped

-- Consultar la disponibilidad de una habitación en un rango de fechas:
SELECT ha.numero_habitacion, ha.tipo, ha.capacidad, ha.precio
FROM habitaciones ha
WHERE ha.habitacion_id NOT IN (
    SELECT r.habitacion_id
    FROM reservas r
    WHERE (r.fecha_inicio <= '2025-03-05' AND r.fecha_fin >= '2025-03-01')
);





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Implementa una base de datos para un gimnasio,
    donde se administren socios, entrenadores y las clases en las que participan.
*/

CREATE DATABASE IF NOT EXISTS gimnasio;
USE gimnasio;

-- Tabla de socios
CREATE TABLE IF NOT EXISTS socios (
    socio_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    telefono VARCHAR(15),
    email VARCHAR(100) NOT NULL UNIQUE,
    fecha_registro DATE NOT NULL
);

-- Tabla de entrenadores
CREATE TABLE IF NOT EXISTS entrenadores (
    entrenador_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    telefono VARCHAR(15),
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de clases
CREATE TABLE IF NOT EXISTS clases (
    clase_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_clase VARCHAR(100) NOT NULL,
    tipo_clase VARCHAR(50) NOT NULL,
    horario TIME NOT NULL,
    duracion INT NOT NULL -- Duración de la clase en minutos
);

-- Tabla de inscripciones
CREATE TABLE IF NOT EXISTS inscripciones (
    inscripcion_id INT AUTO_INCREMENT PRIMARY KEY,
    socio_id INT,
    clase_id INT,
    fecha_inscripcion DATE NOT NULL,
    FOREIGN KEY (socio_id) REFERENCES socios(socio_id) ON DELETE CASCADE,
    FOREIGN KEY (clase_id) REFERENCES clases(clase_id) ON DELETE CASCADE
);

-- Tabla de entrenadores por clase
CREATE TABLE IF NOT EXISTS entrenadores_clases (
    entrenador_id INT,
    clase_id INT,
    PRIMARY KEY (entrenador_id, clase_id),
    FOREIGN KEY (entrenador_id) REFERENCES entrenadores(entrenador_id) ON DELETE CASCADE,
    FOREIGN KEY (clase_id) REFERENCES clases(clase_id) ON DELETE CASCADE
);

-- Datos de ejemplo
INSERT INTO socios (nombre, apellido, fecha_nacimiento, telefono, email, fecha_registro) VALUES
('Carlos', 'Gómez', '1990-05-15', '612345678', 'carlos@email.com', '2025-02-15'),
('Laura', 'Pérez', '1985-07-22', '612987654', 'laura@email.com', '2025-02-16');

INSERT INTO entrenadores (nombre, apellido, especialidad, telefono, email) VALUES
('Pedro', 'Sánchez', 'Fitness', '613456789', 'pedro@email.com'),
('María', 'López', 'Yoga', '614567890', 'maria@email.com');

INSERT INTO clases (nombre_clase, tipo_clase, horario, duracion) VALUES
('Zumba', 'Cardio', '10:00:00', 60),
('Yoga', 'Flexibilidad', '11:00:00', 60),
('Spinning', 'Cardio', '12:00:00', 45);

-- Inscripción de Carlos en la clase de Zumba
INSERT INTO inscripciones (socio_id, clase_id, fecha_inscripcion) VALUES
(1, 1, '2025-02-15');

-- Inscripción de Laura en la clase de Yoga
INSERT INTO inscripciones (socio_id, clase_id, fecha_inscripcion) VALUES
(2, 2, '2025-02-16');

-- Pedro Sánchez imparte la clase de Zumba
INSERT INTO entrenadores_clases (entrenador_id, clase_id) VALUES
(1, 1);

-- María López imparte la clase de Yoga
INSERT INTO entrenadores_clases (entrenador_id, clase_id) VALUES
(2, 2);

-- Consultas de prueba

-- Consultar las clases en las que está inscrito un socio
SELECT s.nombre AS nombre_socio, s.apellido, c.nombre_clase, c.horario, c.duracion
FROM inscripciones i
JOIN socios s ON i.socio_id = s.socio_id
JOIN clases c ON i.clase_id = c.clase_id
WHERE s.socio_id = 1;

-- Consultar los entrenadores que imparten una clase
SELECT e.nombre AS nombre_entrenador, e.apellido, c.nombre_clase
FROM entrenadores_clases ec
JOIN entrenadores e ON ec.entrenador_id = e.entrenador_id
JOIN clases c ON ec.clase_id = c.clase_id
WHERE c.clase_id = 1; -- Zumba

-- Consultar los socios inscritos en una clase:
SELECT s.nombre AS nombre_socio, s.apellido, c.nombre_clase, i.fecha_inscripcion
FROM inscripciones i
JOIN socios s ON i.socio_id = s.socio_id
JOIN clases c ON i.clase_id = c.clase_id
WHERE c.clase_id = 1; -- Zumba





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Diseña una base de datos para un sistema de gestión de cine,
    donde se registren películas, salas y espectadores.
*/

CREATE DATABASE cinelandia;
USE cinelandia;

-- Tabla de películas
-- Almacena la información de las películas que se proyectan en el cine.
CREATE TABLE peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    duracion INT NOT NULL,                              -- Duración en minutos
    genero VARCHAR(100),
    clasificacion VARCHAR(50),                          -- Ej: "PG-13", "R", etc.
    sinopsis TEXT,
    fecha_estreno DATE
);

-- Tabla de salas
-- Almacena la información de las salas de proyección.
CREATE TABLE salas (
    id_sala INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL,                             -- Número de asientos
    tipo_sala VARCHAR(50)                               -- Ej: "2D", "3D", "IMAX"
);

-- Tabla de espectadores
-- Almacena la información de los espectadores que compran entradas.
CREATE TABLE espectadores (
    id_espectador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    fecha_registro DATE DEFAULT (CURRENT_DATE)
);

-- Tabla de funciones (pases)
-- Relaciona las películas con las salas y define el horario de las proyecciones.
CREATE TABLE funciones (
    id_funcion INT AUTO_INCREMENT PRIMARY KEY,
    id_pelicula INT NOT NULL,
    id_sala INT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula),
    FOREIGN KEY (id_sala) REFERENCES salas(id_sala)
);

-- Tabla de entradas
-- Registra las entradas vendidas a los espectadores para cada función.
CREATE TABLE entradas (
    id_entrada INT AUTO_INCREMENT PRIMARY KEY,
    id_funcion INT NOT NULL,
    id_espectador INT NOT NULL,
    asiento VARCHAR(10) NOT NULL, -- Ej: "A1", "B2", etc.
    precio DECIMAL(10, 2) NOT NULL,
    fecha_compra DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_funcion) REFERENCES funciones(id_funcion),
    FOREIGN KEY (id_espectador) REFERENCES espectadores(id_espectador)
);

-- Datos de ejemplo
INSERT INTO peliculas (titulo, duracion, genero, clasificacion, sinopsis, fecha_estreno) VALUES
('El Padrino', 175, 'Drama', 'R', 'La historia de una familia mafiosa en Nueva York.', '1972-03-24'),
('Titanic', 195, 'Romance', 'PG-13', 'Una historia de amor en el trágico viaje del Titanic.', '1997-12-19'),
('El Señor de los Anillos: La Comunidad del Anillo', 178, 'Fantasía', 'PG-13', 'Un hobbit emprende una misión para destruir un anillo maligno.', '2001-12-19'),
('Inception', 148, 'Ciencia Ficción', 'PG-13', 'Un ladrón de sueños intenta plantar una idea en la mente de alguien.', '2010-07-16'),
('Jurassic Park', 127, 'Aventura', 'PG-13', 'Un parque temático con dinosaurios cobra vida.', '1993-06-11');

INSERT INTO salas (nombre, capacidad, tipo_sala) VALUES
('Sala 1', 150, '2D'),
('Sala 2', 200, '3D'),
('Sala 3', 100, 'IMAX'),
('Sala 4', 120, '2D'),
('Sala 5', 180, '3D');

INSERT INTO espectadores (nombre, email, telefono, fecha_registro) VALUES
('Juan Pérez', 'juan.perez@example.com', '600123456', '2023-10-01'),
('María Gómez', 'maria.gomez@example.com', '600654321', '2023-10-02'),
('Carlos Ruiz', 'carlos.ruiz@example.com', '600112233', '2023-10-03'),
('Ana López', 'ana.lopez@example.com', '600445566', '2023-10-04'),
('Pedro Sánchez', 'pedro.sanchez@example.com', '600778899', '2023-10-05');

INSERT INTO funciones (id_pelicula, id_sala, fecha_hora) VALUES
(1, 1, '2023-11-01 18:00:00'), -- El Padrino en Sala 1
(2, 2, '2023-11-01 20:00:00'), -- Titanic en Sala 2
(3, 3, '2023-11-02 19:00:00'), -- El Señor de los Anillos en Sala 3
(4, 4, '2023-11-02 21:00:00'), -- Inception en Sala 4
(5, 5, '2023-11-03 18:30:00'); -- Jurassic Park en Sala 5

INSERT INTO entradas (id_funcion, id_espectador, asiento, precio) VALUES
(1, 1, 'A1', 9.99), -- Juan Pérez compra entrada para El Padrino
(1, 2, 'A2', 9.99), -- María Gómez compra entrada para El Padrino
(2, 3, 'B3', 12.50), -- Carlos Ruiz compra entrada para Titanic
(3, 4, 'C4', 15.00), -- Ana López compra entrada para El Señor de los Anillos
(4, 5, 'D5', 11.00), -- Pedro Sánchez compra entrada para Inception
(5, 1, 'E6', 10.50), -- Juan Pérez compra entrada para Jurassic Park
(5, 2, 'E7', 10.50), -- María Gómez compra entrada para Jurassic Park
(3, 3, 'C5', 15.00), -- Carlos Ruiz compra entrada para El Señor de los Anillos
(4, 4, 'D6', 11.00), -- Ana López compra entrada para Inception
(2, 5, 'B4', 12.50); -- Pedro Sánchez compra entrada para Titanic

-- Consultas de prueba
-- Obtener todas las funciones de una película específica
SELECT f.fecha_hora, s.nombre AS sala
FROM funciones f
JOIN salas s ON f.id_sala = s.id_sala
WHERE f.id_pelicula = 1; -- ID de la película

-- Obtener todas las entradas vendidas para una función
SELECT e.asiento, e.precio, esp.nombre AS espectador
FROM entradas e
JOIN espectadores esp ON e.id_espectador = esp.id_espectador
WHERE e.id_funcion = 1; -- ID de la función

-- Obtener la película más vista
SELECT p.titulo, COUNT(e.id_entrada) AS entradas_vendidas
FROM peliculas p
JOIN funciones f ON p.id_pelicula = f.id_pelicula
JOIN entradas e ON f.id_funcion = e.id_funcion
GROUP BY p.id_pelicula
ORDER BY entradas_vendidas DESC
LIMIT 1;





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Crea las tablas necesarias para un portal de educación en línea donde los estudiantes
    puedan inscribirse en diferentes cursos y acceder a materiales de estudio.
*/
CREATE DATABASE educaonline;
USE educaonline;

-- Tabla de estudiantes
CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL, -- Contraseña encriptada
    fecha_registro DATE DEFAULT (CURRENT_DATE)
);

-- Tabla de cursos
CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    duracion INT, -- Duración en horas
    nivel VARCHAR(50), -- Ej: "Principiante", "Intermedio", "Avanzado"
    fecha_publicacion DATE DEFAULT (CURRENT_DATE)
);

-- Tabla de instructores
CREATE TABLE instructores (
    id_instructor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    especialidad VARCHAR(255)
);

-- Tabla curso_instructor
-- Relaciona los cursos con los instructores (un curso puede tener varios instructores y viceversa).
CREATE TABLE curso_instructor (
    id_curso INT,
    id_instructor INT,
    PRIMARY KEY (id_curso, id_instructor),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
    FOREIGN KEY (id_instructor) REFERENCES instructores(id_instructor)
);

-- Tabla inscripciones
-- Registra las inscripciones de los estudiantes a los cursos
CREATE TABLE inscripciones (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    fecha_inscripcion DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

-- Tabla modulos
-- Almacena los módulos o unidades de cada curso
CREATE TABLE modulos (
    id_modulo INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    orden INT, -- Orden del módulo dentro del curso
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

-- Tabla materiales
-- Almacena los materiales de estudio asociados a cada módulo
CREATE TABLE materiales (
    id_material INT AUTO_INCREMENT PRIMARY KEY,
    id_modulo INT,
    tipo VARCHAR(50), -- Ej: "Video", "PDF", "Quiz"
    url VARCHAR(255) NOT NULL, -- Enlace o ubicación del material
    FOREIGN KEY (id_modulo) REFERENCES modulos(id_modulo)
);

-- Tabla progreso_estudiante
-- Registra el progreso de los estudiantes en los cursos
CREATE TABLE progreso_estudiante (
    id_progreso INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_modulo INT,
    completado BOOLEAN DEFAULT FALSE,
    fecha_completado DATE,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    FOREIGN KEY (id_modulo) REFERENCES modulos(id_modulo)
);

-- Datos de ejemplo
INSERT INTO estudiantes (nombre, email, contraseña, fecha_registro) VALUES
('Juan Pérez', 'juan.perez@example.com', 'password123', '2023-10-01'),
('María Gómez', 'maria.gomez@example.com', 'password123', '2023-10-02'),
('Carlos Ruiz', 'carlos.ruiz@example.com', 'password123', '2023-10-03'),
('Ana López', 'ana.lopez@example.com', 'password123', '2023-10-04'),
('Pedro Sánchez', 'pedro.sanchez@example.com', 'password123', '2023-10-05'),
('Laura Martínez', 'laura.martinez@example.com', 'password123', '2023-10-06'),
('Miguel Torres', 'miguel.torres@example.com', 'password123', '2023-10-07'),
('Sofía Ramírez', 'sofia.ramirez@example.com', 'password123', '2023-10-08'),
('Jorge Díaz', 'jorge.diaz@example.com', 'password123', '2023-10-09'),
('Lucía Hernández', 'lucia.hernandez@example.com', 'password123', '2023-10-10'),
('Diego Flores', 'diego.flores@example.com', 'password123', '2023-10-11'),
('Elena Castro', 'elena.castro@example.com', 'password123', '2023-10-12'),
('Fernando Vargas', 'fernando.vargas@example.com', 'password123', '2023-10-13'),
('Carmen Rojas', 'carmen.rojas@example.com', 'password123', '2023-10-14'),
('Ricardo Morales', 'ricardo.morales@example.com', 'password123', '2023-10-15'),
('Patricia Guzmán', 'patricia.guzman@example.com', 'password123', '2023-10-16'),
('Oscar Herrera', 'oscar.herrera@example.com', 'password123', '2023-10-17'),
('Adriana Luna', 'adriana.luna@example.com', 'password123', '2023-10-18'),
('Raúl Medina', 'raul.medina@example.com', 'password123', '2023-10-19'),
('Silvia Paredes', 'silvia.paredes@example.com', 'password123', '2023-10-20');

INSERT INTO cursos (titulo, descripcion, duracion, nivel, id_instructor, fecha_publicacion) VALUES
('Introducción a la Programación', 'Aprende los fundamentos de la programación.', 40, 'Principiante', 1, '2023-09-01'),
('Matemáticas Básicas', 'Curso de matemáticas para principiantes.', 30, 'Principiante', 2, '2023-09-02'),
('Física Moderna', 'Conceptos avanzados de física.', 50, 'Avanzado', 3, '2023-09-03'),
('Literatura Clásica', 'Explora las obras maestras de la literatura.', 20, 'Intermedio', 4, '2023-09-04'),
('Historia Universal', 'Un recorrido por la historia del mundo.', 25, 'Intermedio', 5, '2023-09-05'),
('Biología Celular', 'Estudio de las células y su funcionamiento.', 35, 'Avanzado', 6, '2023-09-06'),
('Química Orgánica', 'Introducción a la química de los compuestos orgánicos.', 45, 'Intermedio', 7, '2023-09-07'),
('Arte Contemporáneo', 'Exploración del arte moderno.', 15, 'Principiante', 8, '2023-09-08'),
('Economía Básica', 'Conceptos fundamentales de economía.', 30, 'Principiante', 9, '2023-09-09'),
('Inglés Avanzado', 'Perfecciona tu inglés con este curso.', 40, 'Avanzado', 10, '2023-09-10'),
('Filosofía Antigua', 'Un viaje por las ideas de los filósofos clásicos.', 20, 'Intermedio', 11, '2023-09-11'),
('Geografía Mundial', 'Conoce los países y sus características.', 25, 'Principiante', 12, '2023-09-12'),
('Música Clásica', 'Historia y apreciación de la música clásica.', 15, 'Intermedio', 13, '2023-09-13'),
('Derecho Penal', 'Introducción al derecho penal.', 30, 'Avanzado', 14, '2023-09-14'),
('Psicología Social', 'Estudio del comportamiento en sociedad.', 35, 'Intermedio', 15, '2023-09-15'),
('Marketing Digital', 'Estrategias de marketing en línea.', 40, 'Principiante', 16, '2023-09-16'),
('Diseño Gráfico', 'Fundamentos del diseño visual.', 30, 'Principiante', 17, '2023-09-17'),
('Ingeniería de Software', 'Desarrollo de software profesional.', 50, 'Avanzado', 18, '2023-09-18'),
('Medicina General', 'Conceptos básicos de medicina.', 45, 'Intermedio', 19, '2023-09-19'),
('Administración de Empresas', 'Gestión eficiente de negocios.', 35, 'Principiante', 20, '2023-09-20');

INSERT INTO instructores (nombre, email, especialidad) VALUES
('Alejandro Méndez', 'alejandro.mendez@example.com', 'Programación'),
('Beatriz Ríos', 'beatriz.rios@example.com', 'Matemáticas'),
('César Navarro', 'cesar.navarro@example.com', 'Física'),
('Diana Campos', 'diana.campos@example.com', 'Literatura'),
('Eduardo Soto', 'eduardo.soto@example.com', 'Historia'),
('Fabiola Ortega', 'fabiola.ortega@example.com', 'Biología'),
('Gabriel Peña', 'gabriel.pena@example.com', 'Química'),
('Hilda Reyes', 'hilda.reyes@example.com', 'Arte'),
('Iván Mendoza', 'ivan.mendoza@example.com', 'Economía'),
('Jacqueline Vega', 'jacqueline.vega@example.com', 'Inglés'),
('Kevin Fuentes', 'kevin.fuentes@example.com', 'Filosofía'),
('Lorena Delgado', 'lorena.delgado@example.com', 'Geografía'),
('Mauricio Silva', 'mauricio.silva@example.com', 'Música'),
('Natalia Cortés', 'natalia.cortes@example.com', 'Derecho'),
('Óscar Pacheco', 'oscar.pacheco@example.com', 'Psicología'),
('Paola Rivas', 'paola.rivas@example.com', 'Marketing'),
('Quetzalli Juárez', 'quetzalli.juarez@example.com', 'Diseño Gráfico'),
('Rafael Montes', 'rafael.montes@example.com', 'Ingeniería'),
('Sara Jiménez', 'sara.jimenez@example.com', 'Medicina'),
('Tomás Cervantes', 'tomas.cervantes@example.com', 'Administración');

INSERT INTO curso_instructor (id_curso, id_instructor) VALUES
(1, 1), -- Introducción a la Programación -> Alejandro Méndez
(2, 2), -- Matemáticas Básicas -> Beatriz Ríos
(3, 3), -- Física Moderna -> César Navarro
(4, 4), -- Literatura Clásica -> Diana Campos
(5, 5), -- Historia Universal -> Eduardo Soto
(6, 6), -- Biología Celular -> Fabiola Ortega
(7, 7), -- Química Orgánica -> Gabriel Peña
(8, 8), -- Arte Contemporáneo -> Hilda Reyes
(9, 9), -- Economía Básica -> Iván Mendoza
(10, 10); -- Inglés Avanzado -> Jacqueline Vega

INSERT INTO inscripciones (id_estudiante, id_curso, fecha_inscripcion) VALUES
(1, 1, '2023-10-01'),
(2, 2, '2023-10-02'),
(3, 3, '2023-10-03'),
(4, 4, '2023-10-04'),
(5, 5, '2023-10-05'),
(6, 6, '2023-10-06'),
(7, 7, '2023-10-07'),
(8, 8, '2023-10-08'),
(9, 9, '2023-10-09'),
(10, 10, '2023-10-10'),
(11, 11, '2023-10-11'),
(12, 12, '2023-10-12'),
(13, 13, '2023-10-13'),
(14, 14, '2023-10-14'),
(15, 15, '2023-10-15'),
(16, 16, '2023-10-16'),
(17, 17, '2023-10-17'),
(18, 18, '2023-10-18'),
(19, 19, '2023-10-19'),
(20, 20, '2023-10-20');

INSERT INTO modulos (id_curso, titulo, descripcion, tipo_material, url_material, orden) VALUES
(1, 'Introducción a Python', 'Aprende los conceptos básicos de Python.', 'Video', 'https://example.com/python-intro', 1),
(1, 'Estructuras de Datos', 'Listas, tuplas y diccionarios en Python.', 'PDF', 'https://example.com/python-data-structures', 2),
(2, 'Álgebra Básica', 'Operaciones algebraicas fundamentales.', 'Video', 'https://example.com/algebra-basica', 1),
(2, 'Geometría', 'Conceptos básicos de geometría.', 'PDF', 'https://example.com/geometria', 2),
(3, 'Relatividad Especial', 'Teoría de la relatividad de Einstein.', 'Video', 'https://example.com/relatividad-especial', 1),
(3, 'Mecánica Cuántica', 'Introducción a la mecánica cuántica.', 'PDF', 'https://example.com/mecanica-cuantica', 2),
(4, 'Literatura Griega', 'Obras clásicas de la antigua Grecia.', 'Video', 'https://example.com/literatura-griega', 1),
(4, 'Literatura Romana', 'Obras clásicas de la antigua Roma.', 'PDF', 'https://example.com/literatura-romana', 2),
(5, 'Edad Antigua', 'Historia de las primeras civilizaciones.', 'Video', 'https://example.com/edad-antigua', 1),
(5, 'Edad Media', 'Historia del período medieval.', 'PDF', 'https://example.com/edad-media', 2),
(6, 'Células Eucariotas', 'Estructura y función de las células eucariotas.', 'Video', 'https://example.com/celulas-eucariotas', 1),
(6, 'Células Procariotas', 'Estructura y función de las células procariotas.', 'PDF', 'https://example.com/celulas-procariotas', 2),
(7, 'Química del Carbono', 'Introducción a los compuestos de carbono.', 'Video', 'https://example.com/quimica-carbono', 1),
(7, 'Hidrocarburos', 'Tipos y propiedades de los hidrocarburos.', 'PDF', 'https://example.com/hidrocarburos', 2),
(8, 'Arte Abstracto', 'Exploración del arte abstracto.', 'Video', 'https://example.com/arte-abstracto', 1),
(8, 'Surrealismo', 'Movimiento artístico del surrealismo.', 'PDF', 'https://example.com/surrealismo', 2),
(9, 'Oferta y Demanda', 'Conceptos básicos de oferta y demanda.', 'Video', 'https://example.com/oferta-demanda', 1),
(9, 'Macroeconomía', 'Introducción a la macroeconomía.', 'PDF', 'https://example.com/macroeconomia', 2),
(10, 'Gramática Avanzada', 'Reglas gramaticales del inglés avanzado.', 'Video', 'https://example.com/gramatica-avanzada', 1),
(10, 'Vocabulario Técnico', 'Vocabulario especializado en inglés.', 'PDF', 'https://example.com/vocabulario-tecnico', 2);

INSERT INTO materiales (id_modulo, tipo, url) VALUES
(1, 'Video', 'https://example.com/python-intro-video'), -- Material para el módulo 1 (Introducción a Python)
(1, 'PDF', 'https://example.com/python-intro-pdf'), -- Material para el módulo 1
(2, 'Video', 'https://example.com/data-structures-video'), -- Material para el módulo 2 (Estructuras de Datos)
(2, 'PDF', 'https://example.com/data-structures-pdf'), -- Material para el módulo 2
(3, 'Video', 'https://example.com/algebra-video'), -- Material para el módulo 3 (Álgebra Básica)
(3, 'PDF', 'https://example.com/algebra-pdf'), -- Material para el módulo 3
(4, 'Video', 'https://example.com/geometry-video'), -- Material para el módulo 4 (Geometría)
(4, 'PDF', 'https://example.com/geometry-pdf'), -- Material para el módulo 4
(5, 'Video', 'https://example.com/relativity-video'), -- Material para el módulo 5 (Relatividad Especial)
(5, 'PDF', 'https://example.com/relativity-pdf'); -- Material para el módulo 5

INSERT INTO progreso_estudiante (id_estudiante, id_modulo, completado, fecha_completado) VALUES
(1, 1, TRUE, '2023-10-05'),
(2, 3, TRUE, '2023-10-06'),
(3, 5, TRUE, '2023-10-07'),
(4, 7, TRUE, '2023-10-08'),
(5, 9, TRUE, '2023-10-09'),
(6, 11, TRUE, '2023-10-10'),
(7, 13, TRUE, '2023-10-11'),
(8, 15, TRUE, '2023-10-12'),
(9, 17, TRUE, '2023-10-13'),
(10, 19, TRUE, '2023-10-14'),
(11, 2, FALSE, NULL),
(12, 4, FALSE, NULL),
(13, 6, FALSE, NULL),
(14, 8, FALSE, NULL),
(15, 10, FALSE, NULL),
(16, 12, FALSE, NULL),
(17, 14, FALSE, NULL),
(18, 16, FALSE, NULL),
(19, 18, FALSE, NULL),
(20, 20, FALSE, NULL);

-- consultas de ejemplo

-- Obtener todos los cursos en los que está inscrito un estudiante (ID = 1):
SELECT c.titulo, c.descripcion
FROM cursos c
JOIN inscripciones i ON c.id_curso = i.id_curso
WHERE i.id_estudiante = 1;

-- Obtener todos los materiales de un módulo específico (ID = 1):
SELECT m.tipo, m.url
FROM materiales m
WHERE m.id_modulo = 1;

-- Obtener el progreso de un estudiante en un curso (ID del estudiante = 1, ID del curso = 1):
SELECT mo.titulo AS modulo, pe.completado, pe.fecha_completado
FROM progreso_estudiante pe
JOIN modulos mo ON pe.id_modulo = mo.id_modulo
WHERE pe.id_estudiante = 1 AND mo.id_curso = 1;

-- Obtener los instructores de un curso específico (ID = 1):
SELECT i.nombre, i.especialidad
FROM instructores i
JOIN curso_instructor ci ON i.id_instructor = ci.id_instructor
WHERE ci.id_curso = 1;

