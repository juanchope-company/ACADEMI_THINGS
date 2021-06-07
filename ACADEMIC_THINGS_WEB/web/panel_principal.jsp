<%-- 
    Document   : panel_principal
    Created on : 5/06/2021, 05:27:59 PM
    Author     : Desarollo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel principal</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
<%
    String nombre_usu = "";
    String[][] opciones = {
        {"c_encuesta","Crear encuesta"},
        {"v_encuesta","Ver encuestas"},
        {"r_encuesta","Responder encuesta"},
        {"c_pqr","Crear PQR"},
        {"v_pqr","Ver PQRS"},
        {"","Escribir manuscrito"},
        {"","Ver Manuscrito"},
        {"","crear Publicación"},
        {"","Ver Publicación"},
        {"","comentar Publicación"},
    };
%>
    <body>
        <nav>
            <label><%=nombre_usu%></label>
            <button type="submit" onclick="window.location.href = 'inicio_sesion.jsp?cerrarSesion=true';">CerrarSesion</button>
        </nav>
        <div class="lista-opciones">
            <p>Lista de opciones puede ser en una etiqueta diferente de p<p>
            <form method="get">
                <ul>
<%
    for (String[] opcion : opciones) {
        out.print("\t\t\t\t<li><a href='?res=" + opcion[0] + "'>" + opcion[1] + "</a></li>");
    }
%>
                </lu>
            </form>
        </div>
        <div class="contenedor-vualizacion">
            <p>Aquí se debe poner donde van las vistas de las opciones</p>
            <p>por defecto se mostrarán las publicaciones</p>
            <p>preferiblemente se debe poner un iframe aqui si es conveniente</p>
            <p>y cambiar su contenido dependiendo de la opción usada</p>
<%
    String aux = request.getParameter("res"), 
            ruta = "";
    
    if (aux != null){
        switch (aux){
            case "c_encuesta":
                ruta = "crear_encuesta.jsp";
                break;
            case "v_encuesta":
                ruta = "ver_encuesta.jsp";
                break;
            case "r_encuesta":
                ruta = "responder_encuesta.jsp";
                break;
            case "c_pqr":
                ruta = "crear_pqr.jsp";
                break;
            case "v_pqr":
                ruta = "ver_pqr.jsp";
                break;
            default:
                ruta = "";
        }
    }
    
    out.print("<iframe src=\"" + ruta + "\"></ifram>");
    
%>
        </div>
    </body>
</html>
