<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Pandoo</title>
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
            align-items: center;
            justify-content: center;
            padding: 2rem;
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
        
        .container {
            position: relative;
            z-index: 1;
        }
        
        .login-card {
            background: rgba(10, 25, 41, 0.9);
            border: 2px solid rgba(0, 255, 136, 0.3);
            border-radius: 25px;
            overflow: hidden;
            backdrop-filter: blur(15px);
            box-shadow: 0 15px 50px rgba(0, 255, 136, 0.3);
            animation: fadeInScale 0.6s ease-out;
        }
        
        @keyframes fadeInScale {
            from {
                opacity: 0;
                transform: scale(0.95);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
        
        .card-header-custom {
            background: linear-gradient(135deg, rgba(0, 255, 136, 0.2), rgba(0, 212, 255, 0.2));
            border-bottom: 2px solid rgba(0, 255, 136, 0.3);
            padding: 1rem 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
   
        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }
        
        .logo-container {
            position: relative;
            z-index: 1;
            margin-bottom: 1rem;
        }
        
        .login-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, var(--electric-green), var(--accent-blue));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            box-shadow: 0 8px 30px rgba(0, 255, 136, 0.5);
            animation: float 3s ease-in-out infinite;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        
        .login-icon i {
            font-size: 2.5rem;
            color: var(--dark-blue);
        }
        
        .card-header-custom h3 {
            position: relative;
            z-index: 1;
            color: var(--electric-green);
            font-size: 2rem;
            font-weight: 700;
            margin: 0;
            text-shadow: 0 0 20px rgba(0, 255, 136, 0.5);
        }
        
        .card-body-custom {
            padding: 2.5rem;
        }
        
        .welcome-text {
            text-align: center;
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 2rem;
            font-size: 1rem;
        }
        
        .form-label {
            color: rgba(255, 255, 255, 0.9);
            font-weight: 500;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.95rem;
        }
        
        .form-label i {
            color: var(--electric-green);
            font-size: 1rem;
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
            outline: none;
        }
        
        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.4);
        }
        
        .mb-3 {
            margin-bottom: 1.5rem !important;
        }
        
        .input-icon-wrapper {
            position: relative;
        }
        
        .input-icon {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(255, 255, 255, 0.4);
            transition: color 0.3s ease;
            pointer-events: none;
        }
        
        .form-control:focus + .input-icon {
            color: var(--electric-green);
        }
        
        .btn-primary {
            background: linear-gradient(45deg, var(--electric-green), var(--accent-blue));
            border: none;
            color: var(--dark-blue);
            font-weight: 600;
            padding: 1rem 2rem;
            border-radius: 12px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 1rem;
            box-shadow: 0 4px 15px rgba(0, 255, 136, 0.3);
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.8rem;
        }
        
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 25px rgba(0, 255, 136, 0.5);
            color: var(--dark-blue);
        }
        
        .card-footer-custom {
            background: rgba(0, 0, 0, 0.3);
            border-top: 2px solid rgba(0, 255, 136, 0.2);
            padding: 1.5rem;
            text-align: center;
            color: rgba(255, 255, 255, 0.7);
            font-size: 0.95rem;
        }
        
        .card-footer-custom a {
            color: var(--electric-green);
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .card-footer-custom a:hover {
            color: var(--accent-blue);
            text-shadow: 0 0 10px rgba(0, 255, 136, 0.5);
        }
        
        .divider {
            display: flex;
            align-items: center;
            text-align: center;
            margin: 2rem 0;
            color: rgba(255, 255, 255, 0.5);
        }
        
        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            border-bottom: 1px solid rgba(0, 255, 136, 0.2);
        }
        
        .divider span {
            padding: 0 1rem;
            font-size: 0.85rem;
        }
        
        .back-home-link {
            text-align: center;
            margin-top: 1rem;
        }
        
        .back-home-link a {
            color: rgba(255, 255, 255, 0.6);
            text-decoration: none;
            font-size: 0.9rem;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .back-home-link a:hover {
            color: var(--accent-blue);
        }
        
        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }
            
            .card-header-custom {
                padding: 2rem 1.5rem;
            }
            
            .card-header-custom h3 {
                font-size: 1.6rem;
            }
            
            .login-icon {
                width: 70px;
                height: 70px;
            }
            
            .login-icon i {
                font-size: 2rem;
            }
            
            .card-body-custom {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="login-card">
                    <div class="card-header-custom">
                        <div class="logo-container">
                            
                            <h3>Iniciar Sesión</h3>
                        </div>
                    </div>
                    <div class="card-body-custom">
                        <p class="welcome-text">
                            <i class="fas fa-hand-sparkles"></i> 
                            Bienvenido de nuevo a Pandoo
                        </p>
                        
                        <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label">
                                    <i class="fas fa-envelope"></i>
                                    Correo Electrónico
                                </label>
                                <div class="input-icon-wrapper">
                                    <input type="email" class="form-control" id="email" name="email" placeholder="tu@email.com" required>
                                    <i class="fas fa-envelope input-icon"></i>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="password" class="form-label">
                                    <i class="fas fa-lock"></i>
                                    Contraseña
                                </label>
                                <div class="input-icon-wrapper">
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Ingresa tu contraseña" required>
                                    <i class="fas fa-key input-icon"></i>
                                </div>
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-sign-in-alt"></i>
                                    Ingresar
                                </button>
                            </div>
                        </form>
                        
                        <div class="back-home-link">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <i class="fas fa-arrow-left"></i>
                                Volver al inicio
                            </a>
                        </div>
                    </div>
                    <div class="card-footer-custom">
                        ¿No tienes una cuenta? <a href="${pageContext.request.contextPath}/views/registro.jsp">Regístrate aquí</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>