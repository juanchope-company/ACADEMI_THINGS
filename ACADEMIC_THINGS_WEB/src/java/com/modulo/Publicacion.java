package com.modulo;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.LinkedList;

/**
 *
 * @author Juanchope
 */
public class Publicacion {
    
    private int 
            id = -1,
            votos_positivos = 0,
            votos_negativos = 0;
    
    private Long 
            id_usuario = -1L;
    
    private LocalDate
            fecha;
    
    private LocalTime
            hora;
    
    private String
            contenido = "";

    public Publicacion(Usuario usuario) {
        this.id_usuario = usuario.getId();
    } 
    
    public Publicacion(int id, int votos_positivos, int votos_negativos, LocalDate fecha, LocalTime hora, String contenido) {
        this.id = id;
        this.votos_positivos = votos_positivos;
        this.votos_negativos = votos_negativos;
        this.fecha = fecha;
        this.hora = hora;
        this.contenido = contenido;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVotos_positivos() {
        return votos_positivos;
    }

    public void setVotos_positivos(int votos_positivos) {
        this.votos_positivos = votos_positivos;
    }

    public int getVotos_negativos() {
        return votos_negativos;
    }

    public void setVotos_negativos(int votos_negativos) {
        this.votos_negativos = votos_negativos;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public LocalTime getHora() {
        return hora;
    }

    public void setHora(LocalTime hora) {
        this.hora = hora;
    }

    public String getContenido() {
        if (contenido == null)
            contenido = "";
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public Long getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Long id_usuario) {
        this.id_usuario = id_usuario;
    }  
    
    public static LinkedList<Publicacion> seleccionarPublicacionesPorTematica(String tematica){
        LinkedList<Publicacion> res = new LinkedList<>();
        
        String sentencia = "SELECT * from publicacion "
                + "inner join etiqueta on etiqueta.id_publicacion =publicacion.id  "
                + "inner join tematica on tematica.id=etiqueta.id_tematica "
                + "where tematica.nombre  LIKE '%" + tematica + "%'";
        
        LinkedList<HashMap<String, Object>> aux = Conexion.consultarFilas(
                sentencia
        );
        
        if (aux != null)
            for (HashMap<String, Object> aux2 : aux)
                res.add(parsePublicacion(aux2)); 
        
        return res;
    }
    
    public static LinkedList<Publicacion> seleccionarPublicaciones(){
        LinkedList<Publicacion> res = new LinkedList<>();
        
        String sentencia = "SELECT * from publicacion ";
        
        LinkedList<HashMap<String, Object>> aux = Conexion.consultarFilas(
                sentencia
        );
        
        if (aux != null)
            for (HashMap<String, Object> aux2 : aux)
                res.add(parsePublicacion(aux2)); 
        
        return res;
    }
    
    public static Publicacion selecionarPublicacion(Publicacion datos){
        Publicacion res = null;
        
        String sentencia = "Select * from publicacion\n"
                + "\tWHERE id = ?";
        
        LinkedList<HashMap<String, Object>> aux = Conexion.consultarFilas(
                sentencia,
                datos.getId()
        );
        
        if (aux != null)
            if (aux.size() > 0)
                res = parsePublicacion(aux.getLast());                
        
        return res;
    }
    
    public static boolean agregarPublicacion (Publicacion publicacion){
        String sentencia = "INSERT INTO `academicthings`.`publicacion`\n" +
                "(`fecha`,\n" +
                "`hora`,\n" +
                "`contenido`,\n" +
                "`votos_positivos`,\n" +
                "`votos_negativos`,\n" +
                "`id_usuario`)\n" +
                "VALUES\n(?,?,?,?,?,?);";
        return Conexion.ejecutarConsulta(
                sentencia,
                publicacion.getFecha(),
                publicacion.getHora(),
                publicacion.getContenido(),
                publicacion.getVotos_positivos(),
                publicacion.getVotos_negativos(),
                publicacion.getId_usuario()
        );
    }
    
    public String validarPublicacion(){
        String res = null;        
        
        if (Usuario.seleccionarUsuario(new Usuario(id_usuario)) == null){
            res = "Porfavor selecione un usuario valido";
        }else if (getContenido().length() < 10){
            res = "El contenido de la publicación debe tener al menos 10 caracteres";
        }

        return res;
    }
    
    
    private static Publicacion parsePublicacion(HashMap<String, Object> datos) {
        Publicacion res = null;
        
        try {            
            int 
                votos_positivos = (int) Long.parseLong(datos.get("votos_positivos").toString()),
                votos_negativos = (int) Long.parseLong(datos.get("votos_negativos").toString());

            Long 
                id = (Long) datos.get("id"),
                id_usuario =  (long) datos.get("id_usuario");

            String
                contenido = (String) datos.get("contenido"),
                fechaStr = ((Date) datos.get("fecha")).toString(),
                horaStr = ((Time) datos.get("hora")).toString();

            String[] 
                fechaArray = fechaStr.split("-"),
                horaArray = horaStr.split(":");

            LocalDate
                fecha = LocalDate.of(Integer.parseInt(fechaArray[0]), Integer.parseInt(fechaArray[1]), Integer.parseInt(fechaArray[2]));

            LocalTime
                hora =  LocalTime.of(Integer.parseInt(horaArray[0]), Integer.parseInt(horaArray[1]));

            int idf = Integer.parseInt(id.toString());
            res = new Publicacion(idf,votos_positivos, votos_negativos, fecha, hora, contenido);
            
        } catch (Exception e) {
        }
                
        return res;
    }
}
