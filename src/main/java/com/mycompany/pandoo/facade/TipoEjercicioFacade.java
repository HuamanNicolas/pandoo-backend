package com.mycompany.pandoo.facade;

import com.mycompany.pandoo.model.TipoEjercicio;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Stateless
public class TipoEjercicioFacade extends AbstractFacade<TipoEjercicio> {

    @PersistenceContext(unitName = "pandoo_persistence_unit")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TipoEjercicioFacade() {
        super(TipoEjercicio.class);
    }
}
