package com.mycompany.pandoo.facade;

import com.mycompany.pandoo.model.Usuario;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class UsuarioFacade extends AbstractFacade<Usuario> {

    @PersistenceContext(unitName = "pandoo_persistence_unit")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }

    public Usuario buscarPorCredenciales(String email, String password) {
        try {
            List<Usuario> usuarios = em.createQuery("SELECT DISTINCT u FROM Usuario u LEFT JOIN FETCH u.inscripciones WHERE u.email = :email AND u.password = :password", Usuario.class)
                     .setParameter("email", email)
                     .setParameter("password", password)
                     .getResultList();
            if (usuarios.isEmpty()) {
                return null;
            }
            return usuarios.get(0);
        } catch (Exception e) {
            // Log the exception e
            return null;
        }
    }
    
    public void refresh(Usuario usuario) {
        em.refresh(em.merge(usuario));
    }
}
