<%-- 
    Document   : newjspcrear_publicacion
    Created on : 7/06/2021, 12:39:55 PM
    Author     : Desarollo
--%>

<%@page import="com.modulo.Publicacion"%>
<%@page import="com.vista.web.Sesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear publicación</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
<%    
    Sesion sesion_actual = null;
    Publicacion publicacion = null;
    
    try {
        sesion_actual = (Sesion) session.getAttribute("sesion");
        if (sesion_actual == null)
            sesion_actual = new Sesion();
    } catch (Exception e) {
        sesion_actual = new Sesion();
    }
    
    try {
        publicacion = (Publicacion) session.getAttribute("encuesta");
        if (publicacion == null)
            publicacion = new Publicacion(sesion_actual.getUsuario());
    } catch (Exception e) {
        try {
            publicacion = new Publicacion(sesion_actual.getUsuario());
        } catch (Exception ex) {
            response.sendRedirect("ver_publicacion.jsp");
            return;
        }
    }
    
    try {
        publicacion.setContenido(request.getParameter("txt_contenido"));
    } catch (Exception e) {
    }
    
    String contenido = publicacion.getContenido();
%> 
    <div class="head-encuesta">
        <h1>Bienvenidos a publicaciones</h1>
    </div>
        
        <form method="post">
            <div class="publicacion">
            <textarea class="cont_publicacion" value="<%=contenido %>" class="form-control" type="text" placeholder="Contenido" name="txt_contenido" ></textarea>
            <button class="buttonPublicacion" type="submit" name="btn_publicacion">Publicar</button>
            </div>
        </form>
<%    
    String res = null;    

    if (request.getParameter("btn_publicacion") != null){
        publicacion.setContenido(contenido);
        
        if ((res = publicacion.validarPublicacion()) == null){
            if (Publicacion.agregarPublicacion(publicacion)){
                res = "Publicación agregada sactisfactoriamente.";
                response.sendRedirect("panel_principal.jsp?res=v_publicacion");
            }else
                res = "Publicación no agregada";
        }
        out.print("<script>alert('" + res + "');</script>");
    }
    
    session.setAttribute("publicacion", publicacion);
    session.setAttribute("sesion", sesion_actual);
%>
    </body>
</html>
