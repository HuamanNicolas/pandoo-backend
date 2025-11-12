<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.pandoo.model.Usuario"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dashboard - Pandoo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Pandoo</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/LogoutServlet">Cerrar Sesión</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container mt-5">
        <% 
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            if (usuario != null) {
        %>
            <div class="alert alert-success" role="alert">
                <h4 class="alert-heading">¡Bienvenido, <%= usuario.getNombre() %>!</h4>
                <p>Has iniciado sesión correctamente.</p>
                <hr>
                <p class="mb-0">Tu nombre de usuario es: <strong><%= usuario.getUsername() %></strong></p>
            </div>
        <% 
            } else {
                // Si no hay usuario en la sesión, redirigir al login
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        %>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
