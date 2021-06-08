package com.modulo;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author Juanchope
 */
public class Publicacion {
    
    private int 
            id = -1,
            votos_positivos = 0,
            votos_negativos = 0;
    
    private Long 
            id_usuario = -1L;
    
    private LocalDate
            fecha;
    
    private LocalTime
            hora;
    
    private String
            contenido = "";

    public Publicacion(Usuario usuario) {
        this.id_usuario = usuario.getId();
    } 
    
    public Publicacion(int id, int votos_positivos, int votos_negativos, LocalDate fecha, LocalTime hora, String contenido) {
        this.id = id;
        this.votos_positivos = votos_positivos;
        this.votos_negativos = votos_negativos;
        this.fecha = fecha;
        this.hora = hora;
        this.contenido = contenido;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVotos_positivos() {
        return votos_positivos;
    }

    public void setVotos_positivos(int votos_positivos) {
        this.votos_positivos = votos_positivos;
    }

    public int getVotos_negativos() {
        return votos_negativos;
    }

    public void setVotos_negativos(int votos_negativos) {
        this.votos_negativos = votos_negativos;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public LocalTime getHora() {
        return hora;
    }

    public void setHora(LocalTime hora) {
        this.hora = hora;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public Long getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Long id_usuario) {
        this.id_usuario = id_usuario;
    }  
    
    public static Publicacion selecionarPublicacion(Publicacion datos){
        Publicacion res = null;
        
        /*Proceso*/
        
        return res;
    }
    
    public static boolean agregarPublicacion (Publicacion publicacion){
        String sentencia = "INSERT INTO `academicthings`.`publicacion`\n" +
                "(`fecha`,\n" +
                "`hora`,\n" +
                "`contenido`,\n" +
                "`votos_positivos`,\n" +
                "`votos_negativos`,\n" +
                "`id_usuario`)\n" +
                "VALUES\n(?,?,?,?,?,?);";
        return Conexion.ejecutarConsulta(
                sentencia,
                publicacion.getFecha(),
                publicacion.getHora(),
                publicacion.getContenido(),
                publicacion.getVotos_positivos(),
                publicacion.getVotos_negativos(),
                publicacion.getId_usuario()
        );
    }
    
    public String validarPublicacion(){
        return null;
    }
}
