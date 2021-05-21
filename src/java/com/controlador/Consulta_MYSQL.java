package com.controlador;

import java.sql.Connection;

/**
 *
 * @author Juanchope
 */
public abstract class Consulta_MYSQL {
    
    protected static String 
            nombre_BD = "",
            usuario = "",
            clave = "";
    
    private Connection con;
    
    public Consulta_MYSQL(){
        
    }
    
    private boolean conectarBD(){
        boolean res = false;
        
        /**Aquí irián las sentencias**/
        
        return res;
    }
    
    private boolean desconectarBD(){
        boolean res = false;
        
        /**Aquí irián las sentencias**/
        
        return res;
    }
    
    /**
     * como en consulta es una parametrizacion variable se puede realizar en un mismo metodo
     */    
    private Object[] Consultar(String sentenciaSQL, Object... parametros){
        Object[] res = null;
        
        /**Aquí irián las sentencias**/
        
        return res;
    }
    
    public abstract boolean insertarFila();
    
    public abstract boolean eliminarFila();
    
    public abstract boolean recargarFila();
    
    public abstract boolean modificarFila();
    
}
