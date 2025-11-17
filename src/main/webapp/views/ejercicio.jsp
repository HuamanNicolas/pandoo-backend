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
            <div class="progress-bar" role="progressbar" style="width: ${(ejercicioIndex / totalEjercicios) * 100}%" aria-valuenow="${ejercicioIndex}" aria-valuemin="0" aria-valuemax="${totalEjercicios}"></div>
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
                    <p class="text-muted">Haz clic en un elemento de cada columna para unirlos con una línea. Vuelve a hacer clic en un elemento unido para eliminar su conexión.</p>
                    <div id="unir-con-flechas-container" class="row">
                        <div id="columna1" class="col-md-5">
                            <c:forEach var="item" items="${columna1}" varStatus="loop">
                                <div class="list-group-item list-group-item-action" id="col1_${loop.index}" data-value="${item}">${item}</div>
                            </c:forEach>
                        </div>
                        <div class="col-md-2"></div>
                        <div id="columna2" class="col-md-5">
                             <c:forEach var="item" items="${columna2}" varStatus="loop">
                                <div class="list-group-item list-group-item-action" id="col2_${loop.index}" data-value="${item}">${item}</div>
                            </c:forEach>
                        </div>
                    </div>
                    <input type="hidden" name="respuestaUsuario" id="respuestaUsuario">
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
    <script src="${pageContext.request.contextPath}/js/leader-line.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            if (document.getElementById('unir-con-flechas-container')) {
                const col1 = document.getElementById('columna1');
                const col2 = document.getElementById('columna2');
                let selected_item = null;
                let lines = [];
                let connections = [];

                function findConnection(element) {
                    return connections.find(conn => conn.start.id === element.id || conn.end.id === element.id);
                }

                function removeConnection(element) {
                    const connIndex = connections.findIndex(conn => conn.start.id === element.id || conn.end.id === element.id);
                    if (connIndex > -1) {
                        lines[connIndex].remove();
                        lines.splice(connIndex, 1);
                        connections.splice(connIndex, 1);
                    }
                }

                function updateHiddenInput() {
                    const answer = connections.map(conn => {
                        const val1 = conn.start.closest('#columna1') ? conn.start.dataset.value : conn.end.dataset.value;
                        const val2 = conn.start.closest('#columna2') ? conn.start.dataset.value : conn.end.dataset.value;
                        return [val1, val2];
                    });
                    document.getElementById('respuestaUsuario').value = JSON.stringify(answer);
                }

                [...col1.children, ...col2.children].forEach(item => {
                    item.addEventListener('click', function (e) {
                        const clickedItem = e.target;

                        // Si el item ya está conectado, lo desconectamos
                        const existingConnection = findConnection(clickedItem);
                        if (existingConnection) {
                            removeConnection(clickedItem);
                            updateHiddenInput();
                            clickedItem.classList.remove('active');
                            // Deseleccionar el otro item del par
                            const otherItem = existingConnection.start.id === clickedItem.id ? existingConnection.end : existingConnection.start;
                            otherItem.classList.remove('active');
                            if (selected_item === otherItem) {
                                selected_item = null;
                            }
                            return;
                        }

                        // Si no hay nada seleccionado, seleccionamos el item actual
                        if (!selected_item) {
                            selected_item = clickedItem;
                            clickedItem.classList.add('active');
                        } else {
                            // Si el item seleccionado es de la misma columna que el actual, lo cambiamos
                            if (selected_item.parentElement.id === clickedItem.parentElement.id) {
                                selected_item.classList.remove('active');
                                selected_item = clickedItem;
                                clickedItem.classList.add('active');
                            } else {
                                // Si son de columnas diferentes, creamos la línea
                                const line = new LeaderLine(selected_item, clickedItem, {
                                    color: 'rgba(0, 123, 255, 0.8)',
                                    size: 4,
                                    path: 'fluid'
                                });
                                lines.push(line);
                                connections.push({start: selected_item, end: clickedItem});

                                selected_item.classList.remove('active');
                                selected_item = null;
                                updateHiddenInput();
                            }
                        }
                    });
                });
                
                // Actualizar las líneas al cambiar el tamaño de la ventana
                window.addEventListener('resize', function() {
                    lines.forEach(line => line.position());
                });

                // Si se muestra una alerta de resultado, la pregunta ha sido respondida.
                // Deshabilitamos el contenedor para evitar más interacciones.
                if (document.querySelector('.alert')) {
                    const container = document.getElementById('unir-con-flechas-container');
                    if (container) {
                        container.style.pointerEvents = 'none';
                        // Opcional: cambiar el estilo para que parezca deshabilitado
                        container.style.opacity = '0.6'; 
                    }
                }
            }
        });
    </script>
    <style>
        .list-group-item-action.active {
            background-color: #0d6efd;
            color: white;
        }
        #unir-con-flechas-container .list-group-item {
            cursor: pointer;
            margin-bottom: 5px; /* Añadir espacio entre los elementos */
        }
    </style>
</body>
</html>
