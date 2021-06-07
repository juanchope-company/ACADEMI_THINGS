package com.controlador;

/**
 *
 * @author Juanchope
 * @author Ivan
 * 
 */
public abstract class Interface_Sesion {
    
    protected final String 
            nombre_usuario,
            contrasenna;

    public Interface_Sesion(String nombre_usuario, String contrasenna) {
        this.nombre_usuario = nombre_usuario;
        this.contrasenna = contrasenna;
    }
    
    
    public abstract void iniciarSesion();
    
    public abstract void cerraSesion();
    
    public abstract void crearUsuario();
}
