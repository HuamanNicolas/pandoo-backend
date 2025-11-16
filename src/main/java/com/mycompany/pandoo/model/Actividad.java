package com.mycompany.pandoo.model;

import java.io.Serializable;
import java.util.List;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OrderBy;
import jakarta.persistence.Table;

@Entity
@Table(name = "Actividad")
public class Actividad implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "idActividad")
    private int id;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "orden")
    private int orden;

    @ManyToOne
    @JoinColumn(name = "Curso_idCurso")
    private Curso curso;
    
    @OneToMany(mappedBy = "actividad", fetch = FetchType.EAGER)
    @OrderBy("orden ASC")
    private List<Ejercicio> ejercicios;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }
    
    public List<Ejercicio> getEjercicios() {
        return ejercicios;
    }

    public void setEjercicios(List<Ejercicio> ejercicios) {
        this.ejercicios = ejercicios;
    }
}
