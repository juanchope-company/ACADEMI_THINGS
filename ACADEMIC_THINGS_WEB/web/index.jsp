<%-- 
    Document   : index
    Created on : 06-abr-2021, 21:54:23
    Author     : Juanchope
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Iniciar sesion</h1>
        <form method="post">
            <div>
                <label>Usuario: </label>
                <input type="text" name="txt_usuario" placeholder="ingrese el nombre de usuario"/>
            </div>
            <div>
                <label>contraseña: </label>
                <input type="password" name="txt_clave" placeholder="Ingrese contraseña"/>
            </div>
            <div>
                <button type="submit" name="btn_iniciar_sesion">Iniciar sesion</button>
            </div>            
        </form>
<%
        // a manera de demostración
        try {
            if (request.getParameter("btn_iniciar_sesion") != null){
                String usuario = request.getParameter("txt_usuario"),
                        clave = request.getParameter("txt_clave");
                
                if (usuario.length() < 5 || clave.length() < 4)
                    out.print("<p>error usuario invalido</p>");
                else{
                    out.print("<p>usuario: " +  usuario + "</p>");
                    out.print("<p>contraseña " + clave + "</p>");
                }                    
            }                
        } catch (Exception e) {
            out.print(e.getMessage());
        }
%>
    </body>
</html>
