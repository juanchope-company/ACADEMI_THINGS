package com.modulo;

import java.util.LinkedList;

/**
 *
 * @author Juan David G
 * 
 */
public class Pregunta {
    
    private Long
            consecutivo,
            id_encuesta;
    
    private String
            tipo = "",
            contenido = "";
    
    private LinkedList<String>
            banco_respuestas = new LinkedList<>();
    
    private LinkedList<Integer>
            respuestas_correctas = new LinkedList<>();
    
    private LinkedList<Respuesta>
            las_respuestas = new LinkedList<>();

    public Long getConsecutivo() {
        return consecutivo;
    }

    public void setConsecutivo(Long consecutivo) {
        this.consecutivo = consecutivo;
    }

    public Long getId_encuesta() {
        return id_encuesta;
    }

    public void setId_encuesta(Long id_encuesta) {
        this.id_encuesta = id_encuesta;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public LinkedList<String> getBanco_respuestas() {
        return banco_respuestas;
    }

    public void setBanco_respuestas(LinkedList<String> banco_respuestas) {
        this.banco_respuestas = banco_respuestas;
    }

    public LinkedList<Integer> getRespuestas_correctas() {
        return respuestas_correctas;
    }

    public void setRespuestas_correctas(LinkedList<Integer> respuestas_correctas) {
        this.respuestas_correctas = respuestas_correctas;
    }

    public LinkedList<Respuesta> getLas_respuestas() {
        return las_respuestas;
    }

    public void setLas_respuestas(LinkedList<Respuesta> las_respuestas) {
        this.las_respuestas = las_respuestas;
    }
    
    public static Pregunta selecionarPregunta(Pregunta datos){
        Pregunta res = null;
        
        /** proceso **/
        
        return res;
    }
    
}
