package com.mycompany.pandoo.model;

import java.io.Serializable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Ejercicio")
public class Ejercicio implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "idEjercicio")
    private Integer id;

    @Column(name = "enunciado")
    private String enunciado;

    @Column(name = "orden")
    private Integer orden;

    @Column(name = "metadata")
    private String metadata;

    @ManyToOne
    @JoinColumn(name = "Unidad_idUnidad", referencedColumnName = "idActividad")
    private Actividad actividad;

    @ManyToOne
    @JoinColumn(name = "Tipo_ejercicio_idTipo_ejercicio", referencedColumnName = "idTipo_ejercicio")
    private TipoEjercicio tipoEjercicio;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEnunciado() {
        return enunciado;
    }

    public void setEnunciado(String enunciado) {
        this.enunciado = enunciado;
    }

    public Integer getOrden() {
        return orden;
    }

    public void setOrden(Integer orden) {
        this.orden = orden;
    }

    public String getMetadata() {
        return metadata;
    }

    public void setMetadata(String metadata) {
        this.metadata = metadata;
    }

    public Actividad getActividad() {
        return actividad;
    }

    public void setActividad(Actividad actividad) {
        this.actividad = actividad;
    }

    public TipoEjercicio getTipoEjercicio() {
        return tipoEjercicio;
    }

    public void setTipoEjercicio(TipoEjercicio tipoEjercicio) {
        this.tipoEjercicio = tipoEjercicio;
    }
}
