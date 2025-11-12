<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pandoo - Inicio</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .navbar {
            background-color: #f8f9fa; /* Light background for navbar */
            box-shadow: 0 2px 4px rgba(0,0,0,.05);
        }
        .main-content {
            flex-grow: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 0;
        }
        .feature-section {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,.1);
            padding: 30px;
        }
        .feature-image {
            max-width: 100%;
            height: auto;
            border-radius: 4px;
        }
        .logo{
            margin-left:50px;
            width:120px;
            height:auto;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <!-- Placeholder para el logo -->
                <img src="${pageContext.request.contextPath}/images/Logo_pandoo.png" alt="Logo Pandoo" class="d-inline-block align-text-top me-2  logo">
          
            </a>
            <div class="d-flex">
                <a href="${pageContext.request.contextPath}/views/login.jsp" class="btn btn-outline-primary me-2">Iniciar Sesión</a>
                <a href="${pageContext.request.contextPath}/views/registro.jsp" class="btn btn-primary">Registrarse</a>
            </div>
        </div>
    </nav>

    <div class="container main-content">
        <div class="row justify-content-center align-items-center feature-section">
            <div class="col-md-6 text-center">
                <!-- Placeholder para la imagen -->
                <img src="${pageContext.request.contextPath}/images/imagen_dashboard.jpg" alt="Imagen Principal" class="feature-image">
            </div>
            <div class="col-md-6">
                <h2>Bienvenido a Pandoo</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                <p>Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus auctor mattis. Aliquam sit amet justo eu ante aliquet dictum. Etiam ac lacus. Vestibulum varius ac purus at ultrices.</p>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>