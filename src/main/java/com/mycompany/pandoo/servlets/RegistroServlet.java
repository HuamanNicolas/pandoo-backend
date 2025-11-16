package com.mycompany.pandoo.servlets;

import com.mycompany.pandoo.facade.UsuarioFacade;
import com.mycompany.pandoo.model.Usuario;
import java.io.IOException;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
public class RegistroServlet extends HttpServlet {

    @EJB
    private UsuarioFacade usuarioFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre = request.getParameter("nombre");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setUsername(username);
        usuario.setEmail(email);
        usuario.setPassword(password); // En un caso real, se debería hashear la contraseña

        usuarioFacade.create(usuario);

        // Redirigir al usuario a la página de inicio de sesión con un mensaje de éxito
        response.sendRedirect(request.getContextPath() + "/index.jsp?registro=exitoso");
    }
}
