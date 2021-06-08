package com.controlador;

import com.modulo.Encuesta;
import com.modulo.Usuario;

/**
 *
 * @author Desarollo
 */

public abstract class Interface_Encuesta {
    
    private final Usuario usuario;
    protected Encuesta encuesta = new Encuesta();
    protected String res;

    public Interface_Encuesta(Usuario usuario) {
        this.usuario = usuario;
    }
    
    public String respuesta(){
        return res;
    }    
    
    public abstract void crearEncuesta();
    
    public abstract void agregarEncuesta();
    
    public abstract void verEncuesta();
    
    public abstract void responderEncuesta();
    
    public abstract void modificarEncuesta();
    
}
