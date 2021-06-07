package com.vista.web;

import com.controlador.Interface_Sesion;
import com.modulo.Usuario;

/**
 *
 * @author Desarollo
 */
public class Sesion extends Interface_Sesion{
    
    private String res;
    private Usuario usuario;
    
    public Sesion(){
        super(null, null);
    }
    
    public Sesion(String nombre_usuario, String contrasenna) {
        super(nombre_usuario, contrasenna);
    }
    
    public String respuesta(){
        return res;
    }
    
    public boolean esSesionValida(){
        if (usuario != null)
            if (usuario.getId() > 0)
                return true;
        return false;            
    }
   
    @Override
    public void iniciarSesion() {
        usuario = new Usuario(nombre_usuario, contrasenna);
        res = "bienvenido";
    }

    @Override
    public void cerraSesion() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
