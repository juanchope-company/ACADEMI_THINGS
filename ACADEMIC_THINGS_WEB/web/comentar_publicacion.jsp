<%-- 
    Document   : comentar_publicacion
    Created on : 7/06/2021, 10:36:41 AM
    Author     : Desarollo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comentar publicacion</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="head-encuesta">
            <h1>Bienvenidos a comentar publicacion</h1>
        </div>
        
        <form method="post">
            <div class="publicacion">
            <label>Comentario:</label>
            <input class="form-control" name='txt_nom_completo' type="textarea" row="3" placeholder="Ingrese el nombre completo"/>
            </div>
        </form>
    </body>
</html>
