package com.mycompany.pandoo.facade;

import com.mycompany.pandoo.model.Progreso;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Stateless
public class ProgresoFacade extends AbstractFacade<Progreso> {

    @PersistenceContext(unitName = "pandoo_persistence_unit")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProgresoFacade() {
        super(Progreso.class);
    }
    
    public java.util.List<Progreso> findByUsuario(com.mycompany.pandoo.model.Usuario usuario) {
        jakarta.persistence.TypedQuery<Progreso> query = getEntityManager().createQuery(
            "SELECT p FROM Progreso p WHERE p.usuario = :usuario", Progreso.class);
        query.setParameter("usuario", usuario);
        return query.getResultList();
    }
    
    public boolean progresoExists(int idUsuario, int idEjercicio) {
        jakarta.persistence.Query query = getEntityManager().createQuery(
            "SELECT COUNT(p) FROM Progreso p WHERE p.usuario.id = :idUsuario AND p.ejercicio.id = :idEjercicio");
        query.setParameter("idUsuario", idUsuario);
        query.setParameter("idEjercicio", idEjercicio);
        return ((Long) query.getSingleResult()) > 0;
    }
}
