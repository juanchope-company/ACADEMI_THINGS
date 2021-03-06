package com.modulo;

import java.time.LocalDate;
import java.util.LinkedList;

/**
 *
 * @author Juanchope
 */
public class Encuesta {
    
    private long 
            id=-1,
            id_usuario=-1;
    
    private String
            titulo="",
            descripcion="";
    
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
        if (titulo == null)
            titulo = "";
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        if (descripcion == null)
            descripcion = "";
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

    public static boolean agregarEncuesta(Encuesta encuesta) {
        String sentencia = "INSERT INTO `academicthings`.`encuesta`\n" +
                "(`titulo`,\n" +
                "`fecha_realizacion`,\n" +
                "`descripcion`,\n" +
                "`contesta`,\n" +
                "`id_usuario`)\n" +
                "VALUES\n(?,?,?,?,?)\n";
        return Conexion.ejecutarConsulta(
                sentencia,
                encuesta.getTitulo(),
                encuesta.getFecha_realizacon(),
                encuesta.getDescripcion(),
                encuesta.isContesta() ? "si" : "no",
                encuesta.getId_usuario()
        );
    } 
}
