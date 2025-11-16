<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.pandoo.model.Curso"%>
<%@page import="com.mycompany.pandoo.model.Actividad"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Curso - Pandoo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Pandoo</a>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/CursoServlet?action=list">Volver al Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/LogoutServlet">Cerrar Sesión</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container mt-5">
        <% 
            Curso curso = (Curso) request.getAttribute("curso");
            if (curso != null) {
                List<Actividad> actividades = curso.getActividades();
        %>
            <h2><%= curso.getNombre() %></h2>
            <p>A continuación se listan las actividades del curso.</p>
            
            <ul class="list-group">
                <% for (Actividad actividad : actividades) { %>
                    <li class="list-group-item"><%= actividad.getNombre() %></li>
                <% } %>
            </ul>
        <% 
            } else {
        %>
            <div class="alert alert-danger" role="alert">
                No se pudo cargar la información del curso.
            </div>
        <%
            }
        %>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
