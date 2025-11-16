# Historial del Proyecto

## Contexto Inicial (10 de noviembre de 2025)

El usuario ha solicitado el desarrollo de un proyecto web utilizando las siguientes tecnologías y herramientas:

*   **Lenguaje de Programación:** Java (Versión 11)
*   **IDE:** NetBeans (Versión 26)
*   **Framework/Plataforma:** Jakarta EE (Versión 10)
*   **Herramienta de Construcción:** Maven
*   **Servidor de Aplicaciones:** GlassFish
*   **Base de Datos:** MySQL

Se ha proporcionado una carpeta `Contexto/Material teorico` que contiene documentos PDF (`Tema 4 - Persistencia.pdf`, `Tema 5 - Enterprise Beans.pdf`, `Tema 6 - JPQL.pdf`). Este material debe ser utilizado como apoyo teórico durante el desarrollo del proyecto.
*   Adicionalmente, en la carpeta `Contexto` se encuentra el archivo `script inicial.sql` con la estructura de la base de datos `bdpandoo`.

Mi rol es actuar como un especialista en desarrollo web con Java, utilizando mis capacidades y conocimientos generales para asistir en el proyecto.

---

## Hitos del Proyecto

*   **10 de noviembre de 2025:**
    *   Se ha creado la estructura inicial del proyecto `pandoo` a través del IDE de NetBeans.
    *   Se ha compilado (`Clean and Build`) y desplegado (`Run`) el proyecto con éxito en el servidor GlassFish. La aplicación base es accesible desde el navegador.

*   **11 de noviembre de 2025:**
    *   **Control de Versiones:** Se ha inicializado un repositorio Git en el proyecto. Se configuró un archivo `.gitignore` y se realizó el "commit" inicial. El proyecto está listo para ser sincronizado con un repositorio remoto en GitHub.
    *   **Creación de la Vista Principal:** Se ha creado el archivo `index.jsp` como vista de inicio, utilizando Bootstrap para el diseño. Incluye un navbar y una sección de contenido principal con placeholders para logo e imagen.
    *   **Configuración del Despliegue:** Se modificó el archivo `web.xml` para establecer `index.jsp` como la página de bienvenida predeterminada de la aplicación.
    *   **Estructura del Proyecto:** Se crearon carpetas y paquetes adicionales para organizar el proyecto siguiendo las mejores prácticas y el patrón MVC:
        *   `src/main/webapp/`: `css/`, `js/`, `images/`, `WEB-INF/views/`
        *   `src/main/java/com/mycompany/pandoo/`: `model/`, `dao/`, `beans/`, `servlets/`
    *   **Corrección de Referencias de Imagen:** Se corrigieron las referencias de imagen en `index.jsp`, ajustando la extensión del archivo del logo (`Logo_pandoo.jpg` a `Logo_pandoo.png`) y corrigiendo la sintaxis de la ruta de contexto para la imagen principal.
    *   **Configuración de la Base de Datos:**
        *   Se añadió la dependencia del conector de MySQL (`mysql-connector-java`) al `pom.xml`.
        *   Se configuró un **JDBC Connection Pool** y un **JDBC Resource** en GlassFish para conectar con la base de datos `bdpandoo`.
        *   Se solucionó un problema de conexión SSL añadiendo el parámetro `useSSL=false` a la URL de conexión.
        *   Se actualizó el archivo `persistence.xml` para usar el JTA data source (`jdbc/pandoo`) proporcionado por GlassFish, permitiendo que el contenedor gestione las transacciones de la base de datos.

*   **12 de noviembre de 2025:**
    *   **Implementación de Inscripción a Cursos:**
        *   Se crearon las entidades JPA para `Curso`, `Actividad` e `Inscripcion`, y se actualizaron las relaciones en la entidad `Usuario`.
        *   Se implementaron los DAOs `CursoDAO` e `InscripcionDAO`.
        *   Se crearon los servlets `InscripcionServlet` y `CursoServlet` para manejar la lógica de inscripción y visualización de cursos.
        *   Se modificó el `dashboard.jsp` para mostrar cursos disponibles y cursos inscritos.
        *   Se creó la vista `curso.jsp` para mostrar las actividades de un curso.
    *   **Corrección de Error de Persistencia:** Se solucionó un `SQLException` al inscribir un curso, causado por la falta de un valor para `fechaInscripcion`. Se ajustó la entidad `Inscripcion` y el servlet correspondiente para manejar la fecha programáticamente.
    *   **Corrección de Lógica de Inscripción:**
        *   Se solucionó un error que permitía a un usuario inscribirse varias veces en el mismo curso. Se añadió un método `existeInscripcion` en el `InscripcionDAO` y se utilizó en el `InscripcionServlet` para validar antes de crear una nueva inscripción.
        *   Se corrigió el error de login que ocurría por datos duplicados, modificando la consulta en `UsuarioDAO` para que devuelva resultados distintos (`SELECT DISTINCT`).
        *   Se resolvió el problema de actualización del dashboard, que no mostraba los cursos recién inscritos. La solución fue inicializar la lista de inscripciones en la entidad `Usuario` y añadir manualmente la nueva inscripción al objeto `usuario` de la sesión, evitando una nueva consulta a la base de datos.
    *   **Implementación de Login/Registro:**
        *   Se creó la entidad JPA `Usuario.java` para mapear la tabla `User`.
        *   Se implementó el EJB `UsuarioDAO` para las operaciones de persistencia de usuarios.
        *   Se crearon las vistas `registro.jsp` y `dashboard.jsp`.
        *   Se implementaron los servlets `RegistroServlet`, `LoginServlet` y `LogoutServlet` para manejar la lógica de negocio.
    *   **Corrección Visual:**
        *   Se revirtió `index.jsp` a su estado visual original, mostrando una imagen y texto de bienvenida.
        *   Se creó la vista `login.jsp` para alojar el formulario de inicio de sesión de forma separada.
        *   Se actualizaron los botones del navbar en `index.jsp` para redirigir a las páginas de login y registro.

*   **15 de noviembre de 2025:**
    *   **Refactorización de la Capa de Acceso a Datos:**
        *   Se corrigió el patrón de diseño de la capa de persistencia, reemplazando el patrón DAO (Data Access Object) por el patrón `Abstract Facade`.
        *   Se creó la clase genérica `AbstractFacade.java` en el nuevo paquete `com.mycompany.pandoo.facade`.
        *   Se crearon las clases `UsuarioFacade`, `CursoFacade` e `InscripcionFacade` como EJBs `@Stateless` que heredan de `AbstractFacade`.
        *   Se migraron las consultas personalizadas de los antiguos DAOs a los nuevos Facades.
        *   Se actualizaron los servlets (`LoginServlet`, `RegistroServlet`, `CursoServlet`, `InscripcionServlet`) para inyectar y utilizar los nuevos Facades.
        *   Se eliminaron los archivos `UsuarioDAO.java`, `CursoDAO.java` e `InscripcionDAO.java`, así como el paquete `dao`.
    *   **Implementación de la Funcionalidad de Ejercicios:**
        *   Se añadió la dependencia de Gson al `pom.xml` para el manejo de JSON.
        *   Se creó la entidad JPA `Progreso.java` y se actualizó `Ejercicio.java` para incluir el campo `metadata` (JSON).
        *   Se creó el `ProgresoFacade.java` para la persistencia del progreso.
        *   Se implementó el `EjercicioServlet.java` para gestionar el flujo completo de los ejercicios (inicio, mostrar, comprobar respuesta, siguiente, resumen).
        *   Se creó `ejercicio.jsp` para renderizar dinámicamente los ejercicios según su tipo (Multiple Choice, Completar texto, Unir con flechas).
        *   Se creó `resumen.jsp` para mostrar el puntaje final del usuario y guardar el progreso de los ejercicios respondidos correctamente.
        *   Se añadió un botón "Comenzar Ejercicios" en `actividad.jsp` para iniciar la secuencia de ejercicios.
    *   **Temas Pendientes / Mejoras:**
        *   La interfaz de usuario para los ejercicios de tipo "Unir con flechas" y "Completar texto" necesita ser mejorada para ofrecer una experiencia más intuitiva y coherente al usuario. Actualmente, el usuario debe "adivinar" el formato de la respuesta esperada.
        *   Considerar una implementación más robusta para la validación de "Unir con flechas" que permita diferentes órdenes o formatos de entrada.