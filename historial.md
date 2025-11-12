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
    *   **Implementación de Login/Registro:**
        *   Se creó la entidad JPA `Usuario.java` para mapear la tabla `User`.
        *   Se implementó el EJB `UsuarioDAO` para las operaciones de persistencia de usuarios.
        *   Se crearon las vistas `registro.jsp` y `dashboard.jsp`.
        *   Se implementaron los servlets `RegistroServlet`, `LoginServlet` y `LogoutServlet` para manejar la lógica de negocio.
    *   **Corrección Visual:**
        *   Se revirtió `index.jsp` a su estado visual original, mostrando una imagen y texto de bienvenida.
        *   Se creó la vista `login.jsp` para alojar el formulario de inicio de sesión de forma separada.
        *   Se actualizaron los botones del navbar en `index.jsp` para redirigir a las páginas de login y registro.