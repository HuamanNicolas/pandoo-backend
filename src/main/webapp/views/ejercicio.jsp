<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio - Pandoo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --electric-green: #00ff88;
            --dark-blue: #0a1929;
            --accent-blue: #00d4ff;
            --gradient-start: #0a1929;
            --gradient-end: #132f4c;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            background: linear-gradient(135deg, var(--gradient-start) 0%, var(--gradient-end) 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #fff;
            position: relative;
            overflow-x: hidden;
        }
        
        body::before {
            content: '';
            position: fixed;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(0,255,136,0.1) 0%, transparent 50%);
            animation: pulse 15s ease-in-out infinite;
            pointer-events: none;
        }
        
        @keyframes pulse {
            0%, 100% { transform: scale(1) rotate(0deg); opacity: 0.3; }
            50% { transform: scale(1.1) rotate(180deg); opacity: 0.5; }
        }
        
        .navbar {
            background: rgba(10, 25, 41, 0.95) !important;
            backdrop-filter: blur(10px);
            border-bottom: 2px solid rgba(0, 255, 136, 0.2);
            padding: 1rem 0;
            box-shadow: 0 4px 30px rgba(0, 255, 136, 0.1);
        }
        
        .navbar-brand {
            font-size: 1.8rem;
            font-weight: 700;
            background: linear-gradient(45deg, var(--electric-green), var(--accent-blue));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-shadow: 0 0 30px rgba(0, 255, 136, 0.5);
            letter-spacing: 2px;
        }
        
        .nav-link {
            color: #fff !important;
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
            padding: 0.5rem 1rem !important;
        }
        
        .nav-link::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            width: 0;
            height: 2px;
            background: var(--electric-green);
            transition: all 0.3s ease;
            transform: translateX(-50%);
        }
        
        .nav-link:hover::after {
            width: 80%;
        }
        
        .nav-link:hover {
            color: var(--electric-green) !important;
        }
        
        .main-content {
            display: flex;
            gap: 2rem;
            padding: 2rem;
            max-width: 1400px;
            margin: 0 auto;
            min-height: calc(100vh - 76px);
            align-items: stretch;
        }
        
        .progress-container {
            background: rgba(10, 25, 41, 0.8);
            border: 2px solid rgba(0, 255, 136, 0.2);
            border-radius: 15px;
            padding: 1.5rem;
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 20px rgba(0, 255, 136, 0.1);
            width: 120px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
            flex-shrink: 0;
        }
        
        .progress-vertical {
            width: 12px;
            height: 100%;
            min-height: 300px;
            border-radius: 10px;
            background: rgba(0, 0, 0, 0.3);
            position: relative;
            box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.3);
        }
        
        .progress-bar-vertical {
            position: absolute;
            bottom: 0;
            width: 100%;
            background: linear-gradient(180deg, var(--accent-blue), var(--electric-green));
            border-radius: 10px;
            box-shadow: 0 0 10px var(--electric-green);
            transition: height 0.6s ease;
        }
        
        .exercise-counter {
            text-align: center;
            color: var(--electric-green);
            font-size: 0.85rem;
            font-weight: 600;
            text-shadow: 0 0 10px rgba(0, 255, 136, 0.5);
            margin-bottom: 1rem;
            line-height: 1.4;
        }
        
        .exercise-counter i {
            display: block;
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
        }
        
        .exercise-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            min-width: 0;
        }
        
        .exercise-card {
            background: rgba(10, 25, 41, 0.8);
            border: 2px solid rgba(0, 255, 136, 0.3);
            border-radius: 20px;
            padding: 2rem;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0, 255, 136, 0.2);
            animation: slideUp 0.5s ease-out;
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        
        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .exercise-title {
            font-size: 1.4rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .exercise-title i {
            color: var(--electric-green);
            font-size: 1.6rem;
        }
        
        .form-check {
            background: rgba(0, 0, 0, 0.2);
            border: 2px solid rgba(0, 255, 136, 0.2);
            border-radius: 12px;
            padding: 1rem;
            margin-bottom: 0.8rem;
            transition: all 0.3s ease;
            cursor: pointer;
        }
        
        .form-check:hover {
            border-color: var(--electric-green);
            background: rgba(0, 255, 136, 0.05);
            transform: translateX(5px);
        }
        
        .form-check-input {
            width: 1.3rem;
            height: 1.3rem;
            border: 2px solid var(--electric-green);
            background: transparent;
            cursor: pointer;
        }
        
        .form-check-input:checked {
            background-color: var(--electric-green);
            border-color: var(--electric-green);
        }
        
        .form-check-label {
            color: rgba(255, 255, 255, 0.9);
            font-size: 1rem;
            cursor: pointer;
            margin-left: 0.5rem;
        }
        
        .form-control {
            background: rgba(0, 0, 0, 0.3);
            border: 2px solid rgba(0, 255, 136, 0.3);
            border-radius: 12px;
            color: #fff;
            padding: 1rem;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            background: rgba(0, 0, 0, 0.4);
            border-color: var(--electric-green);
            box-shadow: 0 0 20px rgba(0, 255, 136, 0.3);
            color: #fff;
        }
        
        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.4);
        }
        
        .form-control:disabled {
            background: rgba(0, 0, 0, 0.2);
            border-color: rgba(0, 255, 136, 0.1);
            opacity: 0.6;
        }
        
        .text-muted {
            color: rgba(255, 255, 255, 0.6) !important;
            font-size: 0.95rem;
            margin-bottom: 1.2rem;
            padding: 0.8rem;
            background: rgba(0, 212, 255, 0.1);
            border-left: 4px solid var(--accent-blue);
            border-radius: 8px;
        }
        
        #unir-con-flechas-container {
            margin: 1.5rem 0;
            flex: 1;
        }
        
        #unir-con-flechas-container .list-group-item {
            background: rgba(0, 0, 0, 0.3);
            border: 2px solid rgba(0, 255, 136, 0.2);
            border-radius: 12px;
            color: #fff;
            padding: 1rem;
            margin-bottom: 0.7rem;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 1rem;
        }
        
        #unir-con-flechas-container .list-group-item:hover {
            border-color: var(--electric-green);
            background: rgba(0, 255, 136, 0.1);
            transform: scale(1.02);
        }
        
        #unir-con-flechas-container .list-group-item-action.active {
            background: linear-gradient(135deg, var(--electric-green), var(--accent-blue));
            color: var(--dark-blue);
            border-color: var(--electric-green);
            font-weight: 600;
            box-shadow: 0 5px 20px rgba(0, 255, 136, 0.4);
        }
        
        .btn-primary {
            background: linear-gradient(45deg, var(--electric-green), var(--accent-blue));
            border: none;
            color: var(--dark-blue);
            font-weight: 600;
            padding: 0.8rem 2rem;
            border-radius: 12px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.95rem;
            box-shadow: 0 4px 15px rgba(0, 255, 136, 0.3);
        }
        
        .btn-primary:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 25px rgba(0, 255, 136, 0.5);
        }
        
        .btn-info {
            background: linear-gradient(45deg, var(--accent-blue), #0099cc);
            border: none;
            color: #fff;
            font-weight: 600;
            padding: 0.8rem 2rem;
            border-radius: 12px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.95rem;
            box-shadow: 0 4px 15px rgba(0, 212, 255, 0.3);
        }
        
        .btn-info:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 25px rgba(0, 212, 255, 0.5);
            color: #fff;
        }
        
        .alert-success {
            background: linear-gradient(135deg, rgba(0, 255, 136, 0.15), rgba(0, 255, 136, 0.05));
            border: 2px solid var(--electric-green);
            border-radius: 15px;
            color: #fff;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 25px rgba(0, 255, 136, 0.3);
            animation: successPulse 0.6s ease-out;
            margin-top: 1.5rem;
        }
        
        @keyframes successPulse {
            0% { transform: scale(0.95); opacity: 0; }
            50% { transform: scale(1.02); }
            100% { transform: scale(1); opacity: 1; }
        }
        
        .alert-success .alert-heading {
            color: var(--electric-green);
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 1.3rem;
        }
        
        .alert-success .alert-heading::before {
            content: '\f00c';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            font-size: 1.8rem;
        }
        
        .alert-danger {
            background: linear-gradient(135deg, rgba(255, 59, 48, 0.15), rgba(255, 59, 48, 0.05));
            border: 2px solid #ff3b30;
            border-radius: 15px;
            color: #fff;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 25px rgba(255, 59, 48, 0.3);
            animation: errorShake 0.6s ease-out;
            margin-top: 1.5rem;
        }
        
        @keyframes errorShake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-10px); }
            75% { transform: translateX(10px); }
        }
        
        .alert-danger .alert-heading {
            color: #ff3b30;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 1.3rem;
        }
        
        .alert-danger .alert-heading::before {
            content: '\f00d';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            font-size: 1.8rem;
        }
        
        .alert p {
            color: rgba(255, 255, 255, 0.8);
            margin: 0;
            margin-top: 0.3rem;
        }
        
        .button-container {
            margin-top: auto;
            padding-top: 1.5rem;
        }
        
        hr {
            border-color: rgba(0, 255, 136, 0.2);
            margin: 1.5rem 0;
        }
        
        @media (max-width: 992px) {
            .main-content {
                flex-direction: column;
                padding: 1rem;
            }
            
            .progress-container {
                width: 100%;
                flex-direction: row;
                padding: 1rem;
            }
            
            .progress-vertical {
                width: 100%;
                height: 12px;
                min-height: unset;
            }
            
            .progress-bar-vertical {
                position: absolute;
                left: 0;
                bottom: 0;
                height: 100%;
                width: auto;
            }
            
            .exercise-counter {
                writing-mode: horizontal-tb;
                transform: none;
                margin: 0;
                margin-left: 1rem;
            }
            
            .exercise-card {
                padding: 1.5rem;
            }
            
            .exercise-title {
                font-size: 1.2rem;
            }
            
            .btn-primary, .btn-info {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><i class="fas fa-graduation-cap"></i> PANDOO</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/CursoServlet?action=list">
                            <i class="fas fa-home"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/LogoutServlet">
                            <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="main-content">
        <div class="progress-container">
            <div class="progress-vertical">
                <div class="progress-bar-vertical" style="height: ${(ejercicioIndex / totalEjercicios) * 100}%"></div>
            </div>
            <div class="exercise-counter">
                <i class="fas fa-clipboard-check"></i> Ejercicio ${ejercicioIndex + 1} de ${totalEjercicios}
            </div>
        </div>

        <div class="exercise-content">
            <div class="exercise-card">
                <h4 class="exercise-title">
                    <i class="fas fa-question-circle"></i>
                    ${ejercicio.enunciado}
                </h4>

                <form method="post" action="${pageContext.request.contextPath}/EjercicioServlet?action=check">
                    
                    <c:set var="metadata" value="${requestScope.metadata}" />

                    <c:choose>
                        <c:when test="${ejercicio.tipoEjercicio.nombre == 'Multiple Choice'}">
                            <c:forEach var="opcion" items="${metadata.opciones}" varStatus="loop">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="respuesta" id="opcion_${loop.index}" value="${opcion}" <c:if test="${isAnswered}">disabled</c:if> required>
                                    <label class="form-check-label" for="opcion_${loop.index}">
                                        ${opcion}
                                    </label>
                                </div>
                            </c:forEach>
                        </c:when>
                        
                        <c:when test="${ejercicio.tipoEjercicio.nombre == 'Completar texto'}">
                             <p class="text-muted">
                                <i class="fas fa-info-circle"></i> 
                                Selecciona la palabra o frase correcta para llenar el espacio en blanco.
                            </p>
                            <c:forEach var="opcion" items="${metadata.opciones}" varStatus="loop">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="respuesta" id="opcion_${loop.index}" value="${opcion}" <c:if test="${isAnswered}">disabled</c:if> required>
                                    <label class="form-check-label" for="opcion_${loop.index}">
                                        ${opcion}
                                    </label>
                                </div>
                            </c:forEach>
                        </c:when>

                        <c:when test="${ejercicio.tipoEjercicio.nombre == 'Unir con flechas'}">
                            <p class="text-muted">
                                <i class="fas fa-info-circle"></i> 
                                Haz clic en un elemento de cada columna para unirlos con una línea. Vuelve a hacer clic en un elemento unido para eliminar su conexión.
                            </p>
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

                    <div class="button-container">
                        <c:if test="${!isAnswered}">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-check-circle"></i> Comprobar Respuesta
                            </button>
                        </c:if>
                    </div>
                </form>

                <c:if test="${isAnswered}">
                    <div>
                        <c:if test="${isCorrect}">
                            <div class="alert alert-success">
                                <h4 class="alert-heading">¡Correcto!</h4>
                                <p>¡Excelente trabajo! Tu respuesta es correcta.</p>
                            </div>
                        </c:if>
                        <c:if test="${!isCorrect}">
                            <div class="alert alert-danger">
                                <h4 class="alert-heading">Incorrecto</h4>
                                <p>Tu respuesta no fue la correcta. ¡Sigue intentando!</p>
                            </div>
                        </c:if>
                        <a href="${pageContext.request.contextPath}/EjercicioServlet?action=next" class="btn btn-info">
                            <i class="fas fa-arrow-right"></i> Siguiente Ejercicio
                        </a>
                    </div>
                </c:if>
            </div>
        </div>
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
                                    color: 'rgba(0, 255, 136, 0.8)',
                                    size: 4,
                                    path: 'fluid',
                                    startPlug: 'disc',
                                    endPlug: 'disc'
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
</body>
</html>