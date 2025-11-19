-- =================================================================
-- SCRIPT DE INSERCIÓN MASIVA DE ACTIVIDADES Y EJERCICIOS
-- =================================================================
-- Este script agrega 3 actividades nuevas a cada uno de los 3 cursos existentes.
-- Para cada una de estas nuevas actividades, se insertan 5 ejercicios
-- de tipo 'Completar texto'.
-- =================================================================

USE bdpandoo;

-- IDs de los cursos existentes: 1, 2, 3
-- Próximo ID de Actividad disponible: 7
-- Próximo ID de Ejercicio disponible: 40
-- ID de Tipo de Ejercicio 'Completar texto': 3

-- =================================================================
-- CURSO 1: INTRODUCCIÓN A LA PROGRAMACIÓN
-- =================================================================

-- Actividad 3 para Curso 1 (ID Actividad: 7)
INSERT INTO Actividad (idActividad, nombre, orden, Curso_idCurso) VALUES (7, 'Funciones y Módulos', 3, 1);
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(40, 'Una función se define con la palabra clave ______.', 1, '{"opciones": ["def", "fun", "function"], "respuesta": "def"}', 7, 3),
(41, 'El valor que una función devuelve se especifica con ______.', 2, '{"opciones": ["return", "yield", "send"], "respuesta": "return"}', 7, 3),
(42, 'Para usar una función de otro archivo, se usa la sentencia ______.', 3, '{"opciones": ["import", "include", "use"], "respuesta": "import"}', 7, 3),
(43, 'Los parámetros son variables que se pasan a una ______.', 4, '{"opciones": ["función", "clase", "módulo"], "respuesta": "función"}', 7, 3),
(44, 'Un ______ es un archivo de Python con código reutilizable.', 5, '{"opciones": ["módulo", "paquete", "script"], "respuesta": "módulo"}', 7, 3);

-- Actividad 4 para Curso 1 (ID Actividad: 8)
INSERT INTO Actividad (idActividad, nombre, orden, Curso_idCurso) VALUES (8, 'Programación Orientada a Objetos', 4, 1);
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(45, 'Una ______ es una plantilla para crear objetos.', 1, '{"opciones": ["clase", "función", "variable"], "respuesta": "clase"}', 8, 3),
(46, 'La ______ permite a una clase heredar atributos y métodos de otra.', 2, '{"opciones": ["herencia", "polimorfismo", "encapsulación"], "respuesta": "herencia"}', 8, 3),
(47, 'El ______ oculta los detalles internos de un objeto.', 3, '{"opciones": ["encapsulamiento", "polimorfismo", "herencia"], "respuesta": "encapsulamiento"}', 8, 3),
(48, 'Un ______ es una instancia de una clase.', 4, '{"opciones": ["objeto", "método", "atributo"], "respuesta": "objeto"}', 8, 3),
(49, 'El método `__init__` es el ______ de una clase en Python.', 5, '{"opciones": ["constructor", "destructor", "inicializador"], "respuesta": "constructor"}', 8, 3);

-- Actividad 5 para Curso 1 (ID Actividad: 9)
INSERT INTO Actividad (idActividad, nombre, orden, Curso_idCurso) VALUES (9, 'Manejo de Errores', 5, 1);
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(50, 'Los errores en tiempo de ejecución se llaman ______.', 1, '{"opciones": ["excepciones", "sintaxis", "lógica"], "respuesta": "excepciones"}', 9, 3),
(51, 'El bloque `try...except` se usa para manejar ______.', 2, '{"opciones": ["excepciones", "bucles", "condiciones"], "respuesta": "excepciones"}', 9, 3),
(52, 'La cláusula `finally` se ejecuta ______.', 3, '{"opciones": ["siempre", "solo si hay error", "solo si no hay error"], "respuesta": "siempre"}', 9, 3),
(53, 'Se puede lanzar una excepción manualmente con la palabra clave ______.', 4, '{"opciones": ["raise", "throw", "error"], "respuesta": "raise"}', 9, 3),
(54, 'Un error de ______ ocurre cuando el código no sigue las reglas del lenguaje.', 5, '{"opciones": ["sintaxis", "lógica", "ejecución"], "respuesta": "sintaxis"}', 9, 3);

-- =================================================================
-- CURSO 2: REDES Y COMUNICACIONES
-- =================================================================

-- Actividad 3 para Curso 2 (ID Actividad: 10)
INSERT INTO Actividad (idActividad, nombre, orden, Curso_idCurso) VALUES (10, 'Seguridad en Redes', 3, 2);
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(55, 'Un ______ protege una red privada de accesos no autorizados.', 1, '{"opciones": ["firewall", "router", "switch"], "respuesta": "firewall"}', 10, 3),
(56, 'VPN significa Red Privada ______.', 2, '{"opciones": ["Virtual", "Verificada", "Veloz"], "respuesta": "Virtual"}', 10, 3),
(57, 'El cifrado de datos ayuda a mantener la ______.', 3, '{"opciones": ["confidencialidad", "integridad", "disponibilidad"], "respuesta": "confidencialidad"}', 10, 3),
(58, 'Un ataque de ______ suplanta la identidad de un sitio web legítimo.', 4, '{"opciones": ["phishing", "malware", "DDoS"], "respuesta": "phishing"}', 10, 3),
(59, 'WPA2 es un protocolo de seguridad para redes ______.', 5, '{"opciones": ["inalámbricas", "cableadas", "virtuales"], "respuesta": "inalámbricas"}', 10, 3);

-- Actividad 4 para Curso 2 (ID Actividad: 11)
INSERT INTO Actividad (idActividad, nombre, orden, Curso_idCurso) VALUES (11, 'Redes Inalámbricas', 4, 2);
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(60, 'El estándar más común para Wi-Fi es IEEE ______.', 1, '{"opciones": ["802.11", "802.3", "802.1"], "respuesta": "802.11"}', 11, 3),
(61, 'Un Punto de Acceso (AP) conecta dispositivos inalámbricos a una red ______.', 2, '{"opciones": ["cableada", "virtual", "celular"], "respuesta": "cableada"}', 11, 3),
(62, 'Bluetooth es una tecnología para redes de área ______.', 3, '{"opciones": ["personal (PAN)", "local (LAN)", "amplia (WAN)"], "respuesta": "personal (PAN)"}', 11, 3),
(63, 'El ______ es el nombre de una red Wi-Fi.', 4, '{"opciones": ["SSID", "BSSID", "MAC"], "respuesta": "SSID"}', 11, 3),
(64, 'La interferencia es un problema común en las redes ______.', 5, '{"opciones": ["inalámbricas", "ópticas", "de cobre"], "respuesta": "inalámbricas"}', 11, 3);

-- Actividad 5 para Curso 2 (ID Actividad: 12)
INSERT INTO Actividad (idActividad, nombre, orden, Curso_idCurso) VALUES (12, 'Capa de Aplicación', 5, 2);
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(65, 'HTTP es el protocolo para la transferencia de ______.', 1, '{"opciones": ["hipertexto", "archivos", "correo"], "respuesta": "hipertexto"}', 12, 3),
(66, 'FTP se utiliza para la transferencia de ______.', 2, '{"opciones": ["archivos", "correo", "mensajes"], "respuesta": "archivos"}', 12, 3),
(67, 'El protocolo para enviar correo electrónico es ______.', 3, '{"opciones": ["SMTP", "POP3", "IMAP"], "respuesta": "SMTP"}', 12, 3),
(68, 'DNS traduce nombres de dominio a direcciones ______.', 4, '{"opciones": ["IP", "MAC", "físicas"], "respuesta": "IP"}', 12, 3),
(69, 'HTTPS es la versión ______ de HTTP.', 5, '{"opciones": ["segura", "simple", "rápida"], "respuesta": "segura"}', 12, 3);

-- =================================================================
-- CURSO 3: BASES DE DATOS
-- =================================================================

-- Actividad 3 para Curso 3 (ID Actividad: 13)
INSERT INTO Actividad (idActividad, nombre, orden, Curso_idCurso) VALUES (13, 'SQL Avanzado', 3, 3);
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(70, 'Una subconsulta es una consulta ______ dentro de otra.', 1, '{"opciones": ["anidada", "alterna", "asociada"], "respuesta": "anidada"}', 13, 3),
(71, 'Las funciones de ______ operan sobre un conjunto de filas.', 2, '{"opciones": ["ventana", "agregación", "escalar"], "respuesta": "ventana"}', 13, 3),
(72, '`UNION` combina el resultado de dos o más sentencias ______.', 3, '{"opciones": ["SELECT", "INSERT", "UPDATE"], "respuesta": "SELECT"}', 13, 3),
(73, 'Un ______ es un procedimiento almacenado que se ejecuta automáticamente.', 4, '{"opciones": ["trigger", "índice", "vista"], "respuesta": "trigger"}', 13, 3),
(74, '`CTE` significa Common Table ______.', 5, '{"opciones": ["Expression", "Entry", "Element"], "respuesta": "Expression"}', 13, 3);

-- Actividad 4 para Curso 3 (ID Actividad: 14)
INSERT INTO Actividad (idActividad, nombre, orden, Curso_idCurso) VALUES (14, 'Transacciones y Concurrencia', 4, 3);
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(75, 'Una transacción es una unidad de trabajo ______.', 1, '{"opciones": ["atómica", "aislada", "duradera"], "respuesta": "atómica"}', 14, 3),
(76, '`COMMIT` guarda los cambios de una transacción de forma ______.', 2, '{"opciones": ["permanente", "temporal", "parcial"], "respuesta": "permanente"}', 14, 3),
(77, '`ROLLBACK` ______ los cambios de una transacción.', 3, '{"opciones": ["deshace", "confirma", "rehace"], "respuesta": "deshace"}', 14, 3),
(78, 'El bloqueo (locking) es un mecanismo para controlar la ______.', 4, '{"opciones": ["concurrencia", "consistencia", "atomicidad"], "respuesta": "concurrencia"}', 14, 3),
(79, 'ACID es un acrónimo para Atomicidad, Consistencia, Aislamiento y ______.', 5, '{"opciones": ["Durabilidad", "Disponibilidad", "Divisibilidad"], "respuesta": "Durabilidad"}', 14, 3);

-- Actividad 5 para Curso 3 (ID Actividad: 15)
INSERT INTO Actividad (idActividad, nombre, orden, Curso_idCurso) VALUES (15, 'Bases de Datos NoSQL', 5, 3);
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(80, 'Las bases de datos NoSQL son generalmente no ______.', 1, '{"opciones": ["relacionales", "transaccionales", "seguras"], "respuesta": "relacionales"}', 15, 3),
(81, 'MongoDB es una base de datos orientada a ______.', 2, '{"opciones": ["documentos", "grafos", "columnas"], "respuesta": "documentos"}', 15, 3),
(82, 'Redis es un ejemplo de base de datos clave-______.', 3, '{"opciones": ["valor", "columna", "documento"], "respuesta": "valor"}', 15, 3),
(83, 'El teorema ______ describe las limitaciones de los sistemas distribuidos.', 4, '{"opciones": ["CAP", "SQL", "ACID"], "respuesta": "CAP"}', 15, 3),
(84, 'La escalabilidad ______ es una ventaja clave de NoSQL.', 5, '{"opciones": ["horizontal", "vertical", "diagonal"], "respuesta": "horizontal"}', 15, 3);

-- =================================================================
-- FIN DEL SCRIPT
-- =================================================================
