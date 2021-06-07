<%-- 
    Document   : loguin
    Created on : 5/06/2021, 05:13:17 PM
    Author     : Desarollo
--%>

<%@page import="com.vista.web.Sesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de sesion</title>
    </head>
    <body>
        <h1>Bienvenidos al inicio de sesión</h1>
        <form method="get">
            <label>Nombre de usuario: </label>
            <input type="text" placeholder="nombre de usuario" name="txt_usu">
            <label>Contraseña de usuario: </label>
            <input type="password" placeholder="contraseña de usuario" name="txt_contra">
            <button type="submit" name="btn_iniciar_sesion">Iniciar sesión</button>
            <button type="submit" name="btn_registrar">Registrarse</button>
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
    
    if (request.getParameter("cerrarSesion") == "true"){
        sesion_actual.cerraSesion();
    }else if (request.getParameter("btn_iniciar_sesion") != null ){
        String usuario = request.getParameter("txt_usu"), clave = request.getParameter("txt_contra");
        
        sesion_actual = new Sesion(usuario, clave);
        sesion_actual.iniciarSesion();
        
        String res = sesion_actual.respuesta();        
        out.print("<script>alert('" + res + "');</script>");
        
        if (sesion_actual.esSesionValida())
            response.sendRedirect("panel_principal.jsp");
        
    }else if (request.getParameter("btn_registrar") != null)
        response.sendRedirect("registrar.jsp");
    
    session.setAttribute("sesion", sesion_actual);
%>
    </body>
</html>
