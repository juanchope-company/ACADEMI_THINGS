<%-- 
    Document   : regstrar
    Created on : 5/06/2021, 05:31:52 PM
    Author     : Desarollo
--%>

<%@page import="com.modulo.Usuario"%>
<%@page import="com.vista.web.Sesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar usuario</title>
    </head>
    <body>
        <h1>Bienvenido a registrar usuario</h1>
        <form method="post">
            <label>Nombre completo: </label>
            <input name='txt_nom_completo' type="text" placeholder="Ingrese el nombre completo"/>
            <label>Nombre de usuario: </label>
            <input name='txt_usuario' type="text" placeholder="Ingrese el nombre de usuario"/>
            <label>Correo electronico: </label>
            <input name='txt_correo' type="text" placeholder="Ingrese el correo electronico"/>
            <label>Genero: </label><p>se aceptan sugerencias para capturar el genero de una mejor manera</p>
            <input name='txt_genero' type="text" placeholder="Ingrese el genero"/>
            <label>profeción: </label>
            <input name='txt_profesion' type="text" placeholder="Ingrese su profesión"/>
            <label>Nombre de universidad: </label>
            <input name='txt_universidad' type="text" placeholder="Ingrese el nombre de su universidad"/>
            <label>Descripción de perfil: </label>
            <input name='txt_perfil' type="text" placeholder="Ingrese la descripción del perfil"/>
            <label>Fecha de nacimiento: </label>
            <input name='txt_fecha_nacimiento' type="date" placeholder="Ingrese la fecha de nacimiento"/>
            <label>Numero celular: </label>
            <input name='txt_num_celular' type="tel" placeholder="Ingrese el número de celular"/>
            <label>Foto de perfil: </label><p>luego lo pongo</p>
            <input name='txt_foto_perfil' type="text" placeholder="Ingrese la foto de perfil"/>
            <label>Contraseña: </label>
            <input name='txt_contrasenna1' type="password" placeholder="Ingrese la contraseña deseada"/>
            <label>Confirmación de contraseña: </label>
            <input name='txt_contrasenna2' type="password" placeholder="Ingrese la confirmación de la contraseña deseada"/>
            <button name="btn_registrar" type='submit'>Guardar registro</button>
        </form>
<%
    Sesion sesion_actual = null;
    
    try {
        sesion_actual = (Sesion) session.getAttribute("sesion");
        if (sesion_actual == null)
            sesion_actual = new Sesion();
    } catch (Exception e) {
        sesion_actual = new Sesion();
    }
    
    if (request.getParameter("btn_registrar")!= null){
        String 
                nombre_completo = request.getParameter("txt_nom_completo"),
                nombre_usuario = request.getParameter("txt_usuario"),
                correo_electronico = request.getParameter("txt_correo"),
                genero = request.getParameter("txt_genero"),
                profesion = request.getParameter("txt_profesion"),
                nombre_universidad = request.getParameter("txt_universidad"),
                descripcion_perfil = request.getParameter("txt_perfil"),
                fecha_nacimientoStr = request.getParameter("txt_fecha_nacimiento"),
                contrasenna1 = request.getParameter("txt_contrasenna1"),
                contrasenna2 = request.getParameter("txt_contrasenna2"),
                numero_celular = request.getParameter("txt_num_celular");
        
//        byte[] foto_perfil = request.getParameter("txt_foto_perfil");

        out.print(fecha_nacimientoStr);
        if (contrasenna1.equals(contrasenna2)){
            
            Usuario usu = new Usuario(
                    nombre_completo, 
                    nombre_usuario, 
                    correo_electronico, 
                    genero, 
                    profesion, 
                    nombre_universidad, 
                    descripcion_perfil, 
                    numero_celular, 
                    contrasenna1, 
                    null, 
                    null
            );
            
            sesion_actual = new Sesion(usu);
            
            sesion_actual.crearUsuario();
            
            String res = sesion_actual.respuesta();
            out.print("<script>alert('" + res + "');</script>");
            
            if (sesion_actual.esSesionValida())
                response.sendRedirect("inicio_sesion.jsp");
        }
    }
    
    session.setAttribute("sesion", sesion_actual);
%>
    </body>
</html>
