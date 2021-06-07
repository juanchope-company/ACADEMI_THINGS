<%-- 
    Document   : ver_manuscrito
    Created on : 7/06/2021, 10:33:56 AM
    Author     : Desarollo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver manuscrito</title>
    </head>
    <body>
        <h1>Bienvenido a ver manuscrito</h1>
            <label>Encabezado: </label>
            <input class="form-control" type="text" placeholder="Encabezado" name="txt_encabezado" readonly>
            <label>Contenido: </label>
            <input class="form-control" type="text" placeholder="Contenido" name="txt_contenido" readonly>
            <label>Archivo: </label>
            <input class="form-control" type="file" placeholder="Archivo" name="txt_archivo" readonly>
            
    </body>
</html>
