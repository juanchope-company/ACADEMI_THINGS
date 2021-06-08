package com.modulo;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.util.HashMap;
import java.util.LinkedList;

/**
 *
 * @author ivand
 */
public class Usuario {
    
    private long 
            id = 1;
    
    private String
            nombre_completo,
            nombre_usuario,
            correo_electronico,
            genero,
            profesion,
            universidad,
            descripcion_de_perfil,
            numero_celular,
            contrasenna;
    
    private LocalDate
            fecha_nacimiento;
    
    private byte[]
            foto_perfil;

    public Usuario() {
    }

    public Usuario(String nombre_usuario, String contrasenna) {
        this.nombre_usuario = nombre_usuario;
        this.contrasenna = contrasenna;
    }

    public Usuario(String nombre_completo, String nombre_usuario, String correo_electronico, String universidad, String descripcion_de_perfil, String numero_celular, String contrasenna, LocalDate fecha_nacimiento) {
        this.nombre_completo = nombre_completo;
        this.nombre_usuario = nombre_usuario;
        this.correo_electronico = correo_electronico;
        this.universidad = universidad;
        this.descripcion_de_perfil = descripcion_de_perfil;
        this.numero_celular = numero_celular;
        this.contrasenna = contrasenna;
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public Usuario(String nombre_completo, String nombre_usuario, String correo_electronico, String genero, String profesion, String universidad, String descripcion_de_perfil, String numero_celular, String contrasenna, LocalDate fecha_nacimiento, byte[] foto_perfil) {
        this.nombre_completo = nombre_completo;
        this.nombre_usuario = nombre_usuario;
        this.correo_electronico = correo_electronico;
        this.genero = genero;
        this.profesion = profesion;
        this.universidad = universidad;
        this.descripcion_de_perfil = descripcion_de_perfil;
        this.numero_celular = numero_celular;
        this.contrasenna = contrasenna;
        this.fecha_nacimiento = fecha_nacimiento;
        this.foto_perfil = foto_perfil;
    }

    public Usuario(long id, String nombre_completo, String nombre_usuario, String correo_electronico, String genero, String profesion, String universidad, String descripcion_de_perfil, String numero_celular, String contrasenna, LocalDate fecha_nacimiento, byte[] foto_perfil) {
        this.id = id;
        this.nombre_completo = nombre_completo;
        this.nombre_usuario = nombre_usuario;
        this.correo_electronico = correo_electronico;
        this.genero = genero;
        this.profesion = profesion;
        this.universidad = universidad;
        this.descripcion_de_perfil = descripcion_de_perfil;
        this.numero_celular = numero_celular;
        this.contrasenna = contrasenna;
        this.fecha_nacimiento = fecha_nacimiento;
        this.foto_perfil = foto_perfil;
    }

    public long getId() {
        return id;
    }

    public String getNombre_completo() {
        return nombre_completo;
    }

    public void setNombre_completo(String nombre_completo) {
        this.nombre_completo = nombre_completo;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getCorreo_electronico() {
        return correo_electronico;
    }

    public void setCorreo_electronico(String correo_electronico) {
        this.correo_electronico = correo_electronico;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getProfesion() {
        return profesion;
    }

    public void setProfesion(String profesion) {
        this.profesion = profesion;
    }

    public String getUniversidad() {
        return universidad;
    }

    public void setUniversidad(String universidad) {
        this.universidad = universidad;
    }

    public String getDescripcion_de_perfil() {
        return descripcion_de_perfil;
    }

    public void setDescripcion_de_perfil(String descripcion_de_perfil) {
        this.descripcion_de_perfil = descripcion_de_perfil;
    }

    public String getNumero_celular() {
        return numero_celular;
    }

    public void setNumero_celular(String numero_celular) {
        this.numero_celular = numero_celular;
    }

    public String getContrasenna() {
        return contrasenna;
    }

    public void setContrasenna(String contrasenna) {
        this.contrasenna = contrasenna;
    }

    public LocalDate getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(LocalDate fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public byte[] getFoto_perfil() {
        return foto_perfil;
    }

    public void setFoto_perfil(byte[] foto_perfil) {
        this.foto_perfil = foto_perfil;
    }  
    
    public int getEdad(){
        int res = -1;
        
        if (fecha_nacimiento != null)
            res = Period.between(fecha_nacimiento, LocalDate.now()).getYears();
        
        return res;
    }
    
    public static Usuario seleccionarUsuario(Usuario datos){
        Usuario res = null;
        
        String sentencia = "Select * from USUARIO\n"
                + "\tWHERE nombre_usuario = ? AND contrasenna = ?";
        
        LinkedList<HashMap<String, Object>> aux = Conexion.consultarFilas(
                sentencia, 
                datos.getNombre_usuario(),
                datos.getContrasenna()
        );
        
        if (aux != null)
            if (aux.size() > 0)
                res = parseUsuario(aux.getLast());                
        
        return res;
    }

    private static Usuario parseUsuario(HashMap<String, Object> datos) {
        Usuario res = null;
        
        Long id = (long) datos.get("id");
        String nombre_completo = (String) datos.get("nombre_completo");
        String nombre_usuario = (String) datos.get("nombre_usuario");
        String correo_electronico = (String) datos.get("correo_electronico");
        String genero = (String) datos.get("genero");
        String profesion = (String) datos.get("profesion");
        String universidad = (String) datos.get("universidad");
        String descripcion_de_perfil = (String) datos.get("descripcion_de_perfil");
        String numero_celular = (String) datos.get("numero_celular");
        String contrasenna = (String) datos.get("contrasenna");
        LocalDate fecha_nacimiento = new Date(((Date) datos.get("fecha_nacimiento")).getTime()).toLocalDate();
        byte[] foto_perfil = (byte[]) datos.get("foto_perfil");
        
        res = new Usuario(id, nombre_completo, nombre_usuario, correo_electronico, genero, profesion, universidad, descripcion_de_perfil, numero_celular, contrasenna, fecha_nacimiento, foto_perfil);
                
        return res;
    }

    public static boolean agregarUsuario(Usuario usuario){
        String sentencia = "INSERT INTO USUARIO (nombre_completo,nombre_usuario,correo_electronico,genero,profesion,universidad,descipcion_de_perfil,"
                + "numero_celular,contrasenna,fecha_nacimiento,foto_perfil) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        
        return Conexion.ejecutarConsulta(
                sentencia,
                usuario.getNombre_completo(),
                usuario.getNombre_usuario(),
                usuario.getCorreo_electronico(),
                usuario.getGenero(),
                usuario.getProfesion(),
                usuario.getUniversidad(),
                usuario.getDescripcion_de_perfil(),
                usuario.getNumero_celular(),
                usuario.getContrasenna(),
                usuario.getFecha_nacimiento(),
                usuario.getFoto_perfil()
        ); 
        
    }   
    
}
