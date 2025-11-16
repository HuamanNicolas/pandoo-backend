<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ejercicio - Pandoo</title>
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
        <div class="progress mb-4">
            <div class="progress-bar" role="progressbar" style="width: ${((ejercicioIndex) / totalEjercicios) * 100}%" aria-valuenow="${ejercicioIndex}" aria-valuemin="0" aria-valuemax="${totalEjercicios}"></div>
        </div>

        <h3>Ejercicio ${ejercicioIndex + 1} de ${totalEjercicios}</h3>
        <hr>
        <h4 class="mb-4">${ejercicio.enunciado}</h4>

        <form method="post" action="${pageContext.request.contextPath}/EjercicioServlet?action=check">
            
            <c:set var="metadata" value="${requestScope.metadata}" />

            <c:choose>
                <c:when test="${ejercicio.tipoEjercicio.nombre == 'Multiple Choice'}">
                    <c:forEach var="opcion" items="${metadata.opciones}">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="respuesta" id="opcion_${loop.index}" value="${opcion}" <c:if test="${isAnswered}">disabled</c:if> required>
                            <label class="form-check-label" for="opcion_${loop.index}">
                                ${opcion}
                            </label>
                        </div>
                    </c:forEach>
                </c:when>
                
                <c:when test="${ejercicio.tipoEjercicio.nombre == 'Completar texto'}">
                    <input type="text" name="respuesta" class="form-control" <c:if test="${isAnswered}">disabled</c:if> required>
                </c:when>

                <c:when test="${ejercicio.tipoEjercicio.nombre == 'Unir con flechas'}">
                    <p class="text-muted">Unir con flechas (simplificado): Escribe la pareja correcta para cada elemento.</p>
                     <c:forEach var="par" items="${metadata.pares}">
                         <div class="mb-3 row">
                            <label class="col-sm-4 col-form-label">${par.key}</label>
                            <div class="col-sm-8">
                                <input type="text" name="respuesta_${par.key.replace(' ', '_')}" class="form-control" <c:if test="${isAnswered}">disabled</c:if> required>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
            </c:choose>

            <c:if test="${!isAnswered}">
                <button type="submit" class="btn btn-primary mt-3">Comprobar</button>
            </c:if>
        </form>

        <c:if test="${isAnswered}">
            <div class="mt-4">
                <c:if test="${isCorrect}">
                    <div class="alert alert-success">
                        <h4 class="alert-heading">¡Correcto!</h4>
                    </div>
                </c:if>
                <c:if test="${!isCorrect}">
                    <div class="alert alert-danger">
                        <h4 class="alert-heading">Incorrecto</h4>
                        <p>Tu respuesta no fue la correcta. ¡Sigue intentando!</p>
                    </div>
                </c:if>
                <a href="${pageContext.request.contextPath}/EjercicioServlet?action=next" class="btn btn-info">Siguiente Ejercicio</a>
            </div>
        </c:if>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
