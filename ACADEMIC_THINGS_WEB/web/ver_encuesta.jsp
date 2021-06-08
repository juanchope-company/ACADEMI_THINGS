
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
        <div class="formulario">
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
    
    String titulo = encuesta.getTitulo();
    String descrpcion  = encuesta.getDescripcion();
    
%>
            <div class="head-encuesta">
                <label>Titulo: </label>
                <input value="<%=titulo %>" name='txt_titulo' type="text" placeholder="Ingrese el titulo de la encuesta" disabled/>
                <label>Descripción: </label>
                <input value="<%=descrpcion %>" name='txt_descripción' type="text" placeholder="Ingrese la descripción de la encuesta" disabled/>
            </div>
            <ul>
<%
    if (request.getParameter("btn_agr_encuesta") != null)
        preguntas.add(new Pregunta());   
    
    for(int i = 0; i < preguntas.size(); i++){        
        if (preguntas.get(i).getTipo().equals("cerrada")){
            String res1 = preguntas.get(i).getBanco_respuestas().get(0);
            preguntas.get(i).setBanco_respuestas(new LinkedList<>());
            preguntas.get(i).getBanco_respuestas().add(res1);                
        }             
        
        String contenido = preguntas.get(i).getContenido();
        String tipo = preguntas.get(i).getTipo();
%>
            <li>
                 <div class="cont-1">
                    <div class="part-id">
                        <label>Id: </label>
                        <input type="text" value='<%=i+1 %>' disabled/>
                    </div>
                    <div class="part-div">
                        <label>Contenido: </label>
                        <input value="<%=contenido %>" name='txt_contenido' type="text" value='<%=preguntas.get(i).getContenido() %>' disabled/>
                    </div>
                 </div>
                <label>Tipo: ¿Respuesta cerrada?</label>
<%
        if ( tipo.equals("cerrada")){
            out.print("<input name='ch_cerrada" + i + "' type='checkbox' value='cerrada' checked/>");
            out.print("<input name='txt_respuestas' type='text' placeholder='Ingrese respuesta' value='" + 
                    preguntas.get(i).getBanco_respuestas().get(0) + "' disabled/>");
        }else{
            out.print("<input name='ch_cerrada" + i + "' type='checkbox' value='abierta'/>");
            out.print("<ul>");
            for (int j = 0; j < preguntas.get(i).getBanco_respuestas().size(); j++) {
                out.print("<li><input name='txt_respuestas" + i + "' type='text' placeholder='Ingrese respuesta" 
                        + (j+1) + "' value='" + preguntas.get(i).getBanco_respuestas().get(j) + "' disabled/>");
                out.print("</li>");
            }
            out.print("</ul>");
        }
        out.print("\t\t\t</li>");
    }
    encuesta.setLas_Preguntas(preguntas);
    encuestaWeb.setEncuesta(encuesta);

    session.setAttribute("sesion", sesion_actual);
%>
            </lu>
            </div>
    </body>
</html>

