<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <c:if test="${not empty curso}">
            <h2>${curso.nombre}</h2>
            <p>A continuación se listan las actividades del curso.</p>
            
            <div class="list-group">
                <c:forEach var="actividad" items="${curso.actividades}">
                    <a href="${pageContext.request.contextPath}/ActividadServlet?id=${actividad.id}" class="list-group-item list-group-item-action">
                        ${actividad.nombre}
                    </a>
                </c:forEach>
            </div>
        </c:if>
        <c:if test="${empty curso}">
            <div class="alert alert-danger" role="alert">
                No se pudo cargar la información del curso.
            </div>
        </c:if>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
