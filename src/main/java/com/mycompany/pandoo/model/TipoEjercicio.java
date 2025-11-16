package com.mycompany.pandoo.model;

import java.io.Serializable;
import java.util.List;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Tipo_ejercicio")
public class TipoEjercicio implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "idTipo_ejercicio")
    private Integer id;

    @Column(name = "nombre")
    private String nombre;

    @OneToMany(mappedBy = "tipoEjercicio")
    private List<Ejercicio> ejercicios;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public List<Ejercicio> getEjercicios() {
        return ejercicios;
    }

    public void setEjercicios(List<Ejercicio> ejercicios) {
        this.ejercicios = ejercicios;
    }
}
