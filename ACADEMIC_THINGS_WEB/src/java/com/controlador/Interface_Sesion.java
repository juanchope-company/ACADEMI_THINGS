package com.controlador;

import com.modulo.Usuario;

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
    
    protected Usuario usuario;
    
    protected String res;

    public Interface_Sesion(String nombre_usuario, String contrasenna) {
        this.nombre_usuario = nombre_usuario;
        this.contrasenna = contrasenna;  
        usuario = new Usuario(nombre_usuario, contrasenna);
    }
    
    public String respuesta(){
        return res;
    }
    
    public abstract void iniciarSesion();
    
    public abstract void cerraSesion();
    
    public abstract void crearUsuario();
}
