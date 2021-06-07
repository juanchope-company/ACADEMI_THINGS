package com.modulo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.LinkedList;

/**
 *
 * @author Juan David
 * @author Ivan Duque
 * 
 */
public class Conexion {
    
    private final String 
            usuario = "root", 
            contrasenna = "2711",
            nombreBD = "AcademicThings";
    
    private Connection con;
    private Statement st;
    
    public Connection getConexion(){
        return con;
    }
    
    public boolean crearConexion(){
        boolean res = false;
        
        //Creacion de conexión
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/" + nombreBD;
            con = DriverManager.getConnection(url, usuario, contrasenna);
            st = con.createStatement();
            res = true;
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Error, " + ex.getMessage());
        }
        
        return res;
    }
    
    public void terminarConexion(){
        try {
            con.close();
            //fis.close();
        } catch (Exception e) {
        }
    }
    
    public static boolean ejecutarConsulta(String sql, Object... parametros){
        boolean res = false;
        PreparedStatement ps = null;
        Conexion conexion = new Conexion();
        try {
            if (conexion.crearConexion()) {
//                conexion.getConexion().setAutoCommit(false);
                
                if (parametros == null)
                    parametros = new Object[0];
                
                ps = conexion.getConexion().prepareStatement(sql);
                for (int i = 0; i < parametros.length; i++){
                    if (parametros[i] instanceof  String)
                        ps.setString(i+1, (String) parametros[i]);
                    else if (parametros[i] instanceof  Integer)
                        ps.setInt(i+1, (Integer) parametros[i]);/*
                    else if (parametros[i] instanceof  String)
                        ps.setString(i+1, (String) parametros[i]);/**/
                    else
                        ps.setObject(i+1, parametros[i]);
                }
                
                int filasAfectadas = ps.executeUpdate();
//                conexion.getConexion().getAutoCommit();
                res = filasAfectadas > 0;
            }
        } catch (SQLException ex) {
            System.out.println("Error " + ex.toString());
            conexion.terminarConexion();
            
            try {
                ps.close();
            } catch (SQLException e) {
                
            }
        }finally{
            conexion.terminarConexion();
            try {
                ps.close();
            } catch (SQLException e) {
                
            }
        }

        return res;
    }
    
    public static LinkedList<HashMap<String, Object>> consultarFilas(String sentencia_SQL, Object... parametros) {
        LinkedList<HashMap<String, Object>> res = null;        
        ResultSet rs;
        Conexion con = new Conexion ();
        
        try {
            if (con.crearConexion()){
                        
                if (parametros == null)
                    parametros = new Object[0];
                
                PreparedStatement ps = con.getConexion().prepareStatement(sentencia_SQL);
                
                for (int i = 0; i < parametros.length; i++){
                    if (parametros[i] instanceof  String)
                        ps.setString(i+1, (String) parametros[i]);
                    else if (parametros[i] instanceof  Integer)
                        ps.setInt(i+1, (Integer) parametros[i]);/*
                    else if (parametros[i] instanceof  String)
                        ps.setString(i+1, (String) parametros[i]);/**/
                    else
                        ps.setObject(i+1, parametros[i]);
                }
                
                rs = ps.executeQuery();
                res = new LinkedList<>();
                
                while (rs.next()){
                    HashMap<String, Object> fila = new HashMap<>();
                    int num_filas = rs.getMetaData().getColumnCount();
                    
                    for (int i = 0; i < num_filas; i++)
                        fila.put(rs.getMetaData().getColumnName(i+1), rs.getObject(i+1));
                    
                    res.add(fila);                    
                }
                
            }
        }catch (SQLException | NullPointerException ex) {
            System.out.println(ex.getMessage());
        }
        
        return res;
    }
}
