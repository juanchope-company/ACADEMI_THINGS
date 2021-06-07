package com.controlador;

import com.modulo.Usuario;

/**
 *
 * @author Desarollo
 */
public abstract class Interface_Libro_Interes {
    
    private Usuario usuario;
    
    public abstract void agregarLibro();
    
    public abstract void eliminarLibro();
    
    public abstract void verLibro();
    
    public abstract void listarLibros();
    
    public abstract void agregarEtiqueta();
    
    public abstract void eliminarEtiqueta();
}
