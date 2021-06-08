<%-- 
    Document   : ver_encuesta
    Created on : 6/06/2021, 11:46:14 PM
    Author     : Desarollo
--%>

<%@page import="com.modulo.Pregunta"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.modulo.Encuesta"%>
<%@page import="com.vista.web.EncuestaWeb"%>
<%@page import="com.vista.web.Sesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver encuesta</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <label>Titulo: </label>
        <input name='txt_titulo' type="text" placeholder="Ingrese el titulo de la encuesta"/>
        <label>Descripción: </label>
        <input name='txt_descripción' type="text" placeholder="Ingrese la descripción de la encuesta"/>
        <ul>
<%
    Sesion sesion_actual = null;
    EncuestaWeb encuestaWeb = null;
    
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
    
    Encuesta encuesta = encuestaWeb.getEncuesta();
    LinkedList<Pregunta> preguntas = encuesta.getLas_Preguntas();
    
    for(int i = 0; i < preguntas.size(); i++){
%>
        <li>
            <label>Id: </label>
            <input type="text" value='<%=i+1 %>' disabled/>
            <label>Contenido: </label>
            <input name='txt_contenido' type="text" value='<%=preguntas.get(i).getContenido() %>'/>
            <label>Tipo: ¿Respuesta cerrada?</label>
<%
        if ( preguntas.get(i).getTipo().equals("cerrada")){
            out.print("<input name='txt_cerrada' type='checkbox' value='¿Respuesta cerrada?' checked/>");
            out.print("<input name='txt_respuestas' type='text' placeholder='Ingrese respuesta' value='" + 
                    preguntas.get(i).getBanco_respuestas().get(0) + "'/>");
        }else{
            out.print("<input name='txt_cerrada' type='checkbox'/>");
            out.print("<ul>");
            for (int j = 0; j < preguntas.get(i).getBanco_respuestas().size(); j++) {
                out.print("<li><input name='txt_respuestas" + i + "' type='text' placeholder='Ingrese respuesta" 
                        + (j+1) + "' value='" + preguntas.get(i).getBanco_respuestas().get(j) + "'/>");
                out.print("</li>");
            }
            out.print("</ul>");
        }
        out.print("\t\t</li>");
    }

    encuesta.setLas_Preguntas(preguntas);
    encuestaWeb.setEncuesta(encuesta);
        
    if (request.getParameter("btn_guardar_encuesta") != null){
        encuestaWeb.agregarEncuesta();
        
        String res = encuestaWeb.respuesta();
        out.print("<Script>" + res + "</Script>");

        if (encuestaWeb.validarEncuesta())
            encuestaWeb = null;
    }

    session.setAttribute("encuesta", encuestaWeb);
    session.setAttribute("sesion", sesion_actual);
%>
            </lu>
    </body>
</html>
