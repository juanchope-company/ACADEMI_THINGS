package com.modulo;

/**
 *
 * @author Juan David G
 * 
 */
public class Respuesta {
    
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
    
    public static Respuesta selecionarRespuesta(Respuesta datos){
        Respuesta res = null;
        
        /** Proceso **/
        
        return res;
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
    
}
