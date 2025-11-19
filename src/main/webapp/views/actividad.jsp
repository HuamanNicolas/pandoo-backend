<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actividad - Pandoo</title>
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
        
        .container {
            position: relative;
            z-index: 1;
            padding-bottom: 3rem;
        }
        
        .activity-header {
            background: linear-gradient(135deg, rgba(0, 255, 136, 0.1) 0%, rgba(0, 212, 255, 0.1) 100%);
            border: 2px solid rgba(0, 255, 136, 0.3);
            border-radius: 20px;
            padding: 2.5rem;
            margin-bottom: 3rem;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0, 255, 136, 0.2);
            animation: slideDown 0.6s ease-out;
            position: relative;
            overflow: hidden;
        }
        
        .activity-header::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -10%;
            width: 300px;
            height: 300px;
            background: radial-gradient(circle, rgba(0, 212, 255, 0.1), transparent);
            border-radius: 50%;
        }
        
        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .activity-header-content {
            position: relative;
            z-index: 1;
        }
        
        .activity-icon-large {
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, var(--accent-blue), #0099cc);
            border-radius: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.2rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 8px 25px rgba(0, 212, 255, 0.4);
            animation: float 3s ease-in-out infinite;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }
        
        .activity-header h2 {
            color: #fff;
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            text-shadow: 0 2px 10px rgba(0, 212, 255, 0.3);
        }
        
        .section-title {
            font-size: 1.8rem;
            font-weight: 700;
            margin: 2rem 0 1.5rem;
            color: #fff;
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .section-title::before {
            content: '';
            width: 4px;
            height: 40px;
            background: linear-gradient(to bottom, var(--electric-green), var(--accent-blue));
            border-radius: 2px;
        }
        
        .section-title i {
            color: var(--electric-green);
        }
        
        .exercise-card {
            background: rgba(10, 25, 41, 0.8);
            border: 2px solid rgba(0, 255, 136, 0.2);
            border-radius: 15px;
            padding: 1.8rem;
            margin-bottom: 1.2rem;
            transition: all 0.4s ease;
            backdrop-filter: blur(10px);
            position: relative;
            overflow: hidden;
            animation: slideUp 0.5s ease-out backwards;
        }
        
        .exercise-card:nth-child(1) { animation-delay: 0.1s; }
        .exercise-card:nth-child(2) { animation-delay: 0.2s; }
        .exercise-card:nth-child(3) { animation-delay: 0.3s; }
        .exercise-card:nth-child(4) { animation-delay: 0.4s; }
        .exercise-card:nth-child(5) { animation-delay: 0.5s; }
        
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
        
        
        
        .exercise-card:hover::before {
            left: 100%;
        }
        
        .exercise-card:hover {
            
            border-color: var(--electric-green);
            box-shadow: 0 10px 35px rgba(0, 255, 136, 0.3);
        }
        
        .exercise-header {
            display: flex;
            align-items: center;
            gap: 1.2rem;
            margin-bottom: 1rem;
        }
        
        .exercise-number {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, rgba(0, 255, 136, 0.2), rgba(0, 212, 255, 0.2));
            border: 2px solid rgba(0, 255, 136, 0.3);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
            color: var(--electric-green);
            font-weight: 700;
            flex-shrink: 0;
            transition: all 0.3s ease;
        }
        
        .exercise-card:hover .exercise-number {
            background: linear-gradient(135deg, var(--electric-green), var(--accent-blue));
            color: var(--dark-blue);
            transform: scale(1.1);
        }
        
        .exercise-title {
            color: #fff;
            font-size: 1.3rem;
            font-weight: 600;
            margin: 0;
        }
        
        .exercise-description {
            color: rgba(255, 255, 255, 0.85);
            font-size: 1.05rem;
            margin-bottom: 0.8rem;
            padding-left: 62px;
        }
        
        .exercise-type {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: rgba(0, 212, 255, 0.15);
            border: 1px solid rgba(0, 212, 255, 0.3);
            padding: 0.4rem 1rem;
            border-radius: 20px;
            font-size: 0.9rem;
            color: var(--accent-blue);
            margin-left: 62px;
            font-weight: 500;
        }
        
        .exercise-type i {
            font-size: 0.85rem;
        }
        
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            background: rgba(10, 25, 41, 0.6);
            border: 2px solid rgba(0, 212, 255, 0.2);
            border-radius: 20px;
            backdrop-filter: blur(10px);
        }
        
        .empty-state i {
            font-size: 5rem;
            color: rgba(0, 212, 255, 0.3);
            margin-bottom: 1.5rem;
            display: block;
        }
        
        .empty-state p {
            color: rgba(255, 255, 255, 0.7);
            font-size: 1.2rem;
            margin: 0;
        }
        
        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 3rem;
            flex-wrap: wrap;
        }
        
        .btn-primary {
            background: linear-gradient(45deg, var(--electric-green), var(--accent-blue));
            border: none;
            color: var(--dark-blue);
            font-weight: 600;
            padding: 1rem 2.5rem;
            border-radius: 12px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 1rem;
            box-shadow: 0 4px 15px rgba(0, 255, 136, 0.3);
            display: inline-flex;
            align-items: center;
            gap: 0.8rem;
        }
        
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 30px rgba(0, 255, 136, 0.5);
            color: var(--dark-blue);
        }
        
        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.3);
            color: #fff;
            font-weight: 600;
            padding: 1rem 2.5rem;
            border-radius: 12px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 1rem;
            display: inline-flex;
            align-items: center;
            gap: 0.8rem;
        }
        
        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.15);
            border-color: var(--electric-green);
            color: var(--electric-green);
            transform: translateY(-3px);
            box-shadow: 0 8px 30px rgba(0, 255, 136, 0.2);
        }
        
        hr {
            border-color: rgba(0, 255, 136, 0.2);
            margin: 2rem 0;
        }
        
        @media (max-width: 768px) {
            .activity-header h2 {
                font-size: 1.6rem;
            }
            
            .section-title {
                font-size: 1.4rem;
            }
            
            .exercise-description {
                padding-left: 0;
            }
            
            .exercise-type {
                margin-left: 0;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .btn-primary, .btn-secondary {
                width: 100%;
                justify-content: center;
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
    
    <div class="container mt-5">
        <div class="activity-header">
            <div class="activity-header-content">
                
                <h2><i class="fas fa-tasks"></i> ${actividad.nombre}</h2>
            </div>
        </div>
        <div class="action-buttons">
            <c:if test="${not empty actividad.ejercicios}">
                <a href="${pageContext.request.contextPath}/EjercicioServlet?action=start&idActividad=${actividad.id}" class="btn btn-primary">
                    <i class="fas fa-play"></i> Comenzar Ejercicios
                </a>
            </c:if>
            <a href="${pageContext.request.contextPath}/CursoServlet?action=view&id=${actividad.curso.id}" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Volver al Curso
            </a>
        </div>
        <c:if test="${not empty actividad.ejercicios}">
            <h3 class="section-title">
                <i class="fas fa-list-ol"></i> Ejercicios Disponibles
            </h3>
            
            <div class="exercises-list">
                <c:forEach var="ejercicio" items="${actividad.ejercicios}" varStatus="loop">
                    <div class="exercise-card">
                        <div class="exercise-header">
                            <div class="exercise-number">
                                ${loop.count}
                            </div>
                            <h5 class="exercise-title">Ejercicio ${loop.count}</h5>
                        </div>
                        <p class="exercise-description">${ejercicio.enunciado}</p>
                        <span class="exercise-type">
                            <i class="fas fa-tag"></i>
                            ${ejercicio.tipoEjercicio.nombre}
                        </span>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        
        <c:if test="${empty actividad.ejercicios}">
            <div class="empty-state">
                <i class="fas fa-inbox"></i>
                <p>No hay ejercicios disponibles para esta actividad.<br>¡Pronto se agregarán nuevos contenidos!</p>
            </div>
        </c:if>
        
        
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>