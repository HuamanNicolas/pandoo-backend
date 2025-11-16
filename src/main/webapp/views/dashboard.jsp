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
    <title>Dashboard - Pandoo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Pandoo</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/LogoutServlet">Cerrar Sesión</a>
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
            <div class="alert alert-success" role="alert">
                <h4 class="alert-heading">¡Bienvenido, <%= usuario.getNombre() %>!</h4>
                <p>Has iniciado sesión correctamente.</p>
            </div>

            <hr>

            <h3>Mis Cursos</h3>
            <div class="row">
                <% for (Curso curso : todosLosCursos) {
                    if (idsCursosInscritos.contains(curso.getId())) { %>
                        <div class="col-md-4 mb-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title"><%= curso.getNombre() %></h5>
                                    <a href="${pageContext.request.contextPath}/CursoServlet?action=view&id=<%= curso.getId() %>" class="btn btn-success">Ver Curso</a>
                                </div>
                            </div>
                        </div>
                <%  }
                } %>
            </div>

            <hr>

            <h3>Cursos Disponibles</h3>
            <div class="row">
                <% for (Curso curso : todosLosCursos) {
                    if (!idsCursosInscritos.contains(curso.getId())) { %>
                        <div class="col-md-4 mb-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title"><%= curso.getNombre() %></h5>
                                    <form action="${pageContext.request.contextPath}/InscripcionServlet" method="post">
                                        <input type="hidden" name="idCurso" value="<%= curso.getId() %>">
                                        <button type="submit" class="btn btn-primary">Inscribirse</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                <%  }
                } %>
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