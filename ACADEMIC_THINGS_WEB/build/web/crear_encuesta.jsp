<%-- 
    Document   : crear_encuesta
    Created on : 6/06/2021, 03:23:20 PM
    Author     : Desarollo
--%>

<%@page import="com.modulo.Encuesta"%>
<%@page import="com.vista.web.EncuestaWeb"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.modulo.Respuesta"%>
<%@page import="com.modulo.Pregunta"%>
<%@page import="com.vista.web.Sesion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear encuesta</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="container">
        <h1>Crear encuesta</h1>
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
    try {
        encuesta.setTitulo(request.getParameter("txt_titulo"));
        encuesta.setDescripcion(request.getParameter("txt_descripcion"));
    } catch (Exception e) {
    }
    
    String titulo = encuesta.getTitulo();
    String descrpcion  = encuesta.getDescripcion();
    
%>
<<<<<<< HEAD
            <label>Titulo: </label>
            <input value="<%=titulo %>" name='txt_titulo' type="text" placeholder="Ingrese el titulo de la encuesta"/>
            <label>Descripción: </label>
            <input value="<%=descrpcion %>" name='txt_descripcion' type="text" placeholder="Ingrese la descripción de la encuesta"/>
=======
            <div class="head-encuesta">
                        <label>Titulo: </label>
                        <input value="<%=titulo %>" name='txt_titulo' type="text" placeholder="Ingrese el titulo de la encuesta"/>
                        <label>Descripción: </label>
                        <textarea class="long-text" value="<%=descrpcion %>" name='txt_descripción' type="text" placeholder="Ingrese la descripción de la encuesta"></textarea>
            </div>
>>>>>>> Diseño
            <ul>
<%
    if (request.getParameter("btn_agr_encuesta") != null)
        preguntas.add(new Pregunta());   
    
    for(int i = 0; i < preguntas.size(); i++){
        if (request.getParameter("btn_agr_respuesta" + i) != null)
            preguntas.get(i).getBanco_respuestas().add("");         
        
        try {
            preguntas.get(i).setContenido(request.getParameter("txt_contenido"+i));
            preguntas.get(i).setTipo(request.getParameter("ch_cerrada"+i) != null ? "cerrada" : "abierta");
        } catch (Exception e) {
        }
        
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
                    <input value="<%=contenido %>" name='txt_contenido' type="text" value='<%=preguntas.get(i).getContenido() %>'/>
                    </div>
                </div>
                <label>Tipo: ¿Respuesta cerrada?</label>
<%
        if ( tipo.equals("cerrada")){
            out.print("<input name='ch_cerrada" + i + "' type='checkbox' value='cerrada' checked/>");
            out.print("<input name='txt_respuestas' type='text' placeholder='Ingrese respuesta' value='" + 
                    preguntas.get(i).getBanco_respuestas().get(0) + "'/>");
        }else{
            out.print("<input name='ch_cerrada" + i + "' type='checkbox' value='abierta'/>");
            out.print("<ul>");
            for (int j = 0; j < preguntas.get(i).getBanco_respuestas().size(); j++) {
                out.print("<li><input name='txt_respuestas" + i + "' type='text' placeholder='Ingrese respuesta" 
                        + (j+1) + "' value='" + preguntas.get(i).getBanco_respuestas().get(j) + "'/>");
                out.print("</li>");
            }
            out.print("</ul><button class='button' type='submit' name='btn_agr_respuesta" + i + "'>Agregar nueva respuesta</button>");
        }
        out.print("\t\t\t</li>");
    }

    
    out.print("<button class='button' type='submit' name='btn_agr_encuesta'>Agregar nueva pregunta</button>");
    
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
            <button class="buttonPrincipal" type="submit" name="btn_guardar_encuesta">Guardar encuesta</button>
        </form>
        </div>
        </div>
    </body>
</html>
