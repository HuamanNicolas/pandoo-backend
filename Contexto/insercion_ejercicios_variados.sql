-- =================================================================
-- SCRIPT DE INSERCIÓN DE EJERCICIOS ADICIONALES (VARIADOS)
-- =================================================================
-- Este script agrega 6 ejercicios adicionales (3 de opción múltiple y
-- 3 de unir con flechas) a cada una de las 9 actividades creadas
-- en el script 'insercion_masiva_actividades_ejercicios.sql'.
-- (Actividades con IDs del 7 al 15)
-- =================================================================

USE bdpandoo;

-- IDs de los tipos de ejercicio:
-- 1: Multiple Choice
-- 2: Unir con flechas
-- Próximo ID de Ejercicio disponible: 85

-- =================================================================
-- Actividad 7: Funciones y Módulos (Programación)
-- =================================================================
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(85, '¿Qué es la recursión?', 6, '{"opciones":["Una función que se llama a sí misma","Una función que llama a otra","Un bucle infinito"],"respuesta":"Una función que se llama a sí misma"}', 7, 1),
(86, 'El alcance (scope) de una variable se refiere a...', 7, '{"opciones":["La parte del código donde la variable es accesible","El tipo de dato que almacena","Su valor por defecto"],"respuesta":"La parte del código donde la variable es accesible"}', 7, 1),
(87, '¿Qué palabra clave se usa para importar solo una función específica de un módulo?', 8, '{"opciones":["from ... import ...","import *","include"],"respuesta":"from ... import ..."}', 7, 1),
(88, 'Une el concepto de función con su descripción.', 9, '{"pares":{"Parámetro":"Variable en la definición de la función","Argumento":"Valor pasado a la función al llamarla"}}', 7, 2),
(89, 'Relaciona la palabra clave con su propósito en una función.', 10, '{"pares":{"def":"Define una función","return":"Devuelve un valor"}}', 7, 2),
(90, 'Une el tipo de argumento con su característica.', 11, '{"pares":{"Posicional":"Se pasa según el orden","Nombrado (Keyword)":"Se pasa especificando el nombre del parámetro"}}', 7, 2);

-- =================================================================
-- Actividad 8: Programación Orientada a Objetos (Programación)
-- =================================================================
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(91, '¿Qué principio de la POO permite que un objeto de una clase hija sea tratado como un objeto de la clase padre?', 6, '{"opciones":["Polimorfismo","Encapsulamiento","Abstracción"],"respuesta":"Polimorfismo"}', 8, 1),
(92, 'El parámetro `self` en los métodos de una clase en Python se refiere a...', 7, '{"opciones":["La instancia actual de la clase","La clase misma","La clase padre"],"respuesta":"La instancia actual de la clase"}', 8, 1),
(93, '¿Qué es un método estático?', 8, '{"opciones":["Un método que pertenece a la clase y no a la instancia","Un método que no puede ser modificado","Un método que solo devuelve valores constantes"],"respuesta":"Un método que pertenece a la clase y no a la instancia"}', 8, 1),
(94, 'Une el pilar de la POO con su definición.', 9, '{"pares":{"Herencia":"Una clase adquiere propiedades de otra","Encapsulamiento":"Ocultar el estado interno de un objeto"}}', 8, 2),
(95, 'Relaciona el término de POO con su análogo en el mundo real.', 10, '{"pares":{"Clase":"Plano de una casa","Objeto":"Una casa construida a partir del plano"}}', 8, 2),
(96, 'Une el tipo de método con su primer parámetro convencional en Python.', 11, '{"pares":{"Método de instancia":"self","Método de clase":"cls"}}', 8, 2);

-- =================================================================
-- Actividad 9: Manejo de Errores (Programación)
-- =================================================================
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(97, '¿Qué tipo de error se produce si intentas sumar un número y una cadena de texto?', 6, '{"opciones":["TypeError","ValueError","NameError"],"respuesta":"TypeError"}', 9, 1),
(98, '¿Para qué se utiliza el bloque `else` en una estructura `try...except`?', 7, '{"opciones":["Se ejecuta si no ocurre ninguna excepción","Se ejecuta siempre","Se ejecuta solo si ocurre una excepción específica"],"respuesta":"Se ejecuta si no ocurre ninguna excepción"}', 9, 1),
(99, 'Un `NameError` ocurre cuando...', 8, '{"opciones":["Se intenta usar una variable no definida","El tipo de dato es incorrecto","Un valor está fuera del rango esperado"],"respuesta":"Se intenta usar una variable no definida"}', 9, 1),
(100, 'Une el bloque de manejo de errores con su función.', 9, '{"pares":{"try":"Contiene el código que podría fallar","except":"Maneja el error si ocurre"}}', 9, 2),
(101, 'Relaciona el tipo de error con su causa.', 10, '{"pares":{"ValueError":"Argumento con tipo correcto pero valor inválido","IndexError":"Índice fuera de rango en una secuencia"}}', 9, 2),
(102, 'Une la palabra clave con su propósito en el manejo de errores.', 11, '{"pares":{"raise":"Lanza una excepción intencionadamente","finally":"Código que se ejecuta siempre, con o sin error"}}', 9, 2);

-- =================================================================
-- Actividad 10: Seguridad en Redes
-- =================================================================
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(103, '¿Cuál es el objetivo de un ataque DDoS (Denegación de Servicio Distribuido)?', 6, '{"opciones":["Inundar un servicio para que no esté disponible","Robar información confidencial","Instalar software malicioso"],"respuesta":"Inundar un servicio para que no esté disponible"}', 10, 1),
(104, 'La autenticación de dos factores (2FA) requiere...', 7, '{"opciones":["Dos formas diferentes de verificación","Dos contraseñas diferentes","Dos usuarios diferentes"],"respuesta":"Dos formas diferentes de verificación"}', 10, 1),
(105, '¿Qué es el malware?', 8, '{"opciones":["Software diseñado para dañar o infiltrarse en un sistema","Un componente de hardware de red","Un protocolo de cifrado"],"respuesta":"Software diseñado para dañar o infiltrarse en un sistema"}', 10, 1),
(106, 'Une el concepto de seguridad con su descripción.', 9, '{"pares":{"Cifrado":"Proceso de convertir datos a un código para prevenir acceso no autorizado","Autenticación":"Proceso de verificar la identidad de un usuario"}}', 10, 2),
(107, 'Relaciona el tipo de malware con su comportamiento.', 10, '{"pares":{"Virus":"Se adjunta a un programa y se propaga","Ransomware":"Cifra archivos y pide un rescate para liberarlos"}}', 10, 2),
(108, 'Une el acrónimo de seguridad con su significado.', 11, '{"pares":{"VPN":"Red Privada Virtual","IDS":"Sistema de Detección de Intrusos"}}', 10, 2);

-- =================================================================
-- Actividad 11: Redes Inalámbricas
-- =================================================================
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(109, '¿Qué banda de frecuencia ofrece mayor velocidad pero menor alcance?', 6, '{"opciones":["5 GHz","2.4 GHz","900 MHz"],"respuesta":"5 GHz"}', 11, 1),
(110, 'El filtrado de direcciones MAC se usa para...', 7, '{"opciones":["Permitir o denegar el acceso a dispositivos específicos","Ocultar el nombre de la red","Cifrar la comunicación"],"respuesta":"Permitir o denegar el acceso a dispositivos específicos"}', 11, 1),
(111, '¿Qué es una red "ad hoc"?', 8, '{"opciones":["Una red donde los dispositivos se conectan directamente entre sí sin un AP","Una red con múltiples Puntos de Acceso","Una red para invitados"],"respuesta":"Una red donde los dispositivos se conectan directamente entre sí sin un AP"}', 11, 1),
(112, 'Une el estándar Wi-Fi con su nombre comercial.', 9, '{"pares":{"802.11ac":"Wi-Fi 5","802.11ax":"Wi-Fi 6"}}', 11, 2),
(113, 'Relaciona el término de seguridad inalámbrica con su nivel de protección.', 10, '{"pares":{"WPA3":"Alto","WEP":"Bajo"}}', 11, 2),
(114, 'Une el modo de operación de Wi-Fi con su función.', 11, '{"pares":{"Modo Infraestructura":"Los dispositivos se conectan a través de un Punto de Acceso","Modo Ad-hoc":"Los dispositivos se conectan directamente entre sí"}}', 11, 2);

-- =================================================================
-- Actividad 12: Capa de Aplicación
-- =================================================================
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(115, '¿Qué protocolo se utiliza para la sincronización de la hora en los dispositivos de una red?', 6, '{"opciones":["NTP","SNMP","DHCP"],"respuesta":"NTP"}', 12, 1),
(116, 'El protocolo para recibir correo electrónico y mantenerlo en el servidor es...', 7, '{"opciones":["IMAP","POP3","SMTP"],"respuesta":"IMAP"}', 12, 1),
(117, '¿Cuál es el puerto estándar para HTTPS?', 8, '{"opciones":["443","80","21"],"respuesta":"443"}', 12, 1),
(118, 'Une el protocolo con su puerto estándar.', 9, '{"pares":{"FTP":"21","DNS":"53"}}', 12, 2),
(119, 'Relaciona el protocolo de correo con su función principal.', 10, '{"pares":{"SMTP":"Envío de correo","POP3":"Descarga de correo del servidor"}}', 12, 2),
(120, 'Une el protocolo con el tipo de servicio que proporciona.', 11, '{"pares":{"DHCP":"Asignación dinámica de direcciones IP","HTTP":"Transferencia de contenido web"}}', 12, 2);

-- =================================================================
-- Actividad 13: SQL Avanzado
-- =================================================================
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(121, '¿Qué tipo de JOIN devuelve todas las filas de la tabla derecha y las coincidentes de la izquierda?', 6, '{"opciones":["RIGHT JOIN","LEFT JOIN","INNER JOIN"],"respuesta":"RIGHT JOIN"}', 13, 1),
(122, 'La cláusula `HAVING` se utiliza para filtrar...', 7, '{"opciones":["Grupos de filas después de una agregación","Filas individuales antes de una agregación","Resultados de una subconsulta"],"respuesta":"Grupos de filas después de una agregación"}', 13, 1),
(123, '¿Qué es una VISTA (VIEW) en SQL?', 8, '{"opciones":["Una consulta almacenada que se comporta como una tabla virtual","Una copia física de una tabla","Un índice para acelerar búsquedas"],"respuesta":"Una consulta almacenada que se comporta como una tabla virtual"}', 13, 1),
(124, 'Une el tipo de JOIN con su resultado.', 9, '{"pares":{"INNER JOIN":"Solo filas coincidentes en ambas tablas","FULL OUTER JOIN":"Todas las filas de ambas tablas, con NULLs donde no hay coincidencia"}}', 13, 2),
(125, 'Relaciona la función de ventana con su propósito.', 10, '{"pares":{"ROW_NUMBER()":"Asigna un número secuencial a cada fila","LAG()":"Accede a datos de una fila anterior en el mismo conjunto de resultados"}}', 13, 2),
(126, 'Une el objeto de la base de datos con su función.', 11, '{"pares":{"Índice (Index)":"Mejora la velocidad de las operaciones de recuperación de datos","Trigger":"Ejecuta una acción en respuesta a un evento en una tabla"}}', 13, 2);

-- =================================================================
-- Actividad 14: Transacciones y Concurrencia
-- =================================================================
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(127, '¿Qué propiedad ACID asegura que una vez que una transacción se confirma, los cambios son permanentes?', 6, '{"opciones":["Durabilidad","Atomicidad","Aislamiento"],"respuesta":"Durabilidad"}', 14, 1),
(128, 'Un "deadlock" (bloqueo mutuo) ocurre cuando...', 7, '{"opciones":["Dos o más transacciones esperan indefinidamente por recursos que las otras tienen","Una transacción se revierte automáticamente","Una transacción tarda demasiado en completarse"],"respuesta":"Dos o más transacciones esperan indefinidamente por recursos que las otras tienen"}', 14, 1),
(129, '¿Cuál es el nivel de aislamiento más estricto en SQL?', 8, '{"opciones":["Serializable","Read Committed","Repeatable Read"],"respuesta":"Serializable"}', 14, 1),
(130, 'Une la propiedad ACID con su significado.', 9, '{"pares":{"Atomicidad":"La transacción se ejecuta completamente o no se ejecuta en absoluto","Consistencia":"La transacción lleva la base de datos de un estado válido a otro"}}', 14, 2),
(131, 'Relaciona el comando de transacción con su acción.', 10, '{"pares":{"COMMIT":"Guarda los cambios permanentemente","ROLLBACK":"Descarta los cambios"}}', 14, 2),
(132, 'Une el problema de concurrencia con su descripción.', 11, '{"pares":{"Lectura sucia (Dirty Read)":"Una transacción lee datos que aún no han sido confirmados por otra","Lectura no repetible (Non-repeatable Read)":"Una transacción vuelve a leer datos y encuentra que han sido modificados"}}', 14, 2);

-- =================================================================
-- Actividad 15: Bases de Datos NoSQL
-- =================================================================
INSERT INTO Ejercicio (idEjercicio, enunciado, orden, metadata, Unidad_idUnidad, Tipo_ejercicio_idTipo_ejercicio) VALUES
(133, '¿Qué tipo de base de datos NoSQL es ideal para representar relaciones complejas, como redes sociales?', 6, '{"opciones":["De grafos","Documental","Clave-valor"],"respuesta":"De grafos"}', 15, 1),
(134, '¿Qué significa que un esquema sea "dinámico" en una base de datos documental?', 7, '{"opciones":["Los documentos en una misma colección pueden tener estructuras diferentes","El esquema no puede cambiar una vez definido","El esquema es definido por el usuario en tiempo de ejecución"],"respuesta":"Los documentos en una misma colección pueden tener estructuras diferentes"}', 15, 1),
(135, 'El teorema CAP establece que un sistema distribuido solo puede satisfacer dos de estas tres garantías: Consistencia, Disponibilidad y...', 8, '{"opciones":["Tolerancia a particiones","Transaccionalidad","Durabilidad"],"respuesta":"Tolerancia a particiones"}', 15, 1),
(136, 'Une el tipo de base de datos NoSQL con un ejemplo popular.', 9, '{"pares":{"Documental":"MongoDB","Clave-valor":"Redis"}}', 15, 2),
(137, 'Relaciona el modelo de datos NoSQL con su estructura principal.', 10, '{"pares":{"Orientada a columnas":"Datos almacenados en columnas en lugar de filas","De grafos":"Nodos, aristas y propiedades para representar y almacenar datos"}}', 15, 2),
(138, 'Une el concepto de escalabilidad con su descripción.', 11, '{"pares":{"Escalabilidad vertical (Scaling up)":"Añadir más recursos (CPU, RAM) a un único servidor","Escalabilidad horizontal (Scaling out)":"Añadir más servidores al sistema"}}', 15, 2);

-- =================================================================
-- FIN DEL SCRIPT
-- =================================================================
