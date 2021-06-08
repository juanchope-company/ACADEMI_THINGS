package com.modulo;

import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.LinkedList;

/**
 *
 * @author Juan David G
 * 
 */
public class Respuesta {

    public Respuesta(Long id, Long consecutivo_Pregunta, int respuesta_Cerrada, String respuesta_Abierta) {
        this.id = id;
        this.consecutivo_Pregunta = consecutivo_Pregunta;
        this.respuesta_Cerrada = respuesta_Cerrada;
        this.respuesta_Abierta = respuesta_Abierta;
    }
    
    private Long 
            id,
            consecutivo_Pregunta;
    
    private int 
            respuesta_Cerrada;
    
    private String 
            respuesta_Abierta;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getConsecutivo_Pregunta() {
        return consecutivo_Pregunta;
    }

    public void setConsecutivo_Pregunta(Long consecutivo_Pregunta) {
        this.consecutivo_Pregunta = consecutivo_Pregunta;
    }

    public int getRespuesta_Cerrada() {
        return respuesta_Cerrada;
    }

    public void setRespuesta_Cerrada(int respuesta_Cerrada) {
        this.respuesta_Cerrada = respuesta_Cerrada;
    }

    public String getRespuesta_Abierta() {
        return respuesta_Abierta;
    }

    public void setRespuesta_Abierta(String respuesta_Abierta) {
        this.respuesta_Abierta = respuesta_Abierta;
    }
    
  
    
    public static boolean agregarRespuesta(Respuesta respuesta){
        
        String sentencia = "INSERT INTO RESPUESTA (consecutivo_pregunta,respuesta_cerrada,respuesta_abierta) VALUES (?,?,?)";
        return Conexion.ejecutarConsulta(
                sentencia,
                respuesta.getConsecutivo_Pregunta(),
                respuesta.getRespuesta_Cerrada(),
                respuesta.getRespuesta_Abierta()
        );
        
    }
    
     public static Respuesta seleccionarRespuesta(Respuesta datos){
        Respuesta res = null;
        
        String sentencia = "Select * from RESPUESTA\n";
        
        LinkedList<HashMap<String, Object>> aux = Conexion.consultarFilas(
                sentencia, 
                datos.getConsecutivo_Pregunta(),
                datos.getRespuesta_Abierta(),
                datos.getRespuesta_Cerrada()
        );
        
                      
        
        return res;
    }

    private static Respuesta parseRespuesta(HashMap<String, Object> datos) {
        Respuesta res = null;
        
        Long id=(long) datos.get("id");
        Long consecutivo = (long) datos.get("consecutivo");
        int respuesta_cerrada = (int) (datos.get("respuesta_cerrada"));
        String respuesta_abierta= (String) datos.get("respuesta_abierta");
      
        
        res = new Respuesta(id, consecutivo, respuesta_cerrada, respuesta_abierta);
                
        return res;
    }

   
    
}
