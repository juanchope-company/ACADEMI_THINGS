package com.modulo;

import java.time.LocalDate;
import java.util.LinkedList;

/**
 *
 * @author Juanchope
 */
public class Encuesta {
    
    private long 
            id,
            id_usuario;
    
    private String
            titulo,
            descripcion;
    
    private LocalDate
            fecha_realizacon;
    
    private boolean
            contesta;

    private LinkedList<Pregunta> 
            las_Preguntas = new LinkedList<>();

    public Encuesta() {
        las_Preguntas.add(new Pregunta());
    }
    
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

    public long getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(long id_usuario) {
        this.id_usuario = id_usuario;
    }
    
    public static Encuesta selecionarEncuesta(Encuesta datos){
        Encuesta res = null;
        
        /** Proceso **/
        
        return res;
    }
    
    public static boolean crearEncuesta (Encuesta encuesta){
        String sentencia = "INSERT INTO ENCUESTA (titulo,descripcion,contesta,id_usuario) VALUES (?,?,?,?)";
        return Conexion.ejecutarConsulta(
                sentencia,
                encuesta.getTitulo(),
                encuesta.getDescripcion(),
                encuesta.isContesta(),
                encuesta.getId_usuario()
        );
    }
    
}
