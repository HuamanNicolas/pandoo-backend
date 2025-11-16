ALTER TABLE Ejercicio 
MODIFY enunciado VARCHAR(255) NOT NULL;

USE bdpandoo;

-- ===========================
-- LIMPIEZA (en orden seguro)
-- ===========================
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Progreso;
TRUNCATE TABLE Ejercicio;
TRUNCATE TABLE Tipo_ejercicio;
TRUNCATE TABLE Actividad;
TRUNCATE TABLE Inscripcion;
TRUNCATE TABLE Curso;
TRUNCATE TABLE User;
SET FOREIGN_KEY_CHECKS = 1;

-- ===========================
-- DATOS BASE
-- ===========================

-- Usuarios
INSERT INTO User (nombre, email, username, password)
VALUES
('Admin', 'admin@pandoo.com', 'admin', 'admin123'),
('Juan Pérez', 'juanperez@gmail.com', 'juanp', '1234'),
('Ana López', 'analopez@gmail.com', 'anita', 'abcd');

-- Cursos
INSERT INTO Curso (idCurso, nombre, imagen, estado, orden)
VALUES
(1, 'Introducción a la Programación', 'prog.png', 'activo', 1),
(2, 'Redes y Comunicaciones', 'redes.png', 'activo', 2),
(3, 'Bases de Datos', 'bd.png', 'activo', 3);

-- Inscripciones
INSERT INTO Inscripcion (fechaInscripcion, Curso_idCurso, User_iduser)
VALUES
(NOW(), 1, 2),
(NOW(), 2, 3),
(NOW(), 3, 2);

-- ===========================
-- ACTIVIDADES (Unidades)
-- ===========================
INSERT INTO Actividad (idActividad, nombre, orden, Curso_idCurso)
VALUES
-- Curso 1: Programación
(1, 'Conceptos básicos', 1, 1),
(2, 'Estructuras de control', 2, 1),

-- Curso 2: Redes
(3, 'Fundamentos de redes', 1, 2),
(4, 'Modelo OSI y protocolos', 2, 2),

-- Curso 3: Bases de datos
(5, 'Modelo relacional', 1, 3),
(6, 'Consultas SQL', 2, 3);

-- ===========================
-- TIPOS DE EJERCICIO
-- ===========================
INSERT INTO Tipo_ejercicio (nombre)
VALUES
('Multiple Choice'),
('Unir con flechas'),
('Completar texto');

-- ===========================
-- EJERCICIOS
-- ===========================
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio)
VALUES
-- Curso 1 - Programación
(1, '¿Qué es una variable en programación?', 1, '{"opciones":["Espacio en memoria","Tipo de bucle","Función del sistema"],"respuesta":"Espacio en memoria"}', 1, 1),
(2, 'Selecciona la estructura condicional correcta en Python.', 2, '{"opciones":["if-else","for","while"],"respuesta":"if-else"}', 2, 1),

-- Curso 2 - Redes
(3, 'Une cada capa con su función.', 1, '{"pares":{"Capa física":"Transmite bits","Capa de red":"Encaminamiento"} }', 3, 2),
(4, 'Selecciona un protocolo de la capa de transporte.', 2, '{"opciones":["TCP","HTTP","FTP"],"respuesta":"TCP"}', 4, 1),

-- Curso 3 - Bases de Datos
(5, 'Completa la sentencia: SELECT * FROM ____;', 1, '{"respuesta":"nombre_tabla"}', 5, 3),
(6, '¿Qué comando se usa para eliminar una tabla?', 2, '{"opciones":["DELETE TABLE","DROP TABLE","REMOVE TABLE"],"respuesta":"DROP TABLE"}', 6, 1);

-- ===========================
-- PROGRESO (simulado)
-- ===========================
INSERT INTO Progreso (fecha, Ejercicio_idEjercicio, User_iduser)
VALUES
(NOW(), 1, 2),
(NOW(), 3, 3),
(NOW(), 5, 2);
