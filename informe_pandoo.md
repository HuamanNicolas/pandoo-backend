
# Informe Final del Trabajo Práctico Integrador

---

## 1. Carátula

*   **Alumno:** `[Nombre del Alumno]`
*   **Título del Proyecto:** Pandoo - Plataforma Educativa Interactiva
*   **Asignatura:** Desarrollo Backend III
*   **Fecha:** 18 de noviembre de 2025

---

## 2. Introducción

Pandoo es una aplicación web completa y operativa desarrollada sobre la plataforma Jakarta EE. Su objetivo principal es ofrecer una solución informática para la gestión y participación en cursos de formación online. La plataforma permite a los usuarios registrarse, iniciar sesión, inscribirse en diferentes cursos y completar actividades y ejercicios interactivos para validar sus conocimientos.

El proyecto surge como una instancia para consolidar los conocimientos adquiridos en la asignatura, aplicando tecnologías web modernas en un problema del mundo real. Se busca no solo implementar los requerimientos funcionales, sino también promover la creatividad, la autonomía y las buenas prácticas de desarrollo, como el uso de patrones de diseño y el control de versiones.

---

## 3. Desarrollo

### a) Requisitos Funcionales Implementados

La plataforma Pandoo soporta las siguientes funcionalidades clave:

*   **Gestión de Usuarios:**
    *   Registro de nuevos usuarios.
    *   Autenticación (Login) y cierre de sesión (Logout).
    *   Creación de un perfil de usuario básico.

*   **Gestión de Cursos:**
    *   Visualización de los cursos disponibles en la plataforma.
    *   Inscripción y desinscripción de usuarios en los cursos.
    *   Validación para evitar inscripciones duplicadas en un mismo curso.

*   **Visualización de Contenido:**
    *   Dashboard personalizado que muestra los cursos en los que el usuario está inscrito.
    *   Acceso al contenido de cada curso, organizado en actividades o unidades.

*   **Ejercicios Interactivos:**
    *   Sistema de evaluación a través de ejercicios al final de cada actividad.
    *   Soporte para diferentes tipos de ejercicios:
        *   Opción Múltiple (Multiple Choice).
        *   Completar el texto.
        *   Unir conceptos con flechas (interfaz gráfica).
    *   Corrección automática de las respuestas.
    *   Registro del progreso del usuario, guardando los ejercicios completados correctamente.
    *   Resumen final con el puntaje obtenido.

### b) Modo de Uso

1.  **Registro y Acceso:** El usuario accede a la página principal y puede optar por registrarse (si es nuevo) o iniciar sesión con sus credenciales.
2.  **Dashboard:** Una vez autenticado, el usuario es redirigido a su dashboard personal, donde ve un resumen de su actividad y los cursos en los que está inscrito. Desde aquí también puede explorar y añadir nuevos cursos.
3.  **Inscripción a Cursos:** En la sección de cursos disponibles, el usuario puede inscribirse a cualquiera de ellos con un solo clic. El curso aparecerá inmediatamente en su dashboard.
4.  **Navegación del Curso:** Al hacer clic en un curso inscrito, el usuario accede a la lista de actividades que lo componen.
5.  **Realización de Ejercicios:** Al seleccionar una actividad, el usuario puede comenzar los ejercicios asociados. La aplicación le presentará una serie de preguntas interactivas.
6.  **Comprobación y Progreso:** El usuario responde a cada ejercicio y puede comprobar su respuesta. La plataforma valida la solución y le permite avanzar al siguiente. Para el ejercicio de "Unir con flechas", el usuario debe dibujar líneas entre los conceptos correctos.
7.  **Finalización y Resumen:** Al completar todos los ejercicios de una actividad, se muestra una pantalla de resumen con el puntaje final. El progreso de los ejercicios correctos se guarda en la base de datos.

### c) Representación Visual

*(Nota: En esta sección se deben insertar las capturas de pantalla, esquemas o mockups que ilustren la interfaz y la navegación de la aplicación, como se describe en los puntos anteriores).*

*   `[Insertar aquí captura de la página de Login/Registro]`
*   `[Insertar aquí captura del Dashboard con cursos inscritos y disponibles]`
*   `[Insertar aquí captura de la vista de una Actividad con sus ejercicios]`
*   `[Insertar aquí captura del ejercicio de Multiple Choice]`
*   `[Insertar aquí captura del ejercicio interactivo de Unir con Flechas]`
*   `[Insertar aquí captura de la pantalla de Resumen de ejercicios]`

---

## 4. Especificaciones Técnicas

### a) Diagrama Entidad-Relación

La base de datos `bdpandoo` en MySQL se compone de las siguientes entidades principales:

*   **User:** Almacena la información de los usuarios registrados (nombre, email, credenciales).
*   **Curso:** Contiene la información de los cursos ofrecidos (nombre, imagen, etc.).
*   **Actividad:** Representa una unidad o módulo dentro de un `Curso`.
*   **Ejercicio:** Define una pregunta o tarea específica dentro de una `Actividad`. Tiene un tipo y metadatos (en formato JSON) que describen su contenido y respuesta correcta.
*   **Tipo_ejercicio:** Tabla catálogo que define los tipos de ejercicios (ej. "Multiple Choice", "Unir con flechas").
*   **Inscripcion:** Tabla intermedia que gestiona la relación muchos a muchos entre `User` y `Curso`. Registra la fecha en que un usuario se inscribe a un curso.
*   **Progreso:** Registra cada vez que un `User` completa correctamente un `Ejercicio`, guardando la fecha del logro.

Las relaciones son las siguientes:
*   Un `Curso` tiene muchas `Actividad`es.
*   Una `Actividad` tiene muchos `Ejercicio`s.
*   Un `Ejercicio` tiene un `Tipo_ejercicio`.
*   Un `User` puede tener muchas `Inscripcion`es y un `Curso` puede tener muchas `Inscripcion`es.
*   Un `User` puede tener muchos `Progreso`s y un `Ejercicio` puede estar en muchos `Progreso`s.

### b) Modelo Orientado a Objetos

El modelo de datos se mapea a clases Java (Entidades JPA) dentro del paquete `com.mycompany.pandoo.model`:

*   **`Usuario.java`:** Mapea la tabla `User`. Contiene una lista de sus `Inscripcion`es.
*   **`Curso.java`:** Mapea la tabla `Curso`. Contiene listas de `Actividad`es e `Inscripcion`es asociadas.
*   **`Actividad.java`:** Mapea la tabla `Actividad`. Contiene una referencia a su `Curso` padre y una lista de sus `Ejercicio`s.
*   **`Ejercicio.java`:** Mapea la tabla `Ejercicio`. Incluye referencias a su `Actividad` y `TipoEjercicio`, y un campo `metadata` de tipo `String` para almacenar el JSON.
*   **`TipoEjercicio.java`:** Mapea la tabla `Tipo_ejercicio`.
*   **`Inscripcion.java`:** Mapea la tabla `Inscripcion`, representando la inscripción de un `Usuario` a un `Curso`.
*   **`Progreso.java`:** Mapea la tabla `Progreso`, vinculando un `Usuario` con un `Ejercicio` completado.

Estas clases utilizan anotaciones de Jakarta Persistence (JPA) como `@Entity`, `@Table`, `@Id`, `@Column`, `@ManyToOne` y `@OneToMany` para definir el mapeo objeto-relacional.

### c) Descripción Tecnológica

El proyecto Pandoo se ha desarrollado siguiendo una arquitectura de 3 capas, aprovechando las tecnologías y patrones del ecosistema Jakarta EE.

*   **Tecnologías Utilizadas:**
    *   **Lenguaje:** Java 11
    *   **Plataforma:** Jakarta EE 10
    *   **Servidor de Aplicaciones:** GlassFish
    *   **Base de Datos:** MySQL 8
    *   **Frameworks y Librerías:**
        *   **Jakarta Servlet:** Para manejar las peticiones HTTP y controlar el flujo de la aplicación (Capa de Controlador).
        *   **JavaServer Pages (JSP):** Para la creación de las vistas dinámicas (Capa de Presentación).
        *   **Jakarta Persistence (JPA):** Para el mapeo objeto-relacional y la gestión de la persistencia de datos.
        *   **Enterprise JavaBeans (EJB):** Utilizados como componentes de negocio `@Stateless` para implementar la lógica de la capa de acceso a datos.
        *   **Bootstrap:** Para el diseño responsive y la maquetación de las vistas.
        *   **Gson:** Para la manipulación de datos en formato JSON, especialmente en los ejercicios.
        *   **Leader-Line.js:** Librería de JavaScript para la funcionalidad de "unir con flechas".
    *   **Herramientas de Desarrollo:**
        *   **IDE:** Apache NetBeans
        *   **Build Tool:** Apache Maven
        *   **Control de Versiones:** Git

*   **Arquitectura y Enfoque Adoptado:**
    1.  **Capa de Presentación:** Compuesta por las vistas (`.jsp`) y un `navbar` común. Las vistas renderizan la información proporcionada por los controladores y capturan las interacciones del usuario.
    2.  **Capa de Controlador (Servlets):** Los Servlets (`LoginServlet`, `CursoServlet`, `EjercicioServlet`, etc.) actúan como el cerebro de la aplicación. Reciben las peticiones del cliente, procesan los datos, interactúan con la capa de negocio (Facades) y redirigen al usuario a la vista apropiada.
    3.  **Capa de Negocio y Persistencia (Facades):** Se implementó el patrón **Abstract Facade** para encapsular la lógica de acceso a datos. Se crearon EJBs `@Stateless` (`UsuarioFacade`, `CursoFacade`, etc.) que heredan de una clase base `AbstractFacade`. Estos beans utilizan el `EntityManager` de JPA para realizar las operaciones CRUD y las consultas JPQL a la base de datos. El contenedor de EJB (GlassFish) gestiona el ciclo de vida y las transacciones de estos componentes.
    4.  **Configuración de Persistencia:** El archivo `persistence.xml` está configurado para usar un **JTA Data Source** (`jdbc/pandoo`), delegando la gestión de las conexiones y transacciones al servidor de aplicaciones GlassFish, lo que asegura un manejo robusto y eficiente de la base de datos.

---

## 5. Conclusiones

El desarrollo del proyecto Pandoo ha sido una experiencia de aprendizaje integral. El mayor desafío fue la correcta integración de las distintas tecnologías de Jakarta EE, pasando de un enfoque inicial con DAOs manuales a una arquitectura más robusta y estándar de la industria utilizando EJB y el patrón Facade.

La implementación de los ejercicios interactivos, especialmente la funcionalidad de "unir con flechas", representó un reto interesante que requirió combinar lógica de backend en Java con manipulación del DOM y librerías de JavaScript en el frontend. Resolver problemas como la codificación de caracteres (UTF-8) fue crucial para garantizar la funcionalidad.

El proceso de desarrollo, documentado en `historial.md`, refleja una evolución constante, desde la configuración inicial del entorno hasta la refactorización y mejora de funcionalidades. Se ha logrado construir una aplicación web funcional y completa que cumple con todos los objetivos propuestos, sentando una base sólida sobre la cual se podrían construir futuras mejoras, como la creación de cursos por parte de los usuarios o la mejora de la interfaz de los ejercicios restantes.
