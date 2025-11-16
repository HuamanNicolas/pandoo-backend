package com.mycompany.pandoo.facade;

import com.mycompany.pandoo.model.Inscripcion;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Stateless
public class InscripcionFacade extends AbstractFacade<Inscripcion> {

    @PersistenceContext(unitName = "pandoo_persistence_unit")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public InscripcionFacade() {
        super(Inscripcion.class);
    }

    public boolean existeInscripcion(int idUsuario, int idCurso) {
        Long count = em.createQuery("SELECT COUNT(i) FROM Inscripcion i WHERE i.usuario.id = :idUsuario AND i.curso.id = :idCurso", Long.class)
                       .setParameter("idUsuario", idUsuario)
                       .setParameter("idCurso", idCurso)
                       .getSingleResult();
        return count > 0;
    }
}
