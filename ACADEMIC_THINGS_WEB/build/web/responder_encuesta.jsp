
<%-- 
    Document   : responder_encuesta
    Created on : 6/06/2021, 11:48:37 PM
    Author     : Desarollo
--%>

<%@page import="com.modulo.Respuesta"%>
<%@page import="com.vista.web.EncuestaWeb"%>
<%@page import="com.modulo.Encuesta"%>
<%@page import="com.modulo.Pregunta"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.vista.web.Sesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Responder encuesta</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="container">
            <h1>Responder encuesta</h1>
        <p>Aquí puedes responder tu encuesta</p>
        <br>
        <div class="formulario">
        <form method="post">
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
        if (request.getParameter("btn_agr_respuesta" + i) != null)
            preguntas.get(i).getBanco_respuestas().add("");         

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
        Respuesta res = new Respuesta();
        if ( tipo.equals("cerrada")){
            try {
                res.setRespuesta_Abierta(request.getParameter("txt_respuesta"));
            } catch (Exception e) {
            }
            
            out.print("<input name='txt_respuesta' type='text' placeholder='Ingrese respuesta' value='" + 
                    preguntas.get(i).getBanco_respuestas().get(0) + "' disabled/>");
        }else{
            out.print("<ul>");
            for (int j = 0; j < preguntas.get(i).getBanco_respuestas().size(); j++) {
                boolean resp = false;
                
                if (request.getParameter("ch_respuesta"+1) != null){
                    resp = true;
                    res.setRespuesta_Cerrada(j);
                    preguntas.get(i).getLas_respuestas().set(j, res);
                }
                
                out.print("<input name='ch_respuesta" + i + "' type='checkbox' value='x' " + (resp ? "checked" : "") + "/>");
                out.print("<li><label>" + preguntas.get(i).getBanco_respuestas().get(j) + "</label>");
                out.print("</li>");
            }
            out.print("</ul>");
        }
        out.print("\t\t\t</li>");
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
            <button class="button" type="submit" name="btn_guardar_encuesta">Guardar encuesta</button>
        </form>
        </div>
        </div>
    </body>
</html>

