-- =================================================================
-- SCRIPT DE ACTUALIZACIÓN PARA EJERCICIOS 'COMPLETAR TEXTO'
-- =================================================================
-- Este script modifica los metadatos de los ejercicios existentes
-- del tipo 'Completar texto' para adaptarlos a la nueva lógica
-- de selección múltiple en la interfaz de usuario.
-- =================================================================

USE bdpandoo;

-- Tipo de ejercicio 'Completar texto' tiene el id 3
SET @id_tipo_completar = 3;

-- Actualización para Ejercicio con id 5
-- Enunciado: 'Completa la sentencia: SELECT * FROM ____;'
-- Respuesta correcta: 'nombre_tabla'
UPDATE Ejercicio
SET metadata = JSON_OBJECT(
    'opciones', JSON_ARRAY('nombre_tabla', 'otra_tabla', 'mi_tabla'),
    'respuesta', 'nombre_tabla'
)
WHERE idEjercicio = 5 AND Tipo_ejercicio_idTipo_ejercicio = @id_tipo_completar;

-- Actualización para Ejercicio con id 12
-- Enunciado: 'Un bucle `for` se utiliza para iterar sobre una _______.'
-- Respuesta correcta: 'secuencia'
UPDATE Ejercicio
SET metadata = JSON_OBJECT(
    'opciones', JSON_ARRAY('condición', 'función', 'secuencia'),
    'respuesta', 'secuencia'
)
WHERE idEjercicio = 12 AND Tipo_ejercicio_idTipo_ejercicio = @id_tipo_completar;

-- Actualización para Ejercicio con id 17
-- Enunciado: 'La palabra clave `break` se usa para ______ un bucle.'
-- Respuesta correcta: 'terminar'
UPDATE Ejercicio
SET metadata = JSON_OBJECT(
    'opciones', JSON_ARRAY('iniciar', 'terminar', 'pausar'),
    'respuesta', 'terminar'
)
WHERE idEjercicio = 17 AND Tipo_ejercicio_idTipo_ejercicio = @id_tipo_completar;

-- Actualización para Ejercicio con id 22
-- Enunciado: 'Una dirección IP sirve para ________ un dispositivo en una red.'
-- Respuesta correcta: 'identificar'
UPDATE Ejercicio
SET metadata = JSON_OBJECT(
    'opciones', JSON_ARRAY('conectar', 'identificar', 'acelerar'),
    'respuesta', 'identificar'
)
WHERE idEjercicio = 22 AND Tipo_ejercicio_idTipo_ejercicio = @id_tipo_completar;

-- Actualización para Ejercicio con id 27
-- Enunciado: 'El protocolo TCP es orientado a la ________.'
-- Respuesta correcta: 'conexión'
UPDATE Ejercicio
SET metadata = JSON_OBJECT(
    'opciones', JSON_ARRAY('velocidad', 'conexión', 'seguridad'),
    'respuesta', 'conexión'
)
WHERE idEjercicio = 27 AND Tipo_ejercicio_idTipo_ejercicio = @id_tipo_completar;

-- Actualización para Ejercicio con id 32
-- Enunciado: 'La normalización ayuda a reducir la ________ de datos.'
-- Respuesta correcta: 'redundancia'
UPDATE Ejercicio
SET metadata = JSON_OBJECT(
    'opciones', JSON_ARRAY('complejidad', 'redundancia', 'velocidad'),
    'respuesta', 'redundancia'
)
WHERE idEjercicio = 32 AND Tipo_ejercicio_idTipo_ejercicio = @id_tipo_completar;

-- Actualización para Ejercicio con id 37
-- Enunciado: 'La cláusula `GROUP BY` se usa a menudo con funciones de ________.'
-- Respuesta correcta: 'agregación'
UPDATE Ejercicio
SET metadata = JSON_OBJECT(
    'opciones', JSON_ARRAY('filtrado', 'texto', 'agregación'),
    'respuesta', 'agregación'
)
WHERE idEjercicio = 37 AND Tipo_ejercicio_idTipo_ejercicio = @id_tipo_completar;


-- =================================================================
-- FIN DEL SCRIPT
-- =================================================================
