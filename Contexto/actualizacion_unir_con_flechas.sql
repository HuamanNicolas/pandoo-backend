-- =================================================================
-- SCRIPT DE ACTUALIZACIÓN PARA EJERCICIOS 'UNIR CON FLECHAS'
-- =================================================================
-- Este script modifica todos los ejercicios existentes del tipo 
-- 'Unir con flechas' (Tipo_ejercicio_idTipo_ejercicio = 2) para 
-- aumentar el número de pares a 4, incrementando su dificultad.
-- =================================================================

USE bdpandoo;

-- Ejercicio del script 'inserciones.sql'
UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Capa física', 'Transmite bits',
        'Capa de red', 'Encaminamiento de paquetes',
        'Capa de transporte', 'Segmentación y control de flujo',
        'Capa de sesión', 'Establece, gestiona y termina sesiones'
    )
) WHERE idEjercicio = 3;

-- Ejercicios del script 'insercion_ejercicios_adicionales.sql'
UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Algoritmo', 'Secuencia de pasos finitos',
        'Variable', 'Contenedor de datos con nombre',
        'Constante', 'Valor que no puede ser alterado',
        'Función', 'Bloque de código reutilizable'
    )
) WHERE idEjercicio = 11;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        '==', 'Comparación de igualdad',
        '=', 'Asignación de valor',
        '!=', 'Comparación de desigualdad',
        '+=', 'Asignación con adición'
    )
) WHERE idEjercicio = 14;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'while', 'Repetir mientras una condición sea verdadera',
        'for', 'Iterar sobre una colección de elementos',
        'if', 'Ejecutar un bloque si una condición es verdadera',
        'break', 'Terminar un bucle prematuramente'
    )
) WHERE idEjercicio = 16;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Anidamiento', 'Una estructura de control dentro de otra',
        'Recursión', 'Una función que se llama a sí misma',
        'Iteración', 'Repetición de un proceso (bucles)',
        'Condición', 'Expresión que evalúa a verdadero o falso'
    )
) WHERE idEjercicio = 19;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Estrella', 'Todos los nodos se conectan a un punto central',
        'Anillo', 'Los nodos forman un círculo cerrado',
        'Bus', 'Todos los nodos comparten un único canal de comunicación',
        'Malla', 'Cada nodo está conectado a uno o más nodos'
    )
) WHERE idEjercicio = 21;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'LAN', 'Local Area Network',
        'WAN', 'Wide Area Network',
        'MAN', 'Metropolitan Area Network',
        'PAN', 'Personal Area Network'
    )
) WHERE idEjercicio = 24;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'HTTP', 'Capa de Aplicación',
        'IP', 'Capa de Red',
        'TCP', 'Capa de Transporte',
        'Ethernet', 'Capa de Enlace de Datos'
    )
) WHERE idEjercicio = 26;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Capa de Transporte', 'Segmento',
        'Capa de Enlace de Datos', 'Trama',
        'Capa de Red', 'Paquete',
        'Capa Física', 'Bit'
    )
) WHERE idEjercicio = 29;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Uno a muchos', 'Un autor puede tener muchos libros',
        'Muchos a muchos', 'Estudiantes y cursos',
        'Uno a uno', 'Un ciudadano y su número de identificación único',
        'Clave Foránea', 'Campo que enlaza con una clave primaria'
    )
) WHERE idEjercicio = 31;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Tupla', 'Una fila en una tabla',
        'Atributo', 'Una columna en una tabla',
        'Relación', 'Una tabla con filas y columnas',
        'Dominio', 'Conjunto de valores permitidos para un atributo'
    )
) WHERE idEjercicio = 34;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'INSERT', 'Añadir nuevas filas',
        'UPDATE', 'Modificar filas existentes',
        'DELETE', 'Eliminar filas existentes',
        'SELECT', 'Recuperar datos de la base de datos'
    )
) WHERE idEjercicio = 36;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'INNER JOIN', 'Devuelve filas cuando hay coincidencia en ambas tablas',
        'LEFT JOIN', 'Devuelve todas las filas de la tabla izquierda',
        'RIGHT JOIN', 'Devuelve todas las filas de la tabla derecha',
        'FULL OUTER JOIN', 'Devuelve todas las filas cuando hay una coincidencia en una de las tablas'
    )
) WHERE idEjercicio = 39;

-- Ejercicios del script 'insercion_ejercicios_variados.sql'
UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Parámetro', 'Variable en la definición de la función',
        'Argumento', 'Valor pasado a la función al llamarla',
        'Retorno', 'Valor que una función devuelve al finalizar',
        'Invocación', 'Acto de llamar a una función para que se ejecute'
    )
) WHERE idEjercicio = 88;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'def', 'Palabra clave para definir una función',
        'return', 'Palabra clave para devolver un valor',
        'pass', 'Declaración nula, no hace nada',
        'lambda', 'Crea una función anónima en una línea'
    )
) WHERE idEjercicio = 89;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Posicional', 'Se pasa según el orden de los parámetros',
        'Nombrado (Keyword)', 'Se pasa especificando el nombre del parámetro',
        'Por defecto', 'Valor asignado al parámetro si no se pasa argumento',
        'Variable (*args)', 'Agrupa argumentos posicionales en una tupla'
    )
) WHERE idEjercicio = 90;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Herencia', 'Una clase adquiere propiedades de otra',
        'Encapsulamiento', 'Ocultar el estado interno y la complejidad',
        'Polimorfismo', 'Capacidad de tomar múltiples formas',
        'Abstracción', 'Mostrar solo la información esencial de un objeto'
    )
) WHERE idEjercicio = 94;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Clase', 'Plano o plantilla para crear objetos',
        'Objeto', 'Instancia de una clase',
        'Atributo', 'Característica o dato de un objeto (variable)',
        'Método', 'Comportamiento o acción de un objeto (función)'
    )
) WHERE idEjercicio = 95;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Método de instancia', 'Primer parámetro es `self`',
        'Método de clase', 'Primer parámetro es `cls`',
        'Método estático', 'No recibe un primer parámetro especial',
        'Constructor', 'Método `__init__` que inicializa un objeto'
    )
) WHERE idEjercicio = 96;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'try', 'Contiene el código que podría generar una excepción',
        'except', 'Maneja la excepción si ocurre en el bloque try',
        'finally', 'Se ejecuta siempre, haya o no excepción',
        'raise', 'Lanza una excepción de forma explícita'
    )
) WHERE idEjercicio = 100;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'ValueError', 'Argumento con tipo correcto pero valor inválido',
        'IndexError', 'Índice fuera de rango en una secuencia',
        'KeyError', 'Clave no encontrada en un diccionario',
        'TypeError', 'Operación aplicada a un objeto de tipo inapropiado'
    )
) WHERE idEjercicio = 101;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'raise', 'Lanza una excepción intencionadamente',
        'finally', 'Código que se ejecuta siempre, con o sin error',
        'assert', 'Comprueba una condición, si es falsa, lanza un AssertionError',
        'with', 'Simplifica la gestión de recursos como archivos'
    )
) WHERE idEjercicio = 102;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Cifrado', 'Convertir datos a un código para prevenir acceso no autorizado',
        'Autenticación', 'Verificar la identidad de un usuario',
        'Autorización', 'Conceder o denegar permisos para realizar una acción',
        'Integridad', 'Asegurar que los datos no han sido alterados'
    )
) WHERE idEjercicio = 106;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Virus', 'Se adjunta a un programa y se propaga al ejecutarlo',
        'Ransomware', 'Cifra archivos y pide un rescate para liberarlos',
        'Spyware', 'Recopila información de un dispositivo sin consentimiento',
        'Troyano', 'Se disfraza de software legítimo para infiltrarse'
    )
) WHERE idEjercicio = 107;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'VPN', 'Red Privada Virtual',
        'IDS', 'Sistema de Detección de Intrusos',
        'IPS', 'Sistema de Prevención de Intrusos',
        'WAF', 'Firewall de Aplicación Web'
    )
) WHERE idEjercicio = 108;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        '802.11ac', 'Wi-Fi 5',
        '802.11ax', 'Wi-Fi 6',
        '802.11n', 'Wi-Fi 4',
        '802.11g', 'Estándar más antiguo (Wi-Fi 3)'
    )
) WHERE idEjercicio = 112;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'WPA3', 'Nivel de seguridad alto y actual',
        'WEP', 'Nivel de seguridad bajo y obsoleto',
        'WPA2', 'Nivel de seguridad bueno, ampliamente utilizado',
        'Red abierta', 'Sin seguridad, no recomendado'
    )
) WHERE idEjercicio = 113;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Modo Infraestructura', 'Los dispositivos se conectan a través de un Punto de Acceso',
        'Modo Ad-hoc', 'Los dispositivos se conectan directamente entre sí',
        'Repetidor', 'Extiende el alcance de una red inalámbrica existente',
        'Puente (Bridge)', 'Conecta dos redes cableadas de forma inalámbrica'
    )
) WHERE idEjercicio = 114;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'FTP', 'Puerto 21',
        'DNS', 'Puerto 53',
        'HTTP', 'Puerto 80',
        'SMTP', 'Puerto 25'
    )
) WHERE idEjercicio = 118;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'SMTP', 'Envío de correo',
        'POP3', 'Descarga de correo del servidor (borrándolo)',
        'IMAP', 'Sincronización de correo con el servidor',
        'MIME', 'Extensión para enviar contenido no textual por correo'
    )
) WHERE idEjercicio = 119;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'DHCP', 'Asignación dinámica de direcciones IP',
        'HTTP', 'Transferencia de contenido web',
        'NTP', 'Sincronización de la hora del sistema',
        'SNMP', 'Gestión y monitoreo de dispositivos de red'
    )
) WHERE idEjercicio = 120;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'INNER JOIN', 'Solo filas coincidentes en ambas tablas',
        'FULL OUTER JOIN', 'Todas las filas de ambas tablas',
        'CROSS JOIN', 'Producto cartesiano de las dos tablas',
        'SELF JOIN', 'Unir una tabla consigo misma'
    )
) WHERE idEjercicio = 124;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'ROW_NUMBER()', 'Asigna un número secuencial único a cada fila',
        'LAG()', 'Accede a datos de una fila anterior',
        'LEAD()', 'Accede a datos de una fila posterior',
        'RANK()', 'Asigna un rango a cada fila, con empates'
    )
) WHERE idEjercicio = 125;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Índice (Index)', 'Mejora la velocidad de las consultas',
        'Trigger', 'Ejecuta una acción en respuesta a un evento (INSERT, UPDATE)',
        'Vista (View)', 'Consulta almacenada que actúa como tabla virtual',
        'Procedimiento Almacenado', 'Conjunto de comandos SQL que se pueden ejecutar como un solo programa'
    )
) WHERE idEjercicio = 126;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Atomicidad', 'La transacción se ejecuta completamente o no se ejecuta',
        'Consistencia', 'La base de datos permanece en un estado válido',
        'Aislamiento', 'Las transacciones concurrentes no interfieren entre sí',
        'Durabilidad', 'Los cambios confirmados son permanentes'
    )
) WHERE idEjercicio = 130;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'COMMIT', 'Guarda los cambios permanentemente',
        'ROLLBACK', 'Descarta los cambios de la transacción',
        'SAVEPOINT', 'Crea un punto dentro de una transacción al que se puede revertir',
        'BEGIN TRANSACTION', 'Inicia una nueva transacción'
    )
) WHERE idEjercicio = 131;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Lectura sucia', 'Lee datos no confirmados',
        'Lectura no repetible', 'Los datos leídos cambian en lecturas posteriores',
        'Lectura fantasma', 'Aparecen nuevas filas en lecturas posteriores',
        'Deadlock', 'Dos transacciones se bloquean mutuamente'
    )
) WHERE idEjercicio = 132;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Documental', 'MongoDB',
        'Clave-valor', 'Redis',
        'De grafos', 'Neo4j',
        'Orientada a columnas', 'Cassandra'
    )
) WHERE idEjercicio = 136;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Orientada a columnas', 'Datos almacenados en columnas en lugar de filas',
        'De grafos', 'Nodos y aristas para representar relaciones',
        'Clave-valor', 'Diccionario simple para almacenar datos',
        'Documental', 'Datos almacenados en documentos flexibles como JSON'
    )
) WHERE idEjercicio = 137;

UPDATE Ejercicio SET metadata = JSON_OBJECT(
    'pares', JSON_OBJECT(
        'Escalabilidad vertical', 'Añadir más potencia (CPU, RAM) a un servidor existente',
        'Escalabilidad horizontal', 'Añadir más servidores al sistema',
        'Disponibilidad', 'El sistema sigue funcionando a pesar de fallos',
        'Consistencia Eventual', 'Los datos se sincronizarán en algún momento'
    )
) WHERE idEjercicio = 138;

-- =================================================================
-- FIN DEL SCRIPT
-- =================================================================
