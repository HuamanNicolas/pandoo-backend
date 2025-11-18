<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pandoo - Inicio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --electric-green: #78c800ff;
            --dark-blue: #0a1929;
            --accent-blue: #00d4ff;
            --gradient-start: #0a1929;
            --gradient-end: #132f4c;
            --verde-anterior: #00ff88;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            background: #fff;
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
            z-index: 0;
        }
        
        @keyframes pulse {
            0%, 100% { transform: scale(1) rotate(0deg); opacity: 0.3; }
            50% { transform: scale(1.1) rotate(180deg); opacity: 0.5; }
        }
        
        .navbar {
            background: var(--electric-green) !important;
            backdrop-filter: blur(10px);
            border-bottom: 2px solid rgba(0, 255, 136, 0.2);
            padding: 1rem 0;
            box-shadow: 0 4px 30px rgba(0, 255, 136, 0.1);
            position: relative;
            z-index: 100;
        }
        
        .navbar-brand {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .logo {
            width: 120px;
            height: auto;
            filter: drop-shadow(0 0 10px rgba(0, 255, 136, 0.3));
            transition: all 0.3s ease;
        }
        
        .logo:hover {
            filter: drop-shadow(0 0 20px rgba(0, 255, 136, 0.6));
            transform: scale(1.05);
        }
        
        .btn-outline-primary {
            background: transparent;
            border: 2px solid var(--electric-green);
            color: var(--electric-green);
            font-weight: 600;
            padding: 0.6rem 1.8rem;
            border-radius: 10px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 0.9rem;
        }
        
        .btn-outline-primary:hover {
            background: var(--electric-green);
            color: var(--dark-blue);
            border-color: var(--electric-green);
            box-shadow: 0 5px 20px rgba(0, 255, 136, 0.4);
            transform: translateY(-2px);
        }
        
        .btn-primary {
            background: linear-gradient(45deg, var(--electric-green), var(--accent-blue));
            border: none;
            color: var(--dark-blue);
            font-weight: 600;
            padding: 0.6rem 1.8rem;
            border-radius: 10px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 0.9rem;
            box-shadow: 0 4px 15px rgba(0, 255, 136, 0.3);
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 25px rgba(0, 255, 136, 0.5);
            color: var(--dark-blue);
        }
        
        .main-content {
            flex-grow: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 60px 20px;
            position: relative;
            z-index: 1;
        }
        
        .feature-section {
            background: rgba(10, 25, 41, 0.9);
            border: 2px solid rgba(0, 255, 136, 0.3);
            border-radius: 25px;
            box-shadow: 0 15px 50px rgba(0, 255, 136, 0.3);
            padding: 50px;
            backdrop-filter: blur(15px);
            animation: fadeInUp 0.8s ease-out;
            position: relative;
            overflow: hidden;
        }
        
        .feature-section::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -20%;
            width: 400px;
            height: 400px;
            background: radial-gradient(circle, rgba(0, 212, 255, 0.1), transparent);
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }
        
        @keyframes float {
            0%, 100% { transform: translate(0, 0); }
            50% { transform: translate(-20px, -20px); }
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .feature-image {
            max-width: 100%;
            height: auto;
            border-radius: 15px;
            border: 2px solid rgba(0, 255, 136, 0.3);
            box-shadow: 0 10px 40px rgba(0, 255, 136, 0.2);
            transition: all 0.4s ease;
            position: relative;
            z-index: 1;
        }
        
        .feature-image:hover {
            transform: scale(1.03);
            box-shadow: 0 15px 50px rgba(0, 255, 136, 0.4);
            border-color: var(--electric-green);
        }
        
        .content-wrapper {
            position: relative;
            z-index: 1;
        }
        
        .content-wrapper h2 {
            color: var(--electric-green);
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            text-shadow: 0 0 20px rgba(0, 255, 136, 0.5);
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .content-wrapper h2 i {
            font-size: 2.2rem;
            animation: bounce 2s ease-in-out infinite;
        }
        
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        
        .content-wrapper p {
            color: rgba(255, 255, 255, 0.85);
            font-size: 1.1rem;
            line-height: 1.8;
            margin-bottom: 1.5rem;
            text-align: justify;
        }
        
        .highlight-box {
            background: linear-gradient(135deg, rgba(0, 255, 136, 0.1), rgba(0, 212, 255, 0.1));
            border-left: 4px solid var(--electric-green);
            padding: 1.5rem;
            border-radius: 10px;
            margin-top: 2rem;
        }
        
        .highlight-box p {
            margin: 0;
            font-weight: 500;
            color: rgba(255, 255, 255, 0.9);
        }
        
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-top: 2rem;
        }
        
        .feature-item {
            background: rgba(0, 0, 0, 0.3);
            border: 2px solid rgba(0, 255, 136, 0.2);
            border-radius: 12px;
            padding: 1.5rem;
            text-align: center;
            transition: all 0.3s ease;
        }
        
        .feature-item:hover {
            border-color: var(--electric-green);
            background: rgba(0, 255, 136, 0.05);
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 255, 136, 0.2);
        }
        
        .feature-item i {
            font-size: 2.5rem;
            color: var(--electric-green);
            margin-bottom: 1rem;
            display: block;
        }
        
        .feature-item h5 {
            color: #fff;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        
        .feature-item p {
            color: rgba(255, 255, 255, 0.7);
            font-size: 0.9rem;
            margin: 0;
            text-align: center;
        }
        
        .cta-section {
            text-align: center;
            margin-top: 3rem;
        }
        
        .cta-section .btn-primary {
            font-size: 1.1rem;
            padding: 1rem 3rem;
        }
        
        @media (max-width: 768px) {
            .feature-section {
                padding: 30px 20px;
            }
            
            .content-wrapper h2 {
                font-size: 1.8rem;
                flex-direction: column;
            }
            
            .content-wrapper p {
                font-size: 1rem;
            }
            
            .navbar .d-flex {
                gap: 0.5rem;
            }
            
            .btn-outline-primary,
            .btn-primary {
                padding: 0.5rem 1rem;
                font-size: 0.8rem;
            }
            
            .logo {
                width: 90px;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="${pageContext.request.contextPath}/images/Logo_pandoo.png" alt="Logo Pandoo" class="logo">
            </a>
            <div class="d-flex">
                <a href="${pageContext.request.contextPath}/views/login.jsp" class="btn btn-outline-primary me-2">
                    <i class="fas fa-sign-in-alt"></i> Iniciar Sesión
                </a>
                <a href="${pageContext.request.contextPath}/views/registro.jsp" class="btn btn-primary">
                    <i class="fas fa-user-plus"></i> Registrarse
                </a>
            </div>
        </div>
    </nav>
    
    <div class="container main-content">
        <div class="row justify-content-center align-items-center feature-section">
            <div class="col-md-6 text-center mb-4 mb-md-0">
                <img src="${pageContext.request.contextPath}/images/imagen_dashboard.jpg" alt="Plataforma Pandoo" class="feature-image">
            </div>
            <div class="col-md-6 content-wrapper">
                <h2>
                    <i class="fas fa-rocket"></i>
                    Bienvenido a Pandoo
                </h2>
                <p>Descubre una nueva forma de aprender tecnología. Pandoo es tu plataforma educativa de vanguardia que combina cursos interactivos, ejercicios prácticos y un sistema de seguimiento personalizado para maximizar tu aprendizaje en el mundo de la informática.</p>
                <p>Nuestra metodología innovadora te permite avanzar a tu propio ritmo mientras desarrollas habilidades reales en programación, desarrollo web, bases de datos y mucho más. Con Pandoo, cada ejercicio es una oportunidad para crecer y cada curso es un paso hacia tu futuro profesional.</p>
                
                <div class="features-grid">
                    <div class="feature-item">
                        <i class="fas fa-laptop-code"></i>
                        <h5>Cursos Prácticos</h5>
                        <p>Aprende haciendo con ejercicios reales</p>
                    </div>
                    <div class="feature-item">
                        <i class="fas fa-chart-line"></i>
                        <h5>Progreso Medible</h5>
                        <p>Sigue tu evolución en tiempo real</p>
                    </div>
                    <div class="feature-item">
                        <i class="fas fa-certificate"></i>
                        <h5>Certificación</h5>
                        <p>Valida tus conocimientos</p>
                    </div>
                </div>
                
                <div class="cta-section">
                    <a href="${pageContext.request.contextPath}/views/registro.jsp" class="btn btn-primary">
                        <i class="fas fa-arrow-right"></i> Comenzar Ahora
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>