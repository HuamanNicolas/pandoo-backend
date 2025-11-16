package com.mycompany.pandoo.facade;

import com.mycompany.pandoo.model.Actividad;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Stateless
public class ActividadFacade extends AbstractFacade<Actividad> {

    @PersistenceContext(unitName = "pandoo_persistence_unit")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ActividadFacade() {
        super(Actividad.class);
    }
}
