<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Curso - Pandoo</title>
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
        }
        
        .course-header {
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
        
        .course-header::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -10%;
            width: 300px;
            height: 300px;
            background: radial-gradient(circle, rgba(0, 255, 136, 0.1), transparent);
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
        
        .course-header-content {
            position: relative;
            z-index: 1;
        }
        
        .course-icon-large {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, var(--electric-green), var(--accent-blue));
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 8px 25px rgba(0, 255, 136, 0.4);
            animation: float 3s ease-in-out infinite;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }
        
        .course-header h2 {
            color: #fff;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
            text-shadow: 0 2px 10px rgba(0, 255, 136, 0.3);
        }
        
        .course-header p {
            color: rgba(255, 255, 255, 0.8);
            font-size: 1.1rem;
            margin: 0;
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
        
        .activity-card {
            background: rgba(10, 25, 41, 0.8);
            border: 2px solid rgba(0, 255, 136, 0.2);
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 1rem;
            transition: all 0.4s ease;
            backdrop-filter: blur(10px);
            position: relative;
            overflow: hidden;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 1.5rem;
        }
        
        
        
        .activity-card:hover::before {
            left: 100%;
        }
        
        .activity-card:hover {
            border-color: var(--electric-green);
            box-shadow: 0 8px 30px rgba(0, 255, 136, 0.3);
        }
        
        .activity-icon {
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
            flex-shrink: 0;
            transition: all 0.3s ease;
        }
        
        .activity-card:hover .activity-icon {
            background: linear-gradient(135deg, var(--electric-green), var(--accent-blue));
            color: var(--dark-blue);
            transform: rotate(5deg) scale(1.1);
        }
        
        .activity-content {
            flex-grow: 1;
            position: relative;
            z-index: 1;
        }
        
        .activity-title {
            color: #fff;
            font-size: 1.2rem;
            font-weight: 600;
            margin: 0;
            transition: color 0.3s ease;
        }
        
        .activity-card:hover .activity-title {
            color: var(--electric-green);
        }
        
        .activity-arrow {
            font-size: 1.5rem;
            color: rgba(255, 255, 255, 0.4);
            transition: all 0.3s ease;
            flex-shrink: 0;
        }
        
        .activity-card:hover .activity-arrow {
            color: var(--electric-green);
            transform: translateX(5px);
        }
        
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            background: rgba(10, 25, 41, 0.6);
            border: 2px solid rgba(0, 255, 136, 0.2);
            border-radius: 20px;
            backdrop-filter: blur(10px);
        }
        
        .empty-state i {
            font-size: 5rem;
            color: rgba(0, 255, 136, 0.3);
            margin-bottom: 1.5rem;
            display: block;
        }
        
        .empty-state p {
            color: rgba(255, 255, 255, 0.7);
            font-size: 1.2rem;
            margin: 0;
        }
        
        .alert-custom {
            background: linear-gradient(135deg, rgba(255, 59, 48, 0.1), rgba(255, 149, 0, 0.1));
            border: 2px solid rgba(255, 59, 48, 0.3);
            border-radius: 15px;
            padding: 2rem;
            color: #fff;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 25px rgba(255, 59, 48, 0.2);
        }
        
        .alert-custom i {
            color: #ff3b30;
            font-size: 2rem;
            margin-right: 1rem;
        }
        
        @media (max-width: 768px) {
            .course-header h2 {
                font-size: 1.8rem;
            }
            
            .section-title {
                font-size: 1.4rem;
            }
            
            .activity-card {
                flex-direction: column;
                align-items: flex-start;
                text-align: center;
            }
            
            .activity-arrow {
                display: none;
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
                            <i class="fas fa-home"></i> Volver al Dashboard
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
        <c:if test="${not empty curso}">
            <div class="course-header">
                <div class="course-header-content">
                    
                    <div class="course-icon-large" style="padding: 0; overflow: hidden;">
                        <img src="${pageContext.request.contextPath}/images/${curso.imagen}" alt="${curso.nombre}" style="width: 80px; height: 80px; object-fit: cover;">
                    </div>
                    <h2>${curso.nombre}</h2>
                    <p>Explora todas las actividades disponibles en este curso y avanza en tu aprendizaje</p>
                </div>
            </div>
            
            <h3 class="section-title">
                <i class="fas fa-list-check"></i> Actividades del Curso
            </h3>
            
            <div class="activities-list">
                <c:forEach var="actividad" items="${curso.actividades}" varStatus="status">
                    <a href="${pageContext.request.contextPath}/ActividadServlet?id=${actividad.id}" class="activity-card">
                        <div class="activity-icon">
                            <i class="fas fa-file-code"></i>
                        </div>
                        <div class="activity-content">
                            <h5 class="activity-title">${actividad.nombre}</h5>
                        </div>
                        <div class="activity-arrow">
                            <i class="fas fa-chevron-right"></i>
                        </div>
                    </a>
                </c:forEach>
                
                <c:if test="${empty curso.actividades}">
                    <div class="empty-state">
                        <i class="fas fa-folder-open"></i>
                        <p>Este curso aún no tiene actividades disponibles.<br>¡Pronto se agregarán nuevos contenidos!</p>
                    </div>
                </c:if>
            </div>
        </c:if>
        
        <c:if test="${empty curso}">
            <div class="alert-custom d-flex align-items-center">
                <i class="fas fa-exclamation-triangle"></i>
                <div>
                    <h4 class="mb-2">No se pudo cargar la información del curso</h4>
                    <p class="mb-0">Por favor, intenta nuevamente o regresa al dashboard.</p>
                </div>
            </div>
        </c:if>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>