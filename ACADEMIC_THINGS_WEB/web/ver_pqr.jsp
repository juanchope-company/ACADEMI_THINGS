<%-- 
    Document   : ver_pqr
    Created on : 6/06/2021, 11:52:01 PM
    Author     : Desarollo
--%>

<%@page import="com.modulo.PQR"%>
<%@page import="com.vista.web.Sesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver pqr</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
<%
    Sesion sesion_actual = null;
    PQR pqr = null;
    
    try {
        sesion_actual = (Sesion) session.getAttribute("sesion");
        if (sesion_actual == null)
            sesion_actual = new Sesion();
        pqr = (PQR) session.getAttribute("encuesta");
    } catch (Exception e) {
        sesion_actual = new Sesion();
    }
    
    try {
        if (pqr == null)
            pqr = new PQR(sesion_actual.getUsuario());
    } catch (Exception e) {
        try {
            pqr = new PQR(sesion_actual.getUsuario());
        } catch (Exception ex) {
            response.sendRedirect("ver_publicacion.jsp");
            return;
        }
    }    
    char tipo = pqr.getTipo();
    String asunto = pqr.getAsunto();
    String cuerpo = pqr.getCuerpo();
%>
    <div class="head-encuesta">
        <h1>Bienvenidos a ver PQR</h1>
    </div>
    <div class="formulario">
        <div class="cont-1">
            <div class="cont-1">
                <div class="part-id">
                <label>Tipo: </label>
                <input value="<%=tipo %>" type="text" placeholder="Ingrese ('P' Pregunta, 'Q' Queja , 'R' Reclamo)" disabled/>
                </div>
                <div class="part-div">
                <label>Asunto: </label>
                <input value="<%=asunto %>" type="text" placeholder="Asunto" disabled/>
                </div>
            </div>
        </div>
        <label>Cuerpo </label>
        <textarea class="long-text" value="<%=cuerpo %>" class="form-control" type ="text" placeholder="Cuerpo" disabled="ture"></textarea>
        <button class="button" type="submit" name="btn_ingresar_pqrs">Ingresar</button>
    </div>
<%
    session.setAttribute("encuesta", pqr);
    session.setAttribute("sesion", sesion_actual);
%>
    </body>
</html>

