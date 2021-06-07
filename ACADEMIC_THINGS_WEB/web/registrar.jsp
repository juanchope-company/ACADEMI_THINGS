<%-- 
    Document   : regstrar
    Created on : 5/06/2021, 05:31:52 PM
    Author     : Desarollo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar usuario</title>
    </head>
    <body>
        <h1>Bienvenido a registrar usuario</h1>
        <form method="post">
            <label>Nombre completo: </label>
            <input name='txt_nom_completo' type="text" placeholder="Ingrese el nombre completo"/>
            <label>Nombre de usuario: </label>
            <input name='txt_usuario' type="text" placeholder="Ingrese el nombre de usuario"/>
            <label>Correo electronico: </label>
            <input name='txt_correo' type="text" placeholder="Ingrese el correo electronico"/>
            <label>Genero: </label><p>se aceptan sugerencias para capturar el genero de una mejor manera</p>
            <input name='txt_genero' type="text" placeholder="Ingrese el genero"/>
            <label>profeción: </label>
            <input name='txt_profesion' type="text" placeholder="Ingrese su profesión"/>
            <label>Nombre de universidad: </label>
            <input name='txt_universidad' type="text" placeholder="Ingrese el nombre de su universidad"/>
            <label>Descripción de perfil: </label>
            <input name='txt_perfil' type="text" placeholder="Ingrese la descripción del perfil"/>
            <label>Fecha de nacimiento: </label>
            <input name='txt_fecha_nacimiento' type="date" placeholder="Ingrese la fecha de nacimiento"/>
            <label>Numero celular: </label>
            <input name='txt_num_celular' type="tel" placeholder="Ingrese el número de celular"/>
            <label>Foto de perfil: </label><p>luego lo pongo</p>
            <input name='txt_foto_perfil' type="text" placeholder="Ingrese la foto de perfil"/>
            <label>Contraseña: </label>
            <input name='txt_contrasenna1' type="password" placeholder="Ingrese la contraseña deseada"/>
            <label>Confirmación de contraseña: </label>
            <input name='txt_contrasenna2' type="password" placeholder="Ingrese la confirmación de la contraseña deseada"/>
            <button type='submit'>Guardar registro</button>
        </form>
    </body>
</html>
