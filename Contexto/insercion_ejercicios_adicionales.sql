-- =================================================================
-- SCRIPT DE INSERCIÓN DE EJERCICIOS ADICIONALES
-- =================================================================
-- Este script agrega 5 ejercicios a cada una de las 6 actividades existentes,
-- asegurando una mezcla de los 3 tipos de ejercicios disponibles.
-- =================================================================

USE bdpandoo;

-- IDs de los tipos de ejercicio (según el script de inserciones):
-- 1: Multiple Choice
-- 2: Unir con flechas
-- 3: Completar texto

-- IDs de las actividades existentes: 1, 2, 3, 4, 5, 6

-- =======================================
-- Ejercicios para Actividad 1: Conceptos básicos (Programación)
-- =======================================
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(10, '¿Cuál es el propósito de un compilador?', 3, '{"opciones":["Interpretar código línea por línea","Traducir código fuente a código máquina","Ejecutar scripts del lado del servidor"],"respuesta":"Traducir código fuente a código máquina"}', 1, 1),
(11, 'Une el término con su definición correcta.', 4, '{"pares":{"Algoritmo":"Secuencia de pasos finitos","Variable":"Contenedor de datos"}}', 1, 2),
(12, 'Un bucle `for` se utiliza para iterar sobre una _______.', 5, '{"respuesta":"secuencia"}', 1, 3),
(13, '¿Qué es un "string" en la mayoría de los lenguajes de programación?', 6, '{"opciones":["Un número entero","Una secuencia de caracteres","Un valor booleano"],"respuesta":"Una secuencia de caracteres"}', 1, 1),
(14, 'Relaciona el operador con su función.', 7, '{"pares":{"==":"Comparación de igualdad","=":"Asignación"}}', 1, 2);

-- =======================================
-- Ejercicios para Actividad 2: Estructuras de control (Programación)
-- =======================================
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(15, '¿Qué estructura se usa para tomar decisiones en el código?', 3, '{"opciones":["if-elif-else","switch-case","try-except"],"respuesta":"if-elif-else"}', 2, 1),
(16, 'Une la estructura de control con su uso principal.', 4, '{"pares":{"while":"Repetir mientras una condición sea verdadera","for":"Iterar sobre una colección de elementos"}}', 2, 2),
(17, 'La palabra clave `break` se usa para ______ un bucle.', 5, '{"respuesta":"terminar"}', 2, 3),
(18, '¿Cuál de las siguientes es una estructura de repetición?', 6, '{"opciones":["if","while","else"],"respuesta":"while"}', 2, 1),
(19, 'Relaciona el concepto con su descripción.', 7, '{"pares":{"Anidamiento":"Una estructura dentro de otra","Recursión":"Una función que se llama a sí misma"}}', 2, 2);

-- =======================================
-- Ejercicios para Actividad 3: Fundamentos de redes
-- =======================================
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(20, '¿Qué dispositivo conecta diferentes redes?', 3, '{"opciones":["Switch","Router","Hub"],"respuesta":"Router"}', 3, 1),
(21, 'Une la topología de red con su característica.', 4, '{"pares":{"Estrella":"Todos los nodos a un punto central","Anillo":"Los nodos forman un círculo cerrado"}}', 3, 2),
(22, 'Una dirección IP sirve para ________ un dispositivo en una red.', 5, '{"respuesta":"identificar"}', 3, 3),
(23, '¿Qué es un paquete de red?', 6, '{"opciones":["Unidad de datos enrutada","Un tipo de cable","Un protocolo de seguridad"],"respuesta":"Unidad de datos enrutada"}', 3, 1),
(24, 'Relaciona el acrónimo con su significado.', 7, '{"pares":{"LAN":"Local Area Network","WAN":"Wide Area Network"}}', 3, 2);

-- =======================================
-- Ejercicios para Actividad 4: Modelo OSI y protocolos
-- =======================================
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(25, '¿Cuántas capas tiene el modelo OSI?', 3, '{"opciones":["5","7","4"],"respuesta":"7"}', 4, 1),
(26, 'Une el protocolo con la capa del modelo OSI a la que pertenece.', 4, '{"pares":{"HTTP":"Capa de Aplicación","IP":"Capa de Red"}}', 4, 2),
(27, 'El protocolo TCP es orientado a la ________.', 5, '{"respuesta":"conexión"}', 4, 3),
(28, '¿Qué protocolo se utiliza para resolver nombres de dominio a direcciones IP?', 6, '{"opciones":["DHCP","DNS","ARP"],"respuesta":"DNS"}', 4, 1),
(29, 'Relaciona la capa OSI con su PDU (Unidad de Datos de Protocolo).', 7, '{"pares":{"Capa de Transporte":"Segmento","Capa de Enlace de Datos":"Trama"}}', 4, 2);

-- =======================================
-- Ejercicios para Actividad 5: Modelo relacional (Bases de datos)
-- =======================================
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(30, '¿Qué es una clave primaria (Primary Key)?', 3, '{"opciones":["Un campo que identifica unívocamente cada registro","Un índice para búsquedas rápidas","Una referencia a otra tabla"],"respuesta":"Un campo que identifica unívocamente cada registro"}', 5, 1),
(31, 'Une el tipo de relación con su descripción.', 4, '{"pares":{"Uno a muchos":"Un registro de A se relaciona con varios de B","Muchos a muchos":"Varios de A se relacionan con varios de B"}}', 5, 2),
(32, 'La normalización ayuda a reducir la ________ de datos.', 5, '{"respuesta":"redundancia"}', 5, 3),
(33, '¿Qué es una clave foránea (Foreign Key)?', 6, '{"opciones":["Un campo que enlaza a la clave primaria de otra tabla","El campo principal de una tabla","Una restricción de unicidad"],"respuesta":"Un campo que enlaza a la clave primaria de otra tabla"}', 5, 1),
(34, 'Relaciona el concepto con su definición en el modelo relacional.', 7, '{"pares":{"Tupla":"Una fila en una tabla","Atributo":"Una columna en una tabla"}}', 5, 2);

-- =======================================
-- Ejercicios para Actividad 6: Consultas SQL
-- =======================================
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(35, '¿Qué cláusula se usa para filtrar resultados en una consulta SELECT?', 3, '{"opciones":["FILTER","WHERE","HAVING"],"respuesta":"WHERE"}', 6, 1),
(36, 'Une el comando SQL con su función.', 4, '{"pares":{"INSERT":"Añadir nuevas filas","UPDATE":"Modificar filas existentes"}}', 6, 2),
(37, 'La cláusula `GROUP BY` se usa a menudo con funciones de ________.', 5, '{"respuesta":"agregación"}', 6, 3),
(38, '¿Qué función de agregación se utiliza para contar el número de filas?', 6, '{"opciones":["SUM()","COUNT()","AVG()"],"respuesta":"COUNT()"}', 6, 1),
(39, 'Relaciona la cláusula JOIN con su resultado.', 7, '{"pares":{"INNER JOIN":"Devuelve filas cuando hay una coincidencia en ambas tablas","LEFT JOIN":"Devuelve todas las filas de la tabla izquierda"}}', 6, 2);

-- =================================================================
-- FIN DEL SCRIPT
-- =================================================================
