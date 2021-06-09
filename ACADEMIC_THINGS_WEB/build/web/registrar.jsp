<%-- 
    Document   : regstrar
    Created on : 5/06/2021, 05:31:52 PM
    Author     : Desarollo
--%>

<%@page import="jdk.nashorn.internal.ir.BreakNode"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.modulo.Usuario"%>
<%@page import="com.vista.web.Sesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar usuario</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <header>
            <h1>Academic</h1><h2>Things</h2>
        </header>
        <div class="fondo" style="background-image: url('images/academic.png')">
            <div class="containerBody">
                <div class="RegisterPage">
                    <h3>Registrar usuario</h3>
<%
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
     
    Long numero_id = null;
    String id = "";
    
    try {
        numero_id =  Long.parseLong(request.getParameter("txt_num_id"));
        id = numero_id +"";
    } catch (Exception e) {
    }

    if (nombre_completo == null)
        nombre_completo ="";
    if (nombre_usuario == null)
        nombre_usuario ="";
    if (correo_electronico == null)
        correo_electronico ="";
    if (genero == null)
        genero ="";
    if (profesion == null)
        profesion ="";
    if (nombre_universidad == null)
        nombre_universidad ="";
    if (descripcion_perfil == null)
        descripcion_perfil ="";
    if (fecha_nacimientoStr == null)
        fecha_nacimientoStr ="";
    if (numero_celular == null)
        numero_celular ="";
    if (contrasenna1 == null)
        contrasenna1 ="";
    if (contrasenna2 == null)
        contrasenna2 ="";
    
%>
                    <form method="post">
                        <div class="reg-rows">
                            <div class="form-reg-1">
                                <label>Numero id: </label>
                                <input value="<%=numero_id %>" class="form-control2" name='txt_num_id' type="number" placeholder="Ingrese el numero id"/>
                                <label>Nombre completo: </label>
                                <input value="<%=nombre_completo %>" class="form-control2" name='txt_nom_completo' type="text" placeholder="Ingrese el nombre completo"/>
                                <label>Nombre de usuario: </label>
                                <input value="<%=nombre_usuario %>" class="form-control2" name='txt_usuario' type="text" placeholder="Ingrese el nombre de usuario"/>
                                <label>Correo electronico: </label>
                                <input value="<%=correo_electronico %>" class="form-control2" name='txt_correo' type="text" placeholder="Ingrese el correo electronico"/>
                                <label>Genero: </label>
                                <input value="<%=genero %>" class="form-control2" name='txt_genero' type="text" placeholder="Ingrese el genero"/>
                            </div>
                            <div class="form-reg-1">
                                <label>Profeción: </label>
                                <input value="<%=profesion %>" class="form-control2" name='txt_profesion' type="text" placeholder="Ingrese su profesión"/>
                                <label>Nombre de universidad: </label>
                                <input value="<%=nombre_universidad %>" class="form-control2" name='txt_universidad' type="text" placeholder="Ingrese el nombre de su universidad"/>
                                <label>Descripción de perfil: </label>
                                <input value="<%=descripcion_perfil %>" class="form-control2" name='txt_perfil' type="text" placeholder="Ingrese la descripción del perfil"/>
                                <label>Fecha de nacimiento: </label>
                                <input value="<%=fecha_nacimientoStr %>" class="form-control2" name='txt_fecha_nacimiento' type="date" placeholder="Ingrese la fecha de nacimiento"/>
                            </div>
                            <div class="form-reg-1">
                                <label>Numero celular: </label>
                                <input value="<%=numero_celular %>" class="form-control2" name='txt_num_celular' type="tel" placeholder="Ingrese el número de celular"/>
                                <label>Foto de perfil: </label>
                                <input class="form-control2" name='txt_foto_perfil' type="text" placeholder="Ingrese la foto de perfil"/>
                                <label>Contraseña: </label>
                                <input value="<%=contrasenna1 %>" class="form-control2" name='txt_contrasenna1' type="password" placeholder="Ingrese la contraseña deseada"/>
                                <label>Confirmación de contraseña: </label>
                                <input value="<%=contrasenna2 %>" class="form-control2" name='txt_contrasenna2' type="password" placeholder="Ingrese la contraseña nuevamente"/>
                            </div>
                        </div>
                        <button class="button" name="btn_registrar" type='submit'>Guardar registro</button>
                        <button class="reg" name="btn_atras" type="submit">Atras</button>
                    </form>
                </div>
            </div>
        </div>
        
<%
    Sesion sesion_actual = null;
    
    try {
        sesion_actual = (Sesion) session.getAttribute("sesion");
        if (sesion_actual == null)
            sesion_actual = new Sesion();
    } catch (Exception e) {
        sesion_actual = new Sesion();
    }
    
    if (request.getParameter("btn_atras")!= null){
        session.setAttribute("sesion", null);
        response.sendRedirect("inicio_sesion.jsp");
    }
    if (request.getParameter("btn_registrar")!= null && !contrasenna1.equals(contrasenna2))
        out.print("<script>alert('Contraseña no coincide');</script>");
    else if (request.getParameter("btn_registrar")!= null){
        //        byte[] foto_perfil = request.getParameter("txt_foto_perfil");
    
        LocalDate fecha = null;
        
        try {
            String[] aux1 = fecha_nacimientoStr.split("-");
            fecha = LocalDate.of(Integer.valueOf(aux1[0]), Integer.valueOf(aux1[1]), Integer.valueOf(aux1[2]));
        } catch (Exception e) {
        }
        
        if (contrasenna1.equals(contrasenna2)){
            
            Usuario usu = new Usuario(
                    numero_id,
                    nombre_completo, 
                    nombre_usuario, 
                    correo_electronico, 
                    genero, 
                    profesion, 
                    nombre_universidad, 
                    descripcion_perfil, 
                    numero_celular, 
                    contrasenna1, 
                    fecha, 
                    new byte[0]
            );
            
            sesion_actual = new Sesion(usu);
            sesion_actual.crearUsuario();
            
            String res = sesion_actual.respuesta();
            out.print("<script>alert('" + res + "');</script>");
        }
    }
    
    session.setAttribute("sesion", sesion_actual);
%>   
        <footer>
            <p>Proyecto base de datos, creado por: </p>
        </footer>

    </body>
</html>

