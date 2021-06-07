package com.controlador;

import com.modulo.Usuario;

/**
 *
 * @author Desarollo
 */
public abstract class Interface_Publicacion {
    
    private Usuario usuario;
    
    public abstract void crearPublicacion();
    
    public abstract void abjuntarManuscrito();
    
    public abstract void verPublicacion();
    
    public abstract void listarPublicaciones();
    
    public abstract void agregarComentario();
    
    public abstract void verComentarios();
    
    public abstract void agregarEtiqueta();
    
    public abstract void EliminarEtiqueta();
}
