package com.modulo;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author Desarollo
 */
public class Manuscrito {
    
    private Long 
            id,
            id_usuario;
    
    private String 
            encabezado,
            contenido;
    
    private LocalDate 
            fecha;
    
    private LocalTime
            hora;
    
    private byte[] 
            archivo;

    public Manuscrito(Usuario usuario) {
        id_usuario = usuario.getId();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEncabezado() {
        if (encabezado == null)
            encabezado = "";
        return encabezado;
    }

    public void setEncabezado(String encabezado) {
        this.encabezado = encabezado;
    }

    public String getContenido() {
        if (contenido == null)
            contenido = "";
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
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

    public byte[] getArchivo() {
        return archivo;
    }

    public void setArchivo(byte[] archivo) {
        this.archivo = archivo;
    }

    public Long getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Long id_usuario) {
        this.id_usuario = id_usuario;
    }
}
