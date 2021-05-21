package com.controlador;

import com.Modulo.*;
import java.util.LinkedList;

/**
 *
 * @author Juanchope
 * 
 */
public abstract class INTERFACE_ACADEMIC_THINGS {
    
    protected Usuario usuario;
    protected LinkedList<Encuesta> lasEncuestas;
    protected LinkedList<Libro_interes> los_libros_de_interes;
    protected LinkedList<PQR> lasPQRs;
    protected LinkedList<Publicacion> las_pubicaciones;
    
    /**
     * 
     * @return devuelve un mensaje con el estado del procedimiento
     */
    public abstract String agregarUsuario();
    
    /**
     * 
     * @return devuelve un mensaje con el estado del procedimiento
     */
    public abstract String eliminarUsuario();
    
    /**
     * 
     * @return devuelve un mensaje con el estado del procedimiento
     */
    public abstract String modificarUsuario();
    
    /**
     * 
     * @return devuelve un mensaje con el estado del procedimiento
     */
    public abstract String iniciarSesion();
    
    /**
     * 
     * @return devuelve un mensaje con el estado del procedimiento
     */
    public abstract String cerrarSesion();
    
    /**
     * 
     * @return devuelve un mensaje con el estado del procedimiento
     */
    public abstract String crearEncuesta();
    
    /**
     * 
     * @return devuelve un mensaje con el estado del procedimiento
     */
    public abstract String contestarEncuesta();
    
    /**
     * 
     * @return devuelve un mensaje con el estado del procedimiento
     */
    public abstract String crearPQR();
    
    /**
     * 
     * @return devuelve un mensaje con el estado del procedimiento
     */
    public abstract String redactarManuscrito();
    
    /**
     * 
     * @return devuelve un mensaje con el estado del procedimiento
     */
    public abstract String crearPublicacion();
    
    /**
     * 
     * @return devuelve un mensaje con el estado del procedimiento
     */
    public abstract String buscarLibro();
    
    /**
     * 
     * @return devuelve un mensaje con el estado del procedimiento
     */
    public abstract String subirLibro();
    
    /**
     * 
     * @return devuelve un mensaje con el estado del procedimiento
     */
    public abstract String etiquetarPublicacion();
    
    /**
     * 
     * @return devuelve un mensaje con el estado del procedimiento
     */
    public abstract String etiquetarLibro();
}
