<%-- 
    Document   : escribir_manuscrito
    Created on : 7/06/2021, 10:32:11 AM
    Author     : Desarollo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Escribir manuscrito</title>
    </head>
    <body>
        <h1>Bienvenidos a escribir manuscrito</h1>
            <label>Encabezado: </label>
            <input class="form-control" type="text" placeholder="Encabezado" name="txt_encabezado">
            <label>Contenido: </label>
            <input class="form-control" type="text" placeholder="Contenido" name="txt_contenido">
            <label>Archivo: </label>
            <input class="form-control" type="file" placeholder="Archivo" name="txt_archivo">
            <button class="button" type="submit" name="btn_publicar_manuscrito">Publicar</button>
    </body>
</html>
