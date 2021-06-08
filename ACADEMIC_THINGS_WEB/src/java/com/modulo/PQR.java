package com.modulo;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author Juanchope
 */
public class PQR {    
    
    private Long
            id_solicitud,
            id_usuario;
    
    private char 
            tipo;
    
    private String 
            asunto,
            cuerpo;
    
    private LocalDate
            fecha;
    
    private LocalTime
            hora;

    public PQR(Usuario usuario) {
        id_usuario = usuario.getId();
    }   
    
    public PQR(Long id_solicitud, Long id_usuario, char tipo, String asunto, String cuerpo, LocalDate fecha, LocalTime hora) {
        this.id_solicitud = id_solicitud;
        this.id_usuario = id_usuario;
        this.tipo = tipo;
        this.asunto = asunto;
        this.cuerpo = cuerpo;
        this.fecha = fecha;
        this.hora = hora;
    }

    public Long getId_solicitud() {
        return id_solicitud;
    }

    public void setId_solicitud(Long id_solicitud) {
        this.id_solicitud = id_solicitud;
    }

    public Long getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Long id_usuario) {
        this.id_usuario = id_usuario;
    }

    public char getTipo() {
        try {
            return tipo;
        } catch (Exception e) {
            tipo = ' ';
        }
        return tipo;
    }

    public void setTipo(char tipo) {
        this.tipo = tipo;
    }

    public String getAsunto() {
        if (asunto == null)
            asunto = "";
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getCuerpo() {
        if (cuerpo == null)
            cuerpo = "";
        return cuerpo;
    }

    public void setCuerpo(String cuerpo) {
        this.cuerpo = cuerpo;
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
    
    
    public static boolean agregarPQR (PQR pqr){
        String sentencia = "INSERT INTO PQR (tipo,asunto,cuerpo,id_usuario) VALUES (?,?,?,?)";
        return Conexion.ejecutarConsulta(
                sentencia, 
                pqr.getTipo(),
                pqr.getAsunto(),
                pqr.getCuerpo(),
                pqr.getId_usuario()
        );
        
    }
    
}
