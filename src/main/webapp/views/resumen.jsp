<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resumen - Pandoo</title>
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
            display: flex;
            flex-direction: column;
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
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 3rem 1rem;
        }
        
        .summary-card {
            background: rgba(10, 25, 41, 0.9);
            border: 2px solid rgba(0, 255, 136, 0.3);
            border-radius: 25px;
            overflow: hidden;
            backdrop-filter: blur(15px);
            box-shadow: 0 15px 50px rgba(0, 255, 136, 0.3);
            animation: scaleIn 0.6s ease-out;
            max-width: 700px;
            width: 100%;
        }
        
        @keyframes scaleIn {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
        
        .card-header-custom {
            background: linear-gradient(135deg, rgba(0, 255, 136, 0.2), rgba(0, 212, 255, 0.2));
            border-bottom: 2px solid rgba(0, 255, 136, 0.3);
            padding: 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .card-header-custom::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(0, 255, 136, 0.1), transparent);
            animation: rotate 10s linear infinite;
        }
        
        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }
        
        .card-header-custom h3 {
            position: relative;
            z-index: 1;
            color: var(--electric-green);
            font-size: 2rem;
            font-weight: 700;
            margin: 0;
            text-shadow: 0 0 20px rgba(0, 255, 136, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 1rem;
        }
        
        .celebration-icon {
            font-size: 2.5rem;
            animation: bounce 1s ease-in-out infinite;
        }
        
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        
        .card-body-custom {
            padding: 3rem 2rem;
            text-align: center;
        }
        
        .summary-title {
            color: #fff;
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1rem;
        }
        
        .summary-text {
            color: rgba(255, 255, 255, 0.8);
            font-size: 1.1rem;
            margin-bottom: 2rem;
        }
        
        .score-container {
            position: relative;
            margin: 2rem 0;
        }
        
        .score-display {
            font-size: 1.3rem;
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: 1.5rem;
            font-weight: 500;
        }
        
        .score-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, var(--electric-green), var(--accent-blue));
            color: var(--dark-blue);
            font-size: 3rem;
            font-weight: 700;
            padding: 1.5rem 3rem;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0, 255, 136, 0.5);
            animation: scoreReveal 1s ease-out;
            position: relative;
        }
        
        @keyframes scoreReveal {
            0% {
                opacity: 0;
                transform: scale(0.5) rotate(-10deg);
            }
            60% {
                transform: scale(1.1) rotate(5deg);
            }
            100% {
                opacity: 1;
                transform: scale(1) rotate(0deg);
            }
        }
        
        .score-badge::before {
            content: '';
            position: absolute;
            top: -5px;
            left: -5px;
            right: -5px;
            bottom: -5px;
            background: linear-gradient(135deg, var(--electric-green), var(--accent-blue));
            border-radius: 20px;
            opacity: 0.3;
            filter: blur(10px);
            z-index: -1;
            animation: glowPulse 2s ease-in-out infinite;
        }
        
        @keyframes glowPulse {
            0%, 100% { opacity: 0.3; transform: scale(1); }
            50% { opacity: 0.6; transform: scale(1.05); }
        }
        
        .progress-message {
            color: var(--accent-blue);
            font-size: 1.1rem;
            margin-top: 2rem;
            padding: 1rem;
            background: rgba(0, 212, 255, 0.1);
            border-radius: 12px;
            border: 1px solid rgba(0, 212, 255, 0.3);
            display: inline-flex;
            align-items: center;
            gap: 0.8rem;
        }
        
        .progress-message i {
            font-size: 1.3rem;
        }
        
        .btn-custom {
            background: linear-gradient(45deg, var(--electric-green), var(--accent-blue));
            border: none;
            color: var(--dark-blue);
            font-weight: 600;
            padding: 1rem 3rem;
            border-radius: 12px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 1.1rem;
            box-shadow: 0 5px 20px rgba(0, 255, 136, 0.4);
            margin-top: 2rem;
            display: inline-flex;
            align-items: center;
            gap: 0.8rem;
        }
        
        .btn-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 35px rgba(0, 255, 136, 0.6);
            color: var(--dark-blue);
        }
        
        .card-footer-custom {
            background: rgba(0, 0, 0, 0.3);
            border-top: 2px solid rgba(0, 255, 136, 0.2);
            padding: 1.5rem;
            text-align: center;
            color: rgba(255, 255, 255, 0.7);
            font-size: 1.1rem;
            font-weight: 500;
        }
        
        .confetti {
            position: fixed;
            width: 10px;
            height: 10px;
            background: var(--electric-green);
            position: fixed;
            pointer-events: none;
            animation: confettiFall 3s linear infinite;
        }
        
        @keyframes confettiFall {
            to {
                transform: translateY(100vh) rotate(360deg);
                opacity: 0;
            }
        }
        
        /* Crear confeti con diferentes colores y posiciones */
        .confetti:nth-child(1) { left: 10%; animation-delay: 0s; background: var(--electric-green); }
        .confetti:nth-child(2) { left: 20%; animation-delay: 0.5s; background: var(--accent-blue); }
        .confetti:nth-child(3) { left: 30%; animation-delay: 1s; background: var(--electric-green); }
        .confetti:nth-child(4) { left: 40%; animation-delay: 1.5s; background: var(--accent-blue); }
        .confetti:nth-child(5) { left: 50%; animation-delay: 2s; background: var(--electric-green); }
        .confetti:nth-child(6) { left: 60%; animation-delay: 0.3s; background: var(--accent-blue); }
        .confetti:nth-child(7) { left: 70%; animation-delay: 0.8s; background: var(--electric-green); }
        .confetti:nth-child(8) { left: 80%; animation-delay: 1.3s; background: var(--accent-blue); }
        .confetti:nth-child(9) { left: 90%; animation-delay: 1.8s; background: var(--electric-green); }
        
        @media (max-width: 768px) {
            .card-header-custom h3 {
                font-size: 1.5rem;
            }
            
            .score-badge {
                font-size: 2rem;
                padding: 1rem 2rem;
            }
            
            .btn-custom {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <!-- Confeti decorativo -->
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>
    
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
    
    <div class="container">
        <div class="summary-card">
            <div class="card-header-custom">
                <h3>
                    <span class="celebration-icon">🎉</span>
                    ¡Actividad Completada!
                    <span class="celebration-icon">🎉</span>
                </h3>
            </div>
            
            <div class="card-body-custom">
                <h5 class="summary-title">
                    <i class="fas fa-trophy" style="color: var(--electric-green);"></i>
                    Tu Resumen
                </h5>
                <p class="summary-text">¡Felicitaciones! Has completado todos los ejercicios de esta actividad.</p>
                
                <div class="score-container">
                    <div class="score-display">Tu Puntaje Final:</div>
                    <div class="score-badge">
                        ${score} / ${total}
                    </div>
                </div>
                
                <div class="progress-message">
                    <i class="fas fa-check-circle"></i>
                    Tu progreso ha sido guardado correctamente
                </div>
                
                <a href="${pageContext.request.contextPath}/CursoServlet?action=view&id=${idCurso}" class="btn btn-custom">
                    <i class="fas fa-arrow-left"></i>
                    Volver al Curso
                </a>
            </div>
            
            <div class="card-footer-custom">
                <i class="fas fa-lightbulb"></i> ¡Sigue aprendiendo y mejorando tus habilidades!
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>