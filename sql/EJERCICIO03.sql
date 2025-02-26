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

-- Crear base de datos
CREATE DATABASE IF NOT EXISTS educaonline;
USE educaonline;

-- Tabla de estudiantes
CREATE TABLE estudiantes (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL, -- Contraseña encriptada
    fecha_registro DATE DEFAULT CURRENT_DATE
);

-- Tabla de cursos
CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    duracion INT, -- Duración en horas
    nivel VARCHAR(50), -- Ej: "Principiante", "Intermedio", "Avanzado"
    fecha_publicacion DATE DEFAULT CURRENT_DATE
);

-- Tabla de instructores y asignación a cursos
CREATE TABLE instructores (
    id_instructor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    especialidad VARCHAR(255)
);

-- Relación de instructores con cursos (un curso puede tener varios instructores)
CREATE TABLE curso_instructor (
    id_curso INT,
    id_instructor INT,
    PRIMARY KEY (id_curso, id_instructor),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
    FOREIGN KEY (id_instructor) REFERENCES instructores(id_instructor)
);

-- Tabla de inscripciones (relación entre estudiantes y cursos)
CREATE TABLE inscripciones (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_curso INT,
    fecha_inscripcion DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

-- Tabla de módulos y materiales dentro de un mismo registro
CREATE TABLE modulos_materiales (
    id_modulo INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT,
    titulo_modulo VARCHAR(255) NOT NULL,
    descripcion_modulo TEXT,
    orden INT, -- El orden del módulo dentro del curso
    tipo_material VARCHAR(50), -- Ej: "Video", "PDF", "Quiz"
    url_material VARCHAR(255) NOT NULL, -- Enlace o ubicación del material
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

-- Tabla de progreso del estudiante (para saber si ha completado un módulo/material)
CREATE TABLE progreso_estudiante (
    id_progreso INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_modulo INT,
    completado BOOLEAN DEFAULT FALSE,
    fecha_completado DATE,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    FOREIGN KEY (id_modulo) REFERENCES modulos_materiales(id_modulo)
);

-- Datos de ejemplo
INSERT INTO estudiantes (nombre, email, contraseña) VALUES
('Juan Pérez', 'juanperez@example.com', 'password123'),
('María López', 'marialopez@example.com', 'password456'),
('Carlos Sánchez', 'carlossanchez@example.com', 'password789'),
('Laura Gómez', 'lauragomez@example.com', 'password101'),
('Pedro Ramírez', 'pedroramirez@example.com', 'password102'),
('Ana Martínez', 'anamartinez@example.com', 'password103'),
('Luis Fernández', 'luisfernandez@example.com', 'password104'),
('Elena Rodríguez', 'elenarodriguez@example.com', 'password105'),
('David Torres', 'davidtorres@example.com', 'password106'),
('Sofía Castro', 'sofiacastro@example.com', 'password107');

INSERT INTO cursos (titulo, descripcion, duracion, nivel) VALUES
('Introducción a Python', 'Curso básico de programación en Python', 20, 'Principiante'),
('JavaScript Avanzado', 'Curso avanzado de JavaScript para desarrolladores', 25, 'Avanzado'),
('Desarrollo Web con HTML y CSS', 'Curso completo de desarrollo web con HTML y CSS', 30, 'Principiante'),
('Bases de Datos con MySQL', 'Curso sobre diseño y optimización de bases de datos MySQL', 35, 'Intermedio'),
('Inteligencia Artificial con Python', 'Curso sobre AI usando Python y bibliotecas populares', 40, 'Avanzado'),
('Marketing Digital', 'Fundamentos del marketing digital y estrategias online', 15, 'Principiante'),
('Ciberseguridad para Empresas', 'Curso sobre prácticas de seguridad informática en empresas', 50, 'Avanzado'),
('Machine Learning para Principiantes', 'Introducción a los conceptos básicos de Machine Learning', 28, 'Principiante'),
('Redes de Computadoras', 'Curso sobre arquitectura y administración de redes de computadoras', 45, 'Intermedio'),
('Desarrollo de Aplicaciones Móviles', 'Desarrollo de apps para Android e iOS usando Flutter', 32, 'Intermedio');

INSERT INTO instructores (nombre, email, especialidad) VALUES
('Carlos Gómez', 'carlosgomez@example.com', 'Desarrollo Web'),
('Ana Ruiz', 'anaruiz@example.com', 'Ciberseguridad'),
('Pedro García', 'pedrogarcia@example.com', 'Inteligencia Artificial'),
('Sofía Hernández', 'sofiahernandez@example.com', 'Marketing Digital'),
('Javier López', 'javierlopez@example.com', 'Bases de Datos'),
('Martín Sánchez', 'martinsanchez@example.com', 'Machine Learning'),
('Laura Díaz', 'lauradiaz@example.com', 'JavaScript'),
('Antonio Fernández', 'antoniofernandez@example.com', 'Redes de Computadoras'),
('Elena Jiménez', 'elenajimenez@example.com', 'Desarrollo Móvil'),
('Luis Morales', 'luismorales@example.com', 'Python');

INSERT INTO curso_instructor (id_curso, id_instructor) VALUES
(1, 10), -- Curso 1: Introducción a Python con Instructor 10: Luis Morales
(2, 7),  -- Curso 2: JavaScript Avanzado con Instructor 7: Laura Díaz
(3, 1),  -- Curso 3: Desarrollo Web con HTML y CSS con Instructor 1: Carlos Gómez
(4, 5),  -- Curso 4: Bases de Datos con MySQL con Instructor 5: Javier López
(5, 3),  -- Curso 5: Inteligencia Artificial con Python con Instructor 3: Pedro García
(6, 4),  -- Curso 6: Marketing Digital con Instructor 4: Sofía Hernández
(7, 2),  -- Curso 7: Ciberseguridad para Empresas con Instructor 2: Ana Ruiz
(8, 6),  -- Curso 8: Machine Learning para Principiantes con Instructor 6: Martín Sánchez
(9, 8),  -- Curso 9: Redes de Computadoras con Instructor 8: Antonio Fernández
(10, 9); -- Curso 10: Desarrollo de Aplicaciones Móviles con Instructor 9: Elena Jiménez

INSERT INTO inscripciones (id_estudiante, id_curso) VALUES
(1, 1),  -- Estudiante 1: Juan Pérez inscrito en Curso 1
(2, 2),  -- Estudiante 2: María López inscrita en Curso 2
(3, 3),  -- Estudiante 3: Carlos Sánchez inscrito en Curso 3
(4, 4),  -- Estudiante 4: Laura Gómez inscrita en Curso 4
(5, 5),  -- Estudiante 5: Pedro Ramírez inscrito en Curso 5
(6, 6),  -- Estudiante 6: Ana Martínez inscrita en Curso 6
(7, 7),  -- Estudiante 7: Luis Fernández inscrito en Curso 7
(8, 8),  -- Estudiante 8: Elena Rodríguez inscrita en Curso 8
(9, 9),  -- Estudiante 9: David Torres inscrito en Curso 9
(10, 10); -- Estudiante 10: Sofía Castro inscrita en Curso 10

INSERT INTO modulos_materiales (id_curso, titulo_modulo, descripcion_modulo, orden, tipo_material, url_material) VALUES
(1, 'Introducción a Python', 'Módulo básico de introducción al lenguaje Python', 1, 'Video', 'https://example.com/curso1/video1'),
(1, 'Variables y Tipos de Datos', 'Aprenderemos sobre variables y tipos de datos en Python', 2, 'PDF', 'https://example.com/curso1/pdf1'),
(2, 'Estructuras de Control', 'Condicionales y bucles en JavaScript', 1, 'Video', 'https://example.com/curso2/video1'),
(2, 'Funciones Avanzadas', 'Funciones avanzadas y callbacks en JavaScript', 2, 'PDF', 'https://example.com/curso2/pdf1'),
(3, 'HTML Básico', 'Módulo básico de HTML para creación de páginas web', 1, 'Video', 'https://example.com/curso3/video1'),
(3, 'CSS Avanzado', 'Estilización avanzada de páginas web con CSS', 2, 'PDF', 'https://example.com/curso3/pdf1'),
(4, 'Modelado de Datos', 'Técnicas de modelado de bases de datos con MySQL', 1, 'Video', 'https://example.com/curso4/video1'),
(4, 'Consultas SQL', 'Cómo realizar consultas en bases de datos MySQL', 2, 'PDF', 'https://example.com/curso4/pdf1'),
(5, 'Introducción a AI', 'Introducción a los fundamentos de la Inteligencia Artificial', 1, 'Video', 'https://example.com/curso5/video1'),
(5, 'Redes Neuronales', 'Teoría y prácticas de redes neuronales en IA', 2, 'PDF', 'https://example.com/curso5/pdf1');

INSERT INTO progreso_estudiante (id_estudiante, id_modulo, completado, fecha_completado) VALUES
(1, 1, TRUE, '2025-02-01'), -- Estudiante 1: Juan Pérez completó Módulo 1
(2, 2, FALSE, NULL), -- Estudiante 2: María López no ha completado Módulo 2
(3, 3, TRUE, '2025-02-02'), -- Estudiante 3: Carlos Sánchez completó Módulo 3
(4, 4, TRUE, '2025-02-05'), -- Estudiante 4: Laura Gómez completó Módulo 4
(5, 5, FALSE, NULL), -- Estudiante 5: Pedro Ramírez no ha completado Módulo 5
(6, 6, TRUE, '2025-02-07'), -- Estudiante 6: Ana Martínez completó Módulo 6
(7, 7, TRUE, '2025-02-10'), -- Estudiante 7: Luis Fernández completó Módulo 7
(8, 8, FALSE, NULL), -- Estudiante 8: Elena Rodríguez no ha completado Módulo 8
(9, 9, TRUE, '2025-02-12'), -- Estudiante 9: David Torres completó Módulo 9
(10, 10, TRUE, '2025-02-15'); -- Estudiante 10: Sofía Castro completó Módulo 10

-- Consults de ejemplo
-- Mostrar todos los cursos junto con los instructores asignados
SELECT c.titulo AS "Curso", i.nombre AS "Instructor"
FROM cursos c
JOIN curso_instructor ci ON c.id_curso = ci.id_curso
JOIN instructores i ON ci.id_instructor = i.id_instructor;

-- Mostrar todos los estudiantes con los cursos en los que están inscritos
SELECT e.nombre AS "Estudiante", c.titulo AS "Curso"
FROM estudiantes e
JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
JOIN cursos c ON i.id_curso = c.id_curso;

-- Ver los módulos y materiales de un curso específico
SELECT c.titulo AS "Curso", m.titulo_modulo AS "Módulo", m.tipo_material AS "Tipo de Material", m.url_material AS "URL del Material"
FROM modulos_materiales m
JOIN cursos c ON m.id_curso = c.id_curso
WHERE c.id_curso = 1; -- Puedes cambiar el 1 por el ID del curso que quieras consultar

-- Ver el progreso de un estudiante en cada módulo
SELECT e.nombre AS "Estudiante", c.titulo AS "Curso", m.titulo_modulo AS "Módulo", 
       p.completado AS "Completado", p.fecha_completado AS "Fecha de Finalización"
FROM progreso_estudiante p
JOIN estudiantes e ON p.id_estudiante = e.id_estudiante
JOIN modulos_materiales m ON p.id_modulo = m.id_modulo
JOIN cursos c ON m.id_curso = c.id_curso;

-- Mostrar todos los estudiantes y los cursos que han completado
SELECT e.nombre AS "Estudiante", c.titulo AS "Curso", m.titulo_modulo AS "Módulo"
FROM progreso_estudiante p
JOIN estudiantes e ON p.id_estudiante = e.id_estudiante
JOIN modulos_materiales m ON p.id_modulo = m.id_modulo
JOIN cursos c ON m.id_curso = c.id_curso
WHERE p.completado = TRUE;

-- Mostrar los estudiantes que no han completado un módulo específico
SELECT e.nombre AS "Estudiante", c.titulo AS "Curso", m.titulo_modulo AS "Módulo"
FROM progreso_estudiante p
JOIN estudiantes e ON p.id_estudiante = e.id_estudiante
JOIN modulos_materiales m ON p.id_modulo = m.id_modulo
JOIN cursos c ON m.id_curso = c.id_curso
WHERE p.completado = FALSE AND m.id_modulo = 1; -- Puedes cambiar el 1 por el ID del módulo que desees

-- Mostrar todos los materiales de estudio de un curso, ordenados por módulo
SELECT c.titulo AS "Curso", m.titulo_modulo AS "Módulo", m.tipo_material AS "Tipo de Material", m.url_material AS "URL"
FROM modulos_materiales m
JOIN cursos c ON m.id_curso = c.id_curso
ORDER BY m.orden;

-- Ver todos los cursos junto con sus estudiantes inscritos
SELECT c.titulo AS "Curso", e.nombre AS "Estudiante"
FROM cursos c
JOIN inscripciones i ON c.id_curso = i.id_curso
JOIN estudiantes e ON i.id_estudiante = e.id_estudiante;

-- Ver todos los instructores junto con los cursos que imparten
SELECT i.nombre AS "Instructor", c.titulo AS "Curso"
FROM instructores i
JOIN curso_instructor ci ON i.id_instructor = ci.id_instructor
JOIN cursos c ON ci.id_curso = c.id_curso;

--  Mostrar la relación de progreso de un estudiante en todos los cursos en los que está inscrito
SELECT e.nombre AS "Estudiante", c.titulo AS "Curso", p.completado AS "Completado"
FROM estudiantes e
JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
JOIN cursos c ON i.id_curso = c.id_curso
JOIN progreso_estudiante p ON e.id_estudiante = p.id_estudiante AND c.id_curso = p.id_curso;





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Desarrolla una base de datos para un marketplace donde vendedores puedan publicar
    productos y los compradores puedan realizar pedidos.
*/

CREATE DATABASE marketplace;
USE marketplace;

-- Tablas
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion TEXT,
    tipo_usuario ENUM('comprador', 'vendedor') NOT NULL
);

CREATE TABLE vendedores (
    id_vendedor INT PRIMARY KEY,
    id_usuario INT,
    nombre_tienda VARCHAR(255),
    descripcion_tienda TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    id_vendedor INT,
    nombre_producto VARCHAR(255) NOT NULL,
    descripcion_producto TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    imagen_url VARCHAR(255),
    fecha_publicacion DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_comprador INT,
    fecha_pedido DATE DEFAULT CURRENT_DATE,
    estado ENUM('pendiente', 'enviado', 'entregado', 'cancelado') DEFAULT 'pendiente',
    total DECIMAL(10, 2),
    FOREIGN KEY (id_comprador) REFERENCES usuarios(id_usuario)
);

CREATE TABLE detalles_pedido (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Datos de ejemplo
INSERT INTO usuarios (nombre, email, telefono, direccion, tipo_usuario) VALUES
('Juan Pérez', 'juan.perez@example.com', '123456789', 'Calle Ficticia 123, Ciudad', 'comprador'),
('María Gómez', 'maria.gomez@example.com', '987654321', 'Avenida Real 456, Ciudad', 'comprador'),
('Carlos Ruiz', 'carlos.ruiz@example.com', '456789123', 'Calle Nueva 789, Ciudad', 'vendedor'),
('Ana López', 'ana.lopez@example.com', '321654987', 'Calle Vieja 321, Ciudad', 'vendedor');

INSERT INTO vendedores (id_vendedor, id_usuario, nombre_tienda, descripcion_tienda) VALUES
(1, 3, 'Tienda de Carlos', 'Tienda especializada en productos electrónicos'),
(2, 4, 'Tienda de Ana', 'Tienda de ropa y accesorios');

INSERT INTO productos (id_vendedor, nombre_producto, descripcion_producto, precio, stock, imagen_url) VALUES
(1, 'Laptop Gaming', 'Laptop potente para juegos', 1200.00, 10, 'url_imagen_laptop'),
(1, 'Auriculares Bluetooth', 'Auriculares inalámbricos con cancelación de ruido', 150.00, 25, 'url_imagen_auriculares'),
(2, 'Camiseta Deportiva', 'Camiseta de algodón para deportes', 25.00, 50, 'url_imagen_camiseta'),
(2, 'Zapatos Running', 'Zapatos deportivos para correr', 75.00, 30, 'url_imagen_zapatos');

INSERT INTO pedidos (id_comprador, estado, total) VALUES
(1, 'pendiente', 1350.00),
(2, 'enviado', 100.00);

INSERT INTO detalles_pedido (id_pedido, id_producto, cantidad, precio_unitario, total) VALUES
(1, 1, 1, 1200.00, 1200.00),
(1, 2, 1, 150.00, 150.00),
(2, 3, 2, 25.00, 50.00);

-- Ejemplos de consultas
SELECT p.nombre_producto, p.descripcion_producto, p.precio, p.stock
FROM productos p
WHERE p.id_vendedor = 1;

SELECT pe.id_pedido, pe.fecha_pedido, pe.estado, pe.total
FROM pedidos pe
WHERE pe.id_comprador = 1;

SELECT p.nombre_producto, SUM(dp.cantidad) AS total_vendido
FROM detalles_pedido dp
JOIN productos p ON dp.id_producto = p.id_producto
GROUP BY p.id_producto
ORDER BY total_vendido DESC;





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Crea una base de datos para un hospital en el que los doctores atiendan pacientes y
    registren diagnósticos y tratamientos.
*/

CREATE DATABASE hospital;
USE hospital;

-- Tablas
-- Tabla de Pacientes
CREATE TABLE pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    genero ENUM('Masculino', 'Femenino', 'Otro') NOT NULL,
    telefono VARCHAR(20),
    direccion TEXT
);

-- Tabla de Doctores
CREATE TABLE doctores (
    id_doctor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    especialidad VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(255) UNIQUE
);

-- Tabla de Consultas
CREATE TABLE consultas (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    id_doctor INT,
    fecha_consulta DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
    FOREIGN KEY (id_doctor) REFERENCES doctores(id_doctor)
);

-- Tabla de Diagnósticos
CREATE TABLE diagnosticos (
    id_diagnostico INT AUTO_INCREMENT PRIMARY KEY,
    id_consulta INT,
    diagnostico TEXT NOT NULL,
    fecha_diagnostico DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_consulta) REFERENCES consultas(id_consulta)
);

-- Tabla de Tratamientos
CREATE TABLE tratamientos (
    id_tratamiento INT AUTO_INCREMENT PRIMARY KEY,
    id_diagnostico INT,
    tratamiento TEXT NOT NULL,
    fecha_tratamiento DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_diagnostico) REFERENCES diagnosticos(id_diagnostico)
);


-- Datos de ejemplo
INSERT INTO pacientes (nombre, fecha_nacimiento, genero, telefono, direccion) VALUES
('Juan Pérez', '1985-05-15', 'Masculino', '123456789', 'Calle Ficticia 123, Ciudad'),
('María Gómez', '1990-08-25', 'Femenino', '987654321', 'Avenida Real 456, Ciudad'),
('Carlos Ruiz', '1978-12-10', 'Masculino', '456789123', 'Calle Nueva 789, Ciudad');

INSERT INTO doctores (nombre, especialidad, telefono, email) VALUES
('Dr. Ana López', 'Cardiología', '321654987', 'ana.lopez@hospital.com'),
('Dr. Pedro Fernández', 'Pediatría', '654321789', 'pedro.fernandez@hospital.com'),
('Dr. Julia Martínez', 'Dermatología', '987321654', 'julia.martinez@hospital.com');

INSERT INTO consultas (id_paciente, id_doctor, fecha_consulta) VALUES
(1, 1, '2025-02-10'),
(2, 2, '2025-02-15'),
(3, 3, '2025-02-20');

INSERT INTO diagnosticos (id_consulta, diagnostico, fecha_diagnostico) VALUES
(1, 'Hipertensión arterial', '2025-02-10'),
(2, 'Resfriado común', '2025-02-15'),
(3, 'Eczema en la piel', '2025-02-20');

INSERT INTO tratamientos (id_diagnostico, tratamiento, fecha_tratamiento) VALUES
(1, 'Medicamentos antihipertensivos', '2025-02-10'),
(2, 'Recomendaciones de descanso y líquidos', '2025-02-15'),
(3, 'Crema tópica para el eczema', '2025-02-20');

-- Consultas varias
SELECT p.nombre AS paciente, p.fecha_nacimiento, p.genero, p.telefono, p.direccion
FROM pacientes p
JOIN consultas c ON p.id_paciente = c.id_paciente
JOIN doctores d ON c.id_doctor = d.id_doctor
WHERE d.nombre = 'Dr. Ana López';

SELECT d.diagnostico, d.fecha_diagnostico
FROM diagnosticos d
JOIN consultas c ON d.id_consulta = c.id_consulta
JOIN pacientes p ON c.id_paciente = p.id_paciente
JOIN doctores doc ON c.id_doctor = doc.id_doctor
WHERE p.nombre = 'Juan Pérez' AND doc.nombre = 'Dr. Ana López';

SELECT t.tratamiento, t.fecha_tratamiento
FROM tratamientos t
JOIN diagnosticos d ON t.id_diagnostico = d.id_diagnostico
WHERE d.diagnostico = 'Hipertensión arterial';





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Diseña una base de datos para un sistema de transporte público,
    donde se gestionen rutas, estaciones y pasajeros.
*/

CREATE DATABASE transporte_publico;
USE transporte_publico;

-- Tablas
-- Tabla de Rutas
CREATE TABLE rutas (
    id_ruta INT AUTO_INCREMENT PRIMARY KEY,
    nombre_ruta VARCHAR(255) NOT NULL,
    descripcion TEXT
);

-- Tabla de Estaciones
CREATE TABLE estaciones (
    id_estacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre_estacion VARCHAR(255) NOT NULL,
    ubicacion VARCHAR(255)
);

-- Tabla de Pasajeros
CREATE TABLE pasajeros (
    id_pasajero INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    telefono VARCHAR(20)
);

-- Tabla de Viajes
CREATE TABLE viajes (
    id_viaje INT AUTO_INCREMENT PRIMARY KEY,
    id_pasajero INT,
    id_ruta INT,
    id_estacion_origen INT,
    id_estacion_destino INT,
    fecha_viaje DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pasajero) REFERENCES pasajeros(id_pasajero),
    FOREIGN KEY (id_ruta) REFERENCES rutas(id_ruta),
    FOREIGN KEY (id_estacion_origen) REFERENCES estaciones(id_estacion),
    FOREIGN KEY (id_estacion_destino) REFERENCES estaciones(id_estacion)
);

-- Tabla de Tickets
CREATE TABLE tickets (
    id_ticket INT AUTO_INCREMENT PRIMARY KEY,
    id_viaje INT,
    precio DECIMAL(10, 2) NOT NULL,
    fecha_emision DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_viaje) REFERENCES viajes(id_viaje)
);


-- Datos de ejemplo
INSERT INTO rutas (nombre_ruta, descripcion) VALUES
('Ruta 1', 'Ruta principal de la ciudad que conecta el norte con el sur'),
('Ruta 2', 'Ruta que conecta el centro con el este de la ciudad'),
('Ruta 3', 'Ruta que conecta el oeste con el norte');

INSERT INTO estaciones (nombre_estacion, ubicacion) VALUES
('Estación Central', 'Centro de la ciudad'),
('Estación Norte', 'Zona norte de la ciudad'),
('Estación Sur', 'Zona sur de la ciudad'),
('Estación Este', 'Zona este de la ciudad'),
('Estación Oeste', 'Zona oeste de la ciudad');

INSERT INTO pasajeros (nombre, email, telefono) VALUES
('Juan Pérez', 'juan.perez@gmail.com', '123456789'),
('María Gómez', 'maria.gomez@gmail.com', '987654321'),
('Carlos Ruiz', 'carlos.ruiz@gmail.com', '456789123');

INSERT INTO viajes (id_pasajero, id_ruta, id_estacion_origen, id_estacion_destino) VALUES
(1, 1, 1, 2),  -- Juan Pérez, Ruta 1, de Estación Central a Estación Norte
(2, 2, 1, 4),  -- María Gómez, Ruta 2, de Estación Central a Estación Este
(3, 3, 3, 5);  -- Carlos Ruiz, Ruta 3, de Estación Sur a Estación Oeste

INSERT INTO tickets (id_viaje, precio) VALUES
(1, 2.50),  -- Ticket para el viaje 1
(2, 3.00),  -- Ticket para el viaje 2
(3, 2.75);  -- Ticket para el viaje 3


-- Consultas de ejemplo
-- Obtener todos los viajes de un pasajero específico

SELECT v.id_viaje, r.nombre_ruta, e1.nombre_estacion AS origen, e2.nombre_estacion AS destino, v.fecha_viaje
FROM viajes v
JOIN rutas r ON v.id_ruta = r.id_ruta
JOIN estaciones e1 ON v.id_estacion_origen = e1.id_estacion
JOIN estaciones e2 ON v.id_estacion_destino = e2.id_estacion
WHERE v.id_pasajero = 1;  -- Cambiar el ID del pasajero

-- Obtener todos los pasajeros que han viajado en una ruta específica

SELECT p.nombre, p.email, p.telefono
FROM pasajeros p
JOIN viajes v ON p.id_pasajero = v.id_pasajero
WHERE v.id_ruta = 1;  -- Cambiar el ID de la ruta

--  Obtener los detalles de los tickets para un viaje específico

SELECT t.id_ticket, t.precio, t.fecha_emision
FROM tickets t
JOIN viajes v ON t.id_viaje = v.id_viaje
WHERE v.id_viaje = 1;  -- Cambiar el ID del viaje





/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */
/* ///////////////////////////////////////////////////////////////////////////////////////////// */

/*
    Crea una base de datos para un sistema de gestión de eventos, donde los asistentes
    puedan registrarse para participar en distintas conferencias.
*/

CREATE DATABASE gestion_eventos;
USE gestion_eventos;

-- Tablas
-- Tabla de asistentes
CREATE TABLE asistentes (
    id_asistente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    fecha_registro DATE DEFAULT CURRENT_DATE
);

-- Tabla de eventos (conferencias)
CREATE TABLE eventos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_evento DATE,
    hora_evento TIME,
    id_ubicacion INT,
    FOREIGN KEY (id_ubicacion) REFERENCES ubicaciones(id_ubicacion)
);

-- Tabla de ponentes
CREATE TABLE ponentes (
    id_ponente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    especialidad VARCHAR(255)
);

-- Tabla de ubicaciones
CREATE TABLE ubicaciones (
    id_ubicacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion TEXT,
    tipo VARCHAR(50) -- Ejemplo: "Auditorio", "Sala de reuniones", "En línea"
);

-- Tabla de registros (relaciona los asistentes con los eventos)
CREATE TABLE registros (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    id_asistente INT,
    id_evento INT,
    fecha_registro DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_asistente) REFERENCES asistentes(id_asistente),
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento)
);

-- Tabla de ponentes_eventos (relaciona los ponentes con los eventos que presentan)
CREATE TABLE ponentes_eventos (
    id_evento INT,
    id_ponente INT,
    PRIMARY KEY (id_evento, id_ponente),
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
    FOREIGN KEY (id_ponente) REFERENCES ponentes(id_ponente)
);

-- Datos de ejemplo
CREATE DATABASE gestion_eventos;
USE gestion_eventos;

-- Tabla de asistentes
CREATE TABLE asistentes (
    id_asistente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    fecha_registro DATE DEFAULT CURRENT_DATE
);

-- Tabla de eventos (conferencias)
CREATE TABLE eventos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_evento DATE,
    hora_evento TIME,
    id_ubicacion INT,
    FOREIGN KEY (id_ubicacion) REFERENCES ubicaciones(id_ubicacion)
);

-- Tabla de ponentes
CREATE TABLE ponentes (
    id_ponente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    especialidad VARCHAR(255)
);

-- Tabla de ubicaciones
CREATE TABLE ubicaciones (
    id_ubicacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion TEXT,
    tipo VARCHAR(50) -- Ejemplo: "Auditorio", "Sala de reuniones", "En línea"
);

-- Tabla de registros (relaciona los asistentes con los eventos)
CREATE TABLE registros (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    id_asistente INT,
    id_evento INT,
    fecha_registro DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_asistente) REFERENCES asistentes(id_asistente),
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento)
);

-- Tabla de ponentes_eventos (relaciona los ponentes con los eventos que presentan)
CREATE TABLE ponentes_eventos (
    id_evento INT,
    id_ponente INT,
    PRIMARY KEY (id_evento, id_ponente),
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
    FOREIGN KEY (id_ponente) REFERENCES ponentes(id_ponente)
);

-- Consultas de ejemplo
-- Obtener todos los eventos con su ubicación y ponentes:
SELECT e.titulo AS "Evento", e.fecha_evento AS "Fecha", e.hora_evento AS "Hora", 
       u.nombre AS "Ubicación", GROUP_CONCAT(p.nombre) AS "Ponentes"
FROM eventos e
JOIN ubicaciones u ON e.id_ubicacion = u.id_ubicacion
JOIN ponentes_eventos pe ON e.id_evento = pe.id_evento
JOIN ponentes p ON pe.id_ponente = p.id_ponente
GROUP BY e.id_evento;

-- Obtener los eventos en los que un asistente está registrado:
SELECT a.nombre AS "Asistente", e.titulo AS "Evento", e.fecha_evento AS "Fecha", e.hora_evento AS "Hora"
FROM registros r
JOIN asistentes a ON r.id_asistente = a.id_asistente
JOIN eventos e ON r.id_evento = e.id_evento
WHERE a.id_asistente = 1;  -- Ejemplo: Asistente con ID = 1

-- Obtener todos los asistentes registrados en un evento específico:
SELECT e.titulo AS "Evento", a.nombre AS "Asistente", a.email AS "Email"
FROM registros r
JOIN eventos e ON r.id_evento = e.id_evento
JOIN asistentes a ON r.id_asistente = a.id_asistente
WHERE e.id_evento = 1;  -- Ejemplo: Evento con ID = 1
