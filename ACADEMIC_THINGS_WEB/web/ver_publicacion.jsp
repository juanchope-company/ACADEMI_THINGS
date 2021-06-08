<%-- 
    Document   : ver_publicacion
    Created on : 7/06/2021, 12:42:38 PM
    Author     : Desarollo
--%>

<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.modulo.Publicacion"%>
<%@page import="com.vista.web.Sesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver publicación</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body
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
    
    int id = publicacion.getId();
    LocalDate fecha = null;
    String fechaStr= "";
    try {
        fecha = publicacion.getFecha();
        fechaStr = fecha.getYear() +"-"+fecha.getMonthValue()+"-"+fecha.getDayOfMonth();
    } catch (Exception e) {
    }
    String horaStr = "";
    LocalTime hora = null;
    try {
        hora = publicacion.getHora();
        horaStr = hora.getHour() + ":" + hora.getMinute();
    } catch (Exception e) {
    }
    String contenido = publicacion.getContenido();
    int votos_p = publicacion.getVotos_positivos();
    int votos_n = publicacion.getVotos_negativos();    

    session.setAttribute("encuesta", publicacion);
    session.setAttribute("sesion", sesion_actual);
%>
<div class="formulario">
        <form method="post">
            <div class="head-encuesta">
            <h1>Aquí puedes ver tus publicaciones</h1>
            </div>
            <label>Id: </label>
            <input class="form-control" type="text" value="<%=id %>" placeholder="Id" name="txt_id" readonly>
            <label>Fecha: </label>
            <input class="form-control" type="date" value="<%=fechaStr %>" placeholder="Fecha" name="txt_fecha" readonly>
            <label>Hora: </label>
            <input class="form-control" type="time" value="<%=horaStr %>" placeholder="Hora" name="txt_hora" readonly>
            <label>Contenido: </label>
            <textarea class="long-text" type="text" value="<%=contenido %>" placeholder="Contenido" name="txt_contenido" readonly ></textarea>
            <label>Votos positivos: </label>
            <input class="form-control" type="text" value="<%=votos_p %>" placeholder="Votos positivos" name="txt_votos_p" readonly>
            <label>Votos negativos </label>
            <input class="form-control" type="text" value="<%=votos_n %>" placeholder="Votos negativos" name="txt_votos_n" readonly>
        </form>
</div>
    </body>
</html>
