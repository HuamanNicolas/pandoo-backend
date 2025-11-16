package com.mycompany.pandoo.servlets;

import com.mycompany.pandoo.facade.CursoFacade;
import com.mycompany.pandoo.facade.InscripcionFacade;
import com.mycompany.pandoo.model.Curso;
import com.mycompany.pandoo.model.Inscripcion;
import com.mycompany.pandoo.model.Usuario;
import java.io.IOException;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "InscripcionServlet", urlPatterns = {"/InscripcionServlet"})
public class InscripcionServlet extends HttpServlet {

    @EJB
    private InscripcionFacade inscripcionFacade;

    @EJB
    private CursoFacade cursoFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuario");

        if (usuario != null) {
            int idCurso = Integer.parseInt(request.getParameter("idCurso"));
            
            // Verificar si ya está inscrito
            if (!inscripcionFacade.existeInscripcion(usuario.getId(), idCurso)) {
                Curso curso = cursoFacade.find(idCurso);

                Inscripcion inscripcion = new Inscripcion();
                inscripcion.setUsuario(usuario);
                inscripcion.setCurso(curso);
                inscripcion.setFechaInscripcion(new java.sql.Timestamp(System.currentTimeMillis()));

                inscripcionFacade.create(inscripcion);
                
                // Actualizar el usuario en la sesión
                usuario.getInscripciones().add(inscripcion);
                session.setAttribute("usuario", usuario);
            }

            response.sendRedirect(request.getContextPath() + "/CursoServlet?action=list");
        } else {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
        }
    }
}
