package com.vista.web;

import com.controlador.Interface_Sesion;
import com.modulo.Usuario;

/**
 *
 * @author Desarollo
 */
public class Sesion extends Interface_Sesion{
    
    public Sesion(){
        super(null, null);
    }
    
    public Sesion(Usuario usu){
        super(usu.getNombre_usuario(), usu.getContrasenna());
        usuario = usu;
    }
    
    public Sesion(String nombre_usuario, String contrasenna) {
        super(nombre_usuario, contrasenna);
    }
    
    public boolean esSesionValida(){
        if (usuario != null)
            if (usuario.getId() > 0)
                return true;
        return false;            
    }
   
    @Override
    public void iniciarSesion() {
        try {
            usuario = Usuario.seleccionarUsuario(usuario);
            if (usuario != null){
                res = "bienvenido";
            }
        } catch (Exception e) {
            res = "falló";
        }
        res = "Usuario no registrado";
    }

    @Override
    public void cerraSesion() {
        usuario = null;
        res = "Sesión cerrada";
    }

    @Override
    public void crearUsuario() {        
        if (usuario != null){
            res = usuario.validarCamposUsuario();

            if (res != null)
                return;
            
            if (Usuario.agregarUsuario(usuario))
                res = "El usuario fué agregado sactisfactoriamente.";
            else
                res = "El usuario no fué agregado";
        }
    }    

    public Usuario getUsuario() {
        return usuario;
    }
}
