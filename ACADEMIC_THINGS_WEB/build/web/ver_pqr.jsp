<%-- 
    Document   : ver_pqr
    Created on : 6/06/2021, 11:52:01 PM
    Author     : Desarollo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver pqr</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <h1>Bienvenido a ver PQR</h1>
            <label>Tipo: </label>
            <input class="form-control" type="text" placeholder="Nombre de usuario" name="txt_tipo" readonly>
            <label>Asunto: </label>
            <input class="form-control" type="text" placeholder="Asunto" name="txt_asunto" readonly>
            <label>Cuerpo </label>
            <input class="form-control" type ="text" placeholder="Cuerpo" name="txt_cuerpo" readonly>
        <p>Aquí podrás ver tus pqrs y de las personas que las hayan echo</p>
    </body>
</html>