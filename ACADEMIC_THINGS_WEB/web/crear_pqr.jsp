<%-- 
    Document   : crear_pqr
    Created on : 6/06/2021, 11:50:19 PM
    Author     : Desarollo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear PQR</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <h1>Bienvenidos a crear PQR</h1>
        <p>Aquí podrá crear PQRS</p>
        <form method="get">
            <label>Tipo: </label>
            <input class="form-control" type="text" placeholder="Nombre de usuario" name="txt_tipo">
            <label>Asunto: </label>
            <input class="form-control" type="text" placeholder="Asunto" name="txt_asunto">
            <label>Cuerpo </label>
            <input class="form-control" type ="text" placeholder="Cuerpo" name="txt_cuerpo">
            <button class="button" type="submit" name="btn_ingresar_pqrs">Ingresar</button>
        </form>
    </body>
</html>
