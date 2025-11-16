<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Resumen - Pandoo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Pandoo</a>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/CursoServlet?action=list">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/LogoutServlet">Cerrar Sesión</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="card text-center">
            <div class="card-header">
                ¡Fin de la Actividad!
            </div>
            <div class="card-body">
                <h5 class="card-title">Tu Resumen</h5>
                <p class="card-text">Has completado la actividad.</p>
                <h1>Tu puntaje: <span class="badge bg-success">${score} / ${total}</span></h1>
                <p class="mt-3">Tu progreso ha sido guardado.</p>
                <a href="${pageContext.request.contextPath}/CursoServlet?action=view&id=${idCurso}" class="btn btn-primary">Volver al Curso</a>
            </div>
            <div class="card-footer text-muted">
                ¡Sigue aprendiendo!
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
