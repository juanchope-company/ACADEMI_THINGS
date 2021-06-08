package com.vista.web;

import com.controlador.Interface_Encuesta;
import com.modulo.Encuesta;
import com.modulo.Usuario;

/**
 *
 * @author Desarollo
 */
public class EncuestaWeb extends Interface_Encuesta{

    public EncuestaWeb(Usuario usuario) {
        super(usuario);
    }

    @Override
    public void crearEncuesta() { 
        //res = Encuesta.validarEncuesta(encuesta);
        //Encuesta.agregarEncuesta(encuesta);
    }

    @Override
    public void agregarEncuesta() {
        if (Encuesta.agregarEncuesta(encuesta))
            res = "Encuesta agregada sactisfactoriamente";
        else
            res = "Encuesta no agregada";
            
    }

    @Override
    public void verEncuesta() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void responderEncuesta() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void modificarEncuesta() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Encuesta getEncuesta() {
        return encuesta;
    }

    public void setEncuesta(Encuesta encuesta) {
        this.encuesta = encuesta;
    }
    
    public boolean validarEncuesta(){
        return Encuesta.selecionarEncuesta(encuesta) != null;
    }
    
}
