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
}
