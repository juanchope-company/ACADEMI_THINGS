
<%-- 
    Document   : ver_manuscrito
    Created on : 7/06/2021, 10:33:56 AM
    Author     : Desarollo
--%>

<%@page import="com.modulo.Manuscrito"%>
<%@page import="com.vista.web.Sesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver manuscrito</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="head-encuesta">
            <h1>Bienvenido a ver manuscrito</h1>
        </div>
        <div class="formulario">
<%
    Sesion sesion_actual = null;
    Manuscrito manuscrito = null;
    
    try {
        sesion_actual = (Sesion) session.getAttribute("sesion");
        if (sesion_actual == null)
            sesion_actual = new Sesion();
    } catch (Exception e) {
        sesion_actual = new Sesion();
    }
    
    try {
        manuscrito = (Manuscrito) session.getAttribute("encuesta");
        if (manuscrito == null)
            manuscrito = new Manuscrito(sesion_actual.getUsuario());
    } catch (Exception e) {
        try {
            manuscrito = new Manuscrito(sesion_actual.getUsuario());
        } catch (Exception ex) {
            response.sendRedirect("ver_publicacion.jsp");
            return;
        }
    }
    
    String encabezado = manuscrito.getEncabezado();
    String contenido = manuscrito.getContenido();
    byte[] archivo = manuscrito.getArchivo();
%>
        <label>Encabezado: </label>
        <input value="<%=encabezado %>" class="form-control" type="text" placeholder="Encabezado" disabled>
        <label>Contenido: </label>
        <textarea class="long-text" value="<%=contenido %>" class="form-control" type="text" placeholder="Contenido" disabled="true"></textarea>
        <label>Archivo: </label>
        <input value="<%=archivo %>" class="form-control" type="file" placeholder="Archivo" disabled>
        <button class="button" type="submit" name="btn_publicar_manuscrito">Publicar</button>
        </div>
<%
    session.setAttribute("encuesta", manuscrito);
    session.setAttribute("sesion", sesion_actual);
%>
    </body>
</html>

