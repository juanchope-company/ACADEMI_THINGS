package com.modulo;

import java.time.LocalDate;
import java.util.LinkedList;

/**
 *
 * @author Juanchope
 */
public class Encuesta {
    
    private long 
            id;
    
    private String
            titulo,
            descripcion;
    
    private LocalDate
            fecha_realizacon;
    
    private boolean
            contesta;

    private LinkedList<Pregunta> 
            las_Preguntas;
    
    public long getId() {
        return id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public LocalDate getFecha_realizacon() {
        return fecha_realizacon;
    }

    public void setFecha_realizacon(LocalDate fecha_realizacon) {
        this.fecha_realizacon = fecha_realizacon;
    }

    public boolean isContesta() {
        return contesta;
    }

    public void setContesta(boolean contesta) {
        this.contesta = contesta;
    }

    public LinkedList<Pregunta> getLas_Preguntas() {
        return las_Preguntas;
    }

    public void setLas_Preguntas(LinkedList<Pregunta> las_Preguntas) {
        this.las_Preguntas = las_Preguntas;
    }
    
    public static Encuesta selecionarEncuesta(Encuesta datos){
        Encuesta res = null;
        
        /** Proceso **/
        
        return res;
    }
    
    
    
}
