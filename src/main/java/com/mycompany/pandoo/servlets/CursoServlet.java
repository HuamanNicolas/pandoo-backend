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

@WebServlet(name = "CursoServlet", urlPatterns = {"/CursoServlet"})
public class CursoServlet extends HttpServlet {

    @EJB
    private CursoFacade cursoFacade;

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
                    request.getRequestDispatcher("/views/dashboard.jsp").forward(request, response);
                    break;
            }
        }
    }
}
