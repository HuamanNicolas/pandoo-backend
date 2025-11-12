package com.mycompany.pandoo.dao;

import com.mycompany.pandoo.model.Usuario;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Stateless
public class UsuarioDAO {

    @PersistenceContext(unitName = "pandoo_persistence_unit")
    private EntityManager em;

    public void crear(Usuario usuario) {
        em.persist(usuario);
    }
    
    public Usuario buscarPorCredenciales(String email, String password) {
        try {
            return em.createQuery("SELECT u FROM Usuario u WHERE u.email = :email AND u.password = :password", Usuario.class)
                     .setParameter("email", email)
                     .setParameter("password", password)
                     .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
}
