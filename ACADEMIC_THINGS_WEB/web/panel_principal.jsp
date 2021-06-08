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
        <header>
            <h1>Academic</h1><h2>Things</h2>
            <nav class="nav_panel">
            <label><%=nombre_usu%> Abe Maria ::</label>
            <button type="submit" onclick="window.location.href = 'inicio_sesion.jsp?cerrarSesion=true';">Logout</button>
            </nav>
        </header>
            <div class="panel_principal">
        <div class="lista-opciones">
            <h3>Menú de Navegación</h3>
            <form method="get">
                <ul>
<%
    for (String[] opcion : opciones) {
        out.print("\t\t\t\t<li class='li_op'><a class='link' href='?res=" + opcion[0] + "'>" + opcion[1] + "</a></li>");
    }
%>
                </lu>
            </form>
        </div>
        <div class="contenedor-vualizacion">
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
        </div>
    </body>
</html>
