package com.mycompany.pandoo.facade;

import com.mycompany.pandoo.model.Ejercicio;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Stateless
public class EjercicioFacade extends AbstractFacade<Ejercicio> {

    @PersistenceContext(unitName = "pandoo_persistence_unit")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EjercicioFacade() {
        super(Ejercicio.class);
    }
}
