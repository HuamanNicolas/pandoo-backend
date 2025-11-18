<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.pandoo.model.Usuario"%>
<%@page import="com.mycompany.pandoo.model.Curso"%>
<%@page import="com.mycompany.pandoo.model.Inscripcion"%>
<%@page import="java.util.List"%>
<%@page import="java.util.stream.Collectors"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Pandoo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --electric-green: #78c800ff;;
            --dark-blue: #0a1929;
            --accent-blue: #78c800ff;
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
        
        .welcome-card {
           
          
            padding: 2rem;
            margin-bottom: 2rem;
          
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
        
        .welcome-card h4 {
            color: var(--electric-green);
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            text-shadow: 0 0 20px rgba(0, 255, 136, 0.5);
        }
        
        .welcome-card p {
            color: rgba(255, 255, 255, 0.8);
            font-size: 1.1rem;
        }
        
        .section-title {
            font-size: 1.8rem;
            font-weight: 700;
            margin: 3rem 0 1.5rem;
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
        
        .course-card {
            background: rgba(10, 25, 41, 0.8);
            border: 2px solid rgba(0, 255, 136, 0.2);
            border-radius: 15px;
            overflow: hidden;
            transition: all 0.4s ease;
            height: 100%;
            backdrop-filter: blur(10px);
            position: relative;
        }
        
        
        
        .course-card:hover::before {
            left: 100%;
        }
        
        .course-card:hover {
            
            border-color: var(--electric-green);
            box-shadow: 0 15px 40px rgba(0, 255, 136, 0.3);
        }
        
        .course-card-body {
            padding: 2rem;
            position: relative;
            z-index: 1;
        }
        
        .course-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, var(--electric-green), var(--accent-blue));
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            margin-bottom: 1rem;
            box-shadow: 0 5px 15px rgba(0, 255, 136, 0.3);
        }
        
        .course-title {
            color: #fff;
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 1rem;
            min-height: 60px;
        }
        
        .btn-custom {
            background: linear-gradient(45deg, var(--electric-green), var(--accent-blue));
            border: none;
            color: var(--dark-blue);
            font-weight: 600;
            padding: 0.7rem 1.5rem;
            border-radius: 10px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.9rem;
            width: 100%;
            box-shadow: 0 4px 15px rgba(0, 255, 136, 0.3);
        }
        
        .btn-custom:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 25px rgba(0, 255, 136, 0.5);
            color: var(--dark-blue);
        }
        
        .btn-enrolled {
            background: linear-gradient(45deg, var(--accent-blue), #0099cc);
        }
        
        .badge-enrolled {
            background: var(--electric-green);
            color: var(--dark-blue);
            padding: 0.4rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            position: absolute;
            top: 1rem;
            right: 1rem;
        }
        
        .empty-state {
            text-align: center;
            padding: 3rem;
            color: rgba(255, 255, 255, 0.6);
            font-size: 1.1rem;
        }
        
        .empty-state i {
            font-size: 4rem;
            color: rgba(0, 255, 136, 0.3);
            margin-bottom: 1rem;
        }
        
        hr {
            border-color: rgba(0, 255, 136, 0.2);
            margin: 2rem 0;
        }
        
        @media (max-width: 768px) {
            .welcome-card h4 {
                font-size: 1.5rem;
            }
            
            .section-title {
                font-size: 1.4rem;
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
                        <a class="nav-link" href="${pageContext.request.contextPath}/LogoutServlet">
                            <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="container mt-5">
        <% 
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            if (usuario != null) {
                List<Curso> todosLosCursos = (List<Curso>) request.getAttribute("cursos");
                List<Inscripcion> inscripciones = usuario.getInscripciones();
                List<Integer> idsCursosInscritos = inscripciones.stream()
                                                                .map(inscripcion -> inscripcion.getCurso().getId())
                                                                .collect(Collectors.toList());
        %>
            <div class="welcome-card">
                <h4>¡Bienvenido, <%= usuario.getNombre() %>!</h4>
                <p>Estás listo para comenzar tu viaje de aprendizaje en tecnología</p>
            </div>
            
            <h3 class="section-title">
                <i class="fas fa-bookmark"></i> Mis Cursos
            </h3>
            <div class="row">
                <% 
                boolean tieneCursos = false;
                for (Curso curso : todosLosCursos) {
                    if (idsCursosInscritos.contains(curso.getId())) { 
                        tieneCursos = true;
                %>
                        <div class="col-md-4 mb-4">
                            <div class="course-card">
                                <span class="badge-enrolled"><i class="fas fa-check"></i> Inscrito</span>
                                <div class="course-card-body">
                                    <div class="course-icon" style="padding: 0; overflow: hidden;">
                                        <img src="${pageContext.request.contextPath}/images/<%= curso.getImagen() %>" alt="<%= curso.getNombre() %>" style="width: 60px; height: 60px; object-fit: cover;">
                                    </div>
                                    <h5 class="course-title"><%= curso.getNombre() %></h5>
                                    
                                    <div class="mb-2">
                                        <%
                                            java.util.Map<Integer, Double> progressMap = (java.util.Map<Integer, Double>) request.getAttribute("courseProgressMap");
                                            double progress = progressMap != null ? progressMap.getOrDefault(curso.getId(), 0.0) : 0.0;
                                        %>
                                        <div class="progress" style="height: 8px; background-color: rgba(255,255,255,0.1);">
                                            <div class="progress-bar" role="progressbar" style="width: <%= progress %>%; background: linear-gradient(45deg, var(--electric-green), var(--accent-blue));" aria-valuenow="<%= progress %>" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                        <small class="text-white-50"><%= Math.round(progress) %>% completado</small>
                                    </div>

                                    <a href="${pageContext.request.contextPath}/CursoServlet?action=view&id=<%= curso.getId() %>" 
                                       class="btn btn-custom btn-enrolled mt-2">
                                        <i class="fas fa-play"></i> Continuar Curso
                                    </a>
                                </div>
                            </div>
                        </div>
                <%  
                    }
                } 
                if (!tieneCursos) {
                %>
                    <div class="col-12">
                        <div class="empty-state">
                            <i class="fas fa-book-open"></i>
                            <p>Aún no estás inscrito en ningún curso. ¡Explora los cursos disponibles abajo!</p>
                        </div>
                    </div>
                <% } %>
            </div>
            
            <hr>
            
            <h3 class="section-title">
                <i class="fas fa-star"></i> Cursos Disponibles
            </h3>
            <div class="row">
                <% 
                boolean hayDisponibles = false;
                for (Curso curso : todosLosCursos) {
                    if (!idsCursosInscritos.contains(curso.getId())) { 
                        hayDisponibles = true;
                %>
                        <div class="col-md-4 mb-4">
                            <div class="course-card">
                                <div class="course-card-body">
                                    <div class="course-icon" style="padding: 0; overflow: hidden;">
                                        <img src="${pageContext.request.contextPath}/images/<%= curso.getImagen() %>" alt="<%= curso.getNombre() %>" style="width: 60px; height: 60px; object-fit: cover;">
                                    </div>
                                    <h5 class="course-title"><%= curso.getNombre() %></h5>
                                    <form action="${pageContext.request.contextPath}/InscripcionServlet" method="post">
                                        <input type="hidden" name="idCurso" value="<%= curso.getId() %>">
                                        <button type="submit" class="btn btn-custom">
                                            <i class="fas fa-plus-circle"></i> Inscribirse
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                <%  
                    }
                } 
                if (!hayDisponibles) {
                %>
                    <div class="col-12">
                        <div class="empty-state">
                            <i class="fas fa-check-circle"></i>
                            <p>¡Felicitaciones! Ya estás inscrito en todos los cursos disponibles.</p>
                        </div>
                    </div>
                <% } %>
            </div>
        <% 
            } else {
                response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            }
        %>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>