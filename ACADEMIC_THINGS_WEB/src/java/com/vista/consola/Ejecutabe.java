package com.vista.consola;

import com.modulo.Conexion;
import com.modulo.Usuario;
import java.util.Scanner;

/**
 *
 * @author Desarollo
 */
public class Ejecutabe {
    
    public static void main(String[] args) {
        while (true) {            
            if (probarBD()){

                System.out.println("**MENU**\n"
                        + "1. Iniciar Sesion\n"
                        + "2. Terminar Programa");

                Scanner lector = new Scanner(System.in);
                int eleccion = -1;

                while (eleccion < 1) {
                    System.out.print("selecciona el numero de accion a ejecutar: ");
                    try {
                        eleccion = lector.nextInt();
                    } catch (Exception e) {
                        System.out.println("Ha escrito un valor invalido" + e.getMessage());
                    }
                }

                if(eleccion == 1)
                    IniciarSesion();
                else{
                    System.out.println("Gracias por usar este programa");
                    break;
                }
            }else{
                System.out.println("Ha ocurrido un error al intenar conectar la base de datos");
                break;
            }
        }
    }

    private static boolean probarBD() {
        Conexion con = new Conexion();
        return con.crearConexion() && Conexion.consultarFilas("select * from usuario") != null;
    }

    private static void IniciarSesion() {
        Usuario usuario;
        String nombre_usuario;
        String contrasenna;
        Scanner lector = new Scanner(System.in);
        
        System.out.print("Porfavor ingrese el nombre de usuario: ");
        nombre_usuario = lector.nextLine();
        
        System.out.print("Porfavor ingrese la contraseña: ");
        contrasenna = lector.nextLine();
        
        usuario = Usuario.seleccionarUsuario(new Usuario(nombre_usuario, contrasenna));
        
        if(usuario != null)
            System.out.println("#Sesion iniciada sactisfactoriamente");
        else 
            System.out.println("#Sesion no iniciada");
    }
}
