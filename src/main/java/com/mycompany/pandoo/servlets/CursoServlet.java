package com.mycompany.pandoo.servlets;

import com.mycompany.pandoo.facade.CursoFacade;
import com.mycompany.pandoo.model.Curso;
import java.io.IOException;
import java.util.List;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.mycompany.pandoo.facade.ProgresoFacade; // Importar ProgresoFacade

@WebServlet(name = "CursoServlet", urlPatterns = {"/CursoServlet"})
public class CursoServlet extends HttpServlet {

    @EJB
    private CursoFacade cursoFacade;
    
    @EJB
    private ProgresoFacade progresoFacade; // Inyectar ProgresoFacade

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "view":
                    int idCurso = Integer.parseInt(request.getParameter("id"));
                    Curso curso = cursoFacade.find(idCurso);
                    request.setAttribute("curso", curso);
                    request.getRequestDispatcher("/views/curso.jsp").forward(request, response);
                    break;
                case "list":
                    List<Curso> cursos = cursoFacade.findAll();
                    request.setAttribute("cursos", cursos);
                    
                    com.mycompany.pandoo.model.Usuario usuario = (com.mycompany.pandoo.model.Usuario) request.getSession().getAttribute("usuario");
                    if (usuario != null) {
                        java.util.Map<Integer, Double> courseProgressMap = new java.util.HashMap<>();
                        
                        // Obtener todos los progresos del usuario usando el facade
                        List<com.mycompany.pandoo.model.Progreso> progresosUsuario = progresoFacade.findByUsuario(usuario);

                        for (Curso c : cursos) {
                            // Calcular el total de ejercicios del curso
                            long totalEjercicios = c.getActividades().stream()
                                                    .mapToLong(actividad -> actividad.getEjercicios().size())
                                                    .sum();

                            if (totalEjercicios > 0) {
                                // Contar los ejercicios completados (distintos) por el usuario para este curso
                                long ejerciciosCompletados = progresosUsuario.stream()
                                    .filter(progreso -> progreso.getEjercicio().getActividad().getCurso().getId() == c.getId())
                                    .map(progreso -> progreso.getEjercicio().getId()) // Mapear al ID del ejercicio
                                    .distinct() // Contar cada ejercicio una sola vez
                                    .count();
                                
                                double progressPercentage = ((double) ejerciciosCompletados / totalEjercicios) * 100.0;
                                courseProgressMap.put(c.getId(), progressPercentage);
                            } else {
                                courseProgressMap.put(c.getId(), 0.0); // No hay ejercicios, progreso 0
                            }
                        }
                        request.setAttribute("courseProgressMap", courseProgressMap);
                    }
                    
                    request.getRequestDispatcher("/views/dashboard.jsp").forward(request, response);
                    break;
            }
        }
    }
}
