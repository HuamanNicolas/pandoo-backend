package com.mycompany.pandoo.servlets;

import com.google.gson.Gson;
import com.mycompany.pandoo.facade.ActividadFacade;
import com.mycompany.pandoo.facade.EjercicioFacade;
import com.mycompany.pandoo.facade.ProgresoFacade;
import com.mycompany.pandoo.model.Actividad;
import com.mycompany.pandoo.model.Ejercicio;
import com.mycompany.pandoo.model.Progreso;
import com.mycompany.pandoo.model.Usuario;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "EjercicioServlet", urlPatterns = {"/EjercicioServlet"})
public class EjercicioServlet extends HttpServlet {

    @EJB
    private ActividadFacade actividadFacade;
    @EJB
    private ProgresoFacade progresoFacade;
    @EJB
    private EjercicioFacade ejercicioFacade;

    private final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "show"; // Default action
        }

        switch (action) {
            case "start":
                startExercises(request, response);
                break;
            case "show":
                showExercise(request, response);
                break;
            case "next":
                nextExercise(request, response);
                break;
            case "summary":
                showSummary(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción desconocida");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("check".equals(action)) {
            checkAnswer(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción desconocida");
        }
    }

    private void startExercises(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        try {
            int idActividad = Integer.parseInt(request.getParameter("idActividad"));
            Actividad actividad = actividadFacade.find(idActividad);
            if (actividad != null && !actividad.getEjercicios().isEmpty()) {
                session.setAttribute("ejercicio_list", actividad.getEjercicios());
                session.setAttribute("ejercicio_index", 0);
                session.setAttribute("ejercicio_respuestas_correctas", new ArrayList<Integer>());
                response.sendRedirect(request.getContextPath() + "/EjercicioServlet?action=show");
            } else {
                response.sendRedirect(request.getContextPath() + "/CursoServlet?action=view&id=" + actividad.getCurso().getId());
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de actividad inválido.");
        }
    }

    private void showExercise(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Ejercicio> ejercicios = (List<Ejercicio>) session.getAttribute("ejercicio_list");
        Integer index = (Integer) session.getAttribute("ejercicio_index");

        if (ejercicios == null || index == null) {
            response.sendRedirect(request.getContextPath() + "/CursoServlet?action=list");
            return;
        }

        if (index >= ejercicios.size()) {
            response.sendRedirect(request.getContextPath() + "/EjercicioServlet?action=summary");
            return;
        }

        request.setAttribute("ejercicio", ejercicios.get(index));
        request.setAttribute("ejercicioIndex", index);
        request.setAttribute("totalEjercicios", ejercicios.size());

        // Parse metadata for the view
        String metadataJson = ejercicios.get(index).getMetadata();
        if (metadataJson != null && !metadataJson.isEmpty()) {
            Map<String, Object> metadata = gson.fromJson(metadataJson, Map.class);
            request.setAttribute("metadata", metadata);
        }

        request.getRequestDispatcher("/views/ejercicio.jsp").forward(request, response);
    }

    private void checkAnswer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Ejercicio> ejercicios = (List<Ejercicio>) session.getAttribute("ejercicio_list");
        Integer index = (Integer) session.getAttribute("ejercicio_index");
        List<Integer> respuestasCorrectas = (List<Integer>) session.getAttribute("ejercicio_respuestas_correctas");

        if (ejercicios == null || index == null || respuestasCorrectas == null) {
            response.sendRedirect(request.getContextPath() + "/CursoServlet?action=list");
            return;
        }

        Ejercicio ejercicio = ejercicios.get(index);
        Map<String, Object> metadata = gson.fromJson(ejercicio.getMetadata(), Map.class);
        boolean isCorrect = false;

        String tipo = ejercicio.getTipoEjercicio().getNombre();

        if ("Multiple Choice".equals(tipo) || "Completar texto".equals(tipo)) {
            String userAnswer = request.getParameter("respuesta");
            String correctAnswer = (String) metadata.get("respuesta");
            isCorrect = userAnswer != null && userAnswer.equalsIgnoreCase(correctAnswer);
            request.setAttribute("userAnswer", userAnswer);
        } else if ("Unir con flechas".equals(tipo)) {
            Map<String, String> pares = (Map<String, String>) metadata.get("pares");
            isCorrect = true; // Assume correct until proven otherwise
            for (Map.Entry<String, String> entry : pares.entrySet()) {
                String userAnswer = request.getParameter("respuesta_" + entry.getKey().replace(" ", "_"));
                if (userAnswer == null || !userAnswer.equalsIgnoreCase(entry.getValue())) {
                    isCorrect = false;
                    break;
                }
            }
        }

        if (isCorrect && !respuestasCorrectas.contains(ejercicio.getId())) {
            respuestasCorrectas.add(ejercicio.getId());
        }

        request.setAttribute("ejercicio", ejercicio);
        request.setAttribute("metadata", metadata);
        request.setAttribute("ejercicioIndex", index);
        request.setAttribute("totalEjercicios", ejercicios.size());
        request.setAttribute("isAnswered", true);
        request.setAttribute("isCorrect", isCorrect);
        
        request.getRequestDispatcher("/views/ejercicio.jsp").forward(request, response);
    }

    private void nextExercise(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Integer index = (Integer) session.getAttribute("ejercicio_index");
        if (index != null) {
            session.setAttribute("ejercicio_index", index + 1);
        }
        response.sendRedirect(request.getContextPath() + "/EjercicioServlet?action=show");
    }

    private void showSummary(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        List<Integer> respuestasCorrectasIds = (List<Integer>) session.getAttribute("ejercicio_respuestas_correctas");
        List<Ejercicio> ejercicios = (List<Ejercicio>) session.getAttribute("ejercicio_list");

        if (usuario == null || respuestasCorrectasIds == null || ejercicios == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        // Guardar progreso
        for (Integer ejercicioId : respuestasCorrectasIds) {
            Progreso p = new Progreso();
            p.setUsuario(usuario);
            p.setEjercicio(ejercicioFacade.find(ejercicioId));
            p.setFecha(new Timestamp(System.currentTimeMillis()));
            progresoFacade.create(p);
        }

        request.setAttribute("score", respuestasCorrectasIds.size());
        request.setAttribute("total", ejercicios.size());
        if (!ejercicios.isEmpty()) {
            request.setAttribute("idCurso", ejercicios.get(0).getActividad().getCurso().getId());
        }

        // Limpiar sesión
        session.removeAttribute("ejercicio_list");
        session.removeAttribute("ejercicio_index");
        session.removeAttribute("ejercicio_respuestas_correctas");

        request.getRequestDispatcher("/views/resumen.jsp").forward(request, response);
    }
}
