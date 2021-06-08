<%-- 
    Document   : escribir_manuscrito
    Created on : 7/06/2021, 10:32:11 AM
    Author     : Desarollo
--%>

<%@page import="com.modulo.Manuscrito"%>
<%@page import="com.vista.web.Sesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Escribir manuscrito</title>
    </head>
    <body>
        <form method="post">
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
    
    try {
        manuscrito.setEncabezado(request.getParameter("txt_encabezado"));
        manuscrito.setContenido(request.getParameter("txt_contenido"));
        manuscrito.setArchivo(request.getParameter("txt_archivo").getBytes());
    } catch (Exception e) {
    }
    
    String encabezado = manuscrito.getEncabezado();
    String contenido = manuscrito.getContenido();
    byte[] archivo = manuscrito.getArchivo();
%>
            <h1>Bienvenidos a escribir manuscrito</h1>
            <label>Encabezado: </label>
            <input value="<%=encabezado %>" class="form-control" type="text" placeholder="Encabezado" name="txt_encabezado">
            <label>Contenido: </label>
            <input value="<%=contenido %>" class="form-control" type="text" placeholder="Contenido" name="txt_contenido">
            <label>Archivo: </label>
            <input value="<%=archivo %>" class="form-control" type="file" placeholder="Archivo" name="txt_archivo">
            <button class="button" type="submit" name="btn_publicar_manuscrito">Publicar</button>
<%
    session.setAttribute("encuesta", manuscrito);
    session.setAttribute("sesion", sesion_actual);
%>
        <form>
    </body>
</html>
