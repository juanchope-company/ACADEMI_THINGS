package com.controlador;

import com.modulo.Usuario;

/**
 *
 * @author Desarollo
 */

public abstract class Interface_Encuesta {
    
    private Usuario usuario;
    
    public abstract void crearEncuesta();
    
    public abstract void agregarEncuesta();
    
    public abstract void verEncuesta();
    
    public abstract void responderEncuesta();
    
    public abstract void modificarEncuesta();
    
}
