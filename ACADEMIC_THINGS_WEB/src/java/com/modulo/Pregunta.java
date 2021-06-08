package com.modulo;

import java.util.HashMap;
import java.util.LinkedList;

/**
 *
 * @author Juan David G
 * 
 */
public class Pregunta {

    public Pregunta(Long consecutivo, Long id_encuesta, String tipo, String contenido, LinkedList<String> banco_respuestas, LinkedList<Integer> respuestas_correctas, LinkedList<Respuesta> las_respuestas) {
        this.consecutivo = consecutivo;
        this.id_encuesta = id_encuesta;
        this.tipo = tipo;
        this.contenido = contenido;
        this.banco_respuestas = banco_respuestas;
        this.respuestas_correctas = respuestas_correctas;
        this.las_respuestas = las_respuestas;
    }

    public Pregunta(Long consecutivo, Long id_encuesta, String tipo, String contenido) {
        this.consecutivo = consecutivo;
        this.id_encuesta = id_encuesta;
        this.tipo = tipo;
        this.contenido = contenido;
    }
    
    
    
    
    private Long
            consecutivo,
            id_encuesta;
    
    private String
            tipo,
            contenido;
    
    private LinkedList<String>
            banco_respuestas;
    
    private LinkedList<Integer>
            respuestas_correctas;
    
    private LinkedList<Respuesta>
            las_respuestas;

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
    
  
    
     public static boolean agregarPregunta(Pregunta pregunta){
     
         
        String sentencia = "INSERT INTO pregunta (id_encuesta,tipo,contenido) VALUES (?,?,?)";
        return Conexion.ejecutarConsulta(
                sentencia,
                pregunta.getId_encuesta(),
                pregunta.getTipo(),
                pregunta.getContenido()
        );
        
    }
    
     public static Pregunta seleccionarPregunta(Pregunta datos){
        Pregunta res = null;
        
        String sentencia = "Select * from PREGUNTA\n";
        
        LinkedList<HashMap<String, Object>> aux = Conexion.consultarFilas(
                sentencia, 
                datos.getConsecutivo(),
                datos.getId_encuesta(),
                datos.getTipo(),
                datos.getContenido()
                
                
                );
        
                      
        
        return res;
    }

    private static Pregunta parseRespuesta(HashMap<String, Object> datos) {
        Pregunta res = null;
        
        Long consecutivo = (long) datos.get("consecutio");
        Long id_encuesta= (long) datos.get("id_encuesta");
        String tipo= (String) datos.get("tipo");
        String contenido= (String) datos.get("contenido");
//        LinkedList banco= (LinkedList) datos.get("banco_respuestas");
//        LinkedList respuestas_correctas = (LinkedList) datos.get("respuestas_correctas");
      
        
        res = new Pregunta(consecutivo,id_encuesta,tipo,contenido);
                
        return res;
    }
    
}
