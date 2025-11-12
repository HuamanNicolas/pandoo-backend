package com.mycompany.pandoo.servlets;

import com.mycompany.pandoo.dao.UsuarioDAO;
import com.mycompany.pandoo.model.Usuario;
import java.io.IOException;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @EJB
    private UsuarioDAO usuarioDAO;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Usuario usuario = usuarioDAO.buscarPorCredenciales(email, password);

        if (usuario != null) {
            // Iniciar sesión
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            response.sendRedirect(request.getContextPath() + "/views/dashboard.jsp");
        } else {
            // Credenciales incorrectas
            response.sendRedirect(request.getContextPath() + "/index.jsp?error=1");
        }
    }
}
