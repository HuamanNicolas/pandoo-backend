<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario - Pandoo</title>
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
        
        .register-card {
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
            padding: 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
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
        
        .card-header-custom i {
            font-size: 2.2rem;
            animation: bounce 2s ease-in-out infinite;
        }
        
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-8px); }
        }
        
        .card-body-custom {
            padding: 2.5rem;
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
            padding: 0.9rem 1rem;
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
        
        .button-group {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }
        
        .btn-primary {
            background: linear-gradient(45deg, var(--electric-green), var(--accent-blue));
            border: none;
            color: var(--dark-blue);
            font-weight: 600;
            padding: 0.9rem 2rem;
            border-radius: 12px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 1rem;
            box-shadow: 0 4px 15px rgba(0, 255, 136, 0.3);
            flex: 1;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.8rem;
        }
        
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 25px rgba(0, 255, 136, 0.5);
            color: var(--dark-blue);
        }
        
        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.3);
            color: #fff;
            font-weight: 600;
            padding: 0.9rem 2rem;
            border-radius: 12px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 1rem;
            flex: 1;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.8rem;
        }
        
        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.15);
            border-color: var(--electric-green);
            color: var(--electric-green);
            transform: translateY(-3px);
            box-shadow: 0 6px 25px rgba(0, 255, 136, 0.2);
        }
        
        .login-link {
            text-align: center;
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 1px solid rgba(0, 255, 136, 0.2);
        }
        
        .login-link p {
            color: rgba(255, 255, 255, 0.7);
            margin: 0;
            font-size: 0.95rem;
        }
        
        .login-link a {
            color: var(--electric-green);
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .login-link a:hover {
            color: var(--accent-blue);
            text-shadow: 0 0 10px rgba(0, 255, 136, 0.5);
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
        
        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }
            
            .card-header-custom h3 {
                font-size: 1.5rem;
            }
            
            .card-body-custom {
                padding: 1.5rem;
            }
            
            .button-group {
                flex-direction: column;
            }
            
            .btn-primary,
            .btn-secondary {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-6">
                <div class="register-card">
                    <div class="card-header-custom">
                        <h3>
                           
                            Registro de Nuevo Usuario
                        </h3>
                    </div>
                    <div class="card-body-custom">
                        <form action="${pageContext.request.contextPath}/RegistroServlet" method="post">
                            <div class="mb-3">
                                <label for="nombre" class="form-label">
                                    <i class="fas fa-id-card"></i>
                                    Nombre Completo
                                </label>
                                <div class="input-icon-wrapper">
                                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingresa tu nombre completo" required>
                                    <i class="fas fa-user input-icon"></i>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="username" class="form-label">
                                    <i class="fas fa-at"></i>
                                    Nombre de Usuario
                                </label>
                                <div class="input-icon-wrapper">
                                    <input type="text" class="form-control" id="username" name="username" placeholder="Elige un nombre de usuario" required>
                                    <i class="fas fa-user-circle input-icon"></i>
                                </div>
                            </div>
                            
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
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Crea una contraseña segura" required>
                                    <i class="fas fa-key input-icon"></i>
                                </div>
                            </div>
                            
                            <div class="button-group">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-check-circle"></i>
                                    Registrarse
                                </button>
                                <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary">
                                    <i class="fas fa-arrow-left"></i>
                                    Volver al Inicio
                                </a>
                            </div>
                            
                            <div class="login-link">
                                <p>¿Ya tienes una cuenta? <a href="${pageContext.request.contextPath}/views/login.jsp">Inicia Sesión</a></p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>