package com.modulo;

import java.time.LocalDate;

/**
 *
 * @author Juanchope
 */
public class Libro_interes {
    
    private Long 
            id,
            id_usuario,
            id_libro;
    
    private LocalDate
            fecha_consulta;

    public Libro_interes(Long id, Long id_usuario, Long id_libro, LocalDate fecha_consulta) {
        this.id = id;
        this.id_usuario = id_usuario;
        this.id_libro = id_libro;
        this.fecha_consulta = fecha_consulta;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Long id_usuario) {
        this.id_usuario = id_usuario;
    }

    public Long getId_libro() {
        return id_libro;
    }

    public void setId_libro(Long id_libro) {
        this.id_libro = id_libro;
    }

    public LocalDate getFecha_consulta() {
        return fecha_consulta;
    }

    public void setFecha_consulta(LocalDate fecha_consulta) {
        this.fecha_consulta = fecha_consulta;
    }
    
    
    public static boolean agregarLibroInteres (Libro_interes libro_interes){
        String sentencia = "INSERT INTO LIBRO_INTERES (id_usuario,id_libro) VALUES (?,?)";
        return Conexion.ejecutarConsulta(
                sentencia,
                libro_interes.getId_usuario(),
                libro_interes.getId_libro()
        );
                
    }
    
}
