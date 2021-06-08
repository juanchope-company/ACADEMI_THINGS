<%-- 
    Document   : crear_pqr
    Created on : 6/06/2021, 11:50:19 PM
    Author     : Desarollo
--%>

<%@page import="com.modulo.PQR"%>
<%@page import="com.vista.web.Sesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear PQR</title>
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
    
    try {
        pqr.setAsunto(request.getParameter("txt_asunto"));
        pqr.setCuerpo(request.getParameter("txt_cuerpo"));
        pqr.setTipo(request.getParameter("txt_tipo").charAt(0));
    } catch (Exception e) {
    }
    
    char tipo = pqr.getTipo();
    String asunto = pqr.getAsunto();
    String cuerpo = pqr.getCuerpo();
%>
        <h1>Bienvenidos a crear PQR</h1>
        <p>Aquí podrá crear PQRS</p>
        <form method="get">
            <label>Tipo: </label>
            <input value="<%=tipo %>" class="form-control" type="text" placeholder="Nombre de usuario" name="txt_tipo">
            <label>Asunto: </label>
            <input value="<%=asunto %>" class="form-control" type="text" placeholder="Asunto" name="txt_asunto">
            <label>Cuerpo </label>
            <input value="<%=cuerpo %>" class="form-control" type ="text" placeholder="Cuerpo" name="txt_cuerpo">
            <button class="button" type="submit" name="btn_ingresar_pqrs">Ingresar</button>
        </form>
<%
    session.setAttribute("encuesta", pqr);
    session.setAttribute("sesion", sesion_actual);
%>
    </body>
</html>
