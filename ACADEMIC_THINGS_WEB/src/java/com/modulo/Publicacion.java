package com.modulo;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author Juanchope
 */
public class Publicacion {

    public Publicacion(int id, int votos_positivos, int votos_negativos, LocalDate fecha, LocalTime hora, String contenido) {
        this.id = id;
        this.votos_positivos = votos_positivos;
        this.votos_negativos = votos_negativos;
        this.fecha = fecha;
        this.hora = hora;
        this.contenido = contenido;
    }
    
    
    
    private int 
            id,
            votos_positivos,
            votos_negativos;
    
    private LocalDate
            fecha;
    
    private LocalTime
            hora;
    
    private String
            contenido;
    
    public static Publicacion selecionarPublicacion(Publicacion datos){
        Publicacion res = null;
        
        /*Proceso*/
        
        return res;
    }
    
    
}
