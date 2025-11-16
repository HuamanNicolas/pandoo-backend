<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Actividad - Pandoo</title>
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
        <h2>Ejercicios de la Actividad: ${actividad.nombre}</h2>
        <hr/>
        
        <c:if test="${not empty actividad.ejercicios}">
            <div class="list-group">
                <c:forEach var="ejercicio" items="${actividad.ejercicios}" varStatus="loop">
                    <div class="list-group-item">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">Ejercicio ${loop.count}</h5>
                        </div>
                        <p class="mb-1">${ejercicio.enunciado}</p>
                        <small>Tipo: ${ejercicio.tipoEjercicio.nombre}</small>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        
        <c:if test="${empty actividad.ejercicios}">
            <div class="alert alert-info" role="alert">
                No hay ejercicios disponibles para esta actividad.
            </div>
        </c:if>

        <div class="mt-4">
            <c:if test="${not empty actividad.ejercicios}">
                <a href="${pageContext.request.contextPath}/EjercicioServlet?action=start&idActividad=${actividad.id}" class="btn btn-primary">Comenzar Ejercicios</a>
            </c:if>
            <a href="${pageContext.request.contextPath}/CursoServlet?action=view&id=${actividad.curso.id}" class="btn btn-secondary">Volver al Curso</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
