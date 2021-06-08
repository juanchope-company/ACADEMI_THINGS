<%-- 
    Document   : escribir_manuscrito
    Created on : 7/06/2021, 10:32:11 AM
    Author     : Desarollo
--%>

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
        encuestaWeb = (PQR) session.getAttribute("encuesta");
        if (sesion_actual == null)
            sesion_actual = new Sesion();
        if (encuestaWeb == null)
            encuestaWeb = new PQR(sesion_actual.getUsuario());
    } catch (Exception e) {
        sesion_actual = new Sesion();
        encuestaWeb = new PQR(sesion_actual.getUsuario());
    }
    

    session.setAttribute("encuesta", encuestaWeb);
    session.setAttribute("sesion", sesion_actual);
%>
            <h1>Bienvenidos a escribir manuscrito</h1>
            <label>Encabezado: </label>
            <input value="<%= %>" class="form-control" type="text" placeholder="Encabezado" name="txt_encabezado">
            <label>Contenido: </label>
            <input value="<%= %>" class="form-control" type="text" placeholder="Contenido" name="txt_contenido">
            <label>Archivo: </label>
            <input value="<%= %>" class="form-control" type="file" placeholder="Archivo" name="txt_archivo">
            <button class="button" type="submit" name="btn_publicar_manuscrito">Publicar</button>
        <form>
<%/*
    Sesion sesion_actual = null;
    Manuscrito encuestaWeb = null;
    
    try {
        sesion_actual = (Sesion) session.getAttribute("sesion");
        encuestaWeb = (EncuestaWeb) session.getAttribute("encuesta");
        if (sesion_actual == null)
            sesion_actual = new Sesion();
        if (encuestaWeb == null)
            encuestaWeb = new EncuestaWeb(sesion_actual.getUsuario());
    } catch (Exception e) {
        sesion_actual = new Sesion();
        encuestaWeb = new EncuestaWeb(sesion_actual.getUsuario());
    }
    

    session.setAttribute("encuesta", encuestaWeb);
    session.setAttribute("sesion", sesion_actual);*/
%>
    </body>
</html>
