package com.mycompany.pandoo.servlets;

import com.mycompany.pandoo.facade.ActividadFacade;
import com.mycompany.pandoo.model.Actividad;
import java.io.IOException;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ActividadServlet", urlPatterns = {"/ActividadServlet"})
public class ActividadServlet extends HttpServlet {

    @EJB
    private ActividadFacade actividadFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idActividadStr = request.getParameter("id");
        if (idActividadStr != null) {
            try {
                int idActividad = Integer.parseInt(idActividadStr);
                Actividad actividad = actividadFacade.find(idActividad);
                
                if (actividad != null) {
                    request.setAttribute("actividad", actividad);
                    request.getRequestDispatcher("/views/actividad.jsp").forward(request, response);
                } else {
                    // Handle case where activity is not found
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Actividad no encontrada");
                }
            } catch (NumberFormatException e) {
                // Handle invalid ID format
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de actividad inválido");
            }
        } else {
            // Handle missing ID
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Falta el ID de la actividad");
        }
    }
}
