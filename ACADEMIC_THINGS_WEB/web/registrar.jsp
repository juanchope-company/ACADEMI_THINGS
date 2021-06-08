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
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <header>
            <h1>Academic</h1><h2>Things</h2>
        </header>
         <div class="fondo" style="background-image: url('images/academic.png')">
                <div class="containerBody">
                    <div class="RegisterPage">
        <h3>Registrar usuario</h3>
        <form method="post">
            <div class="reg-rows">
            <div class="form-reg-1">
            <label>Nombre completo: </label>
            <input class="form-control2" name='txt_nom_completo' type="text" placeholder="Ingrese el nombre completo"/>
            <label>Nombre de usuario: </label>
            <input class="form-control2" name='txt_usuario' type="text" placeholder="Ingrese el nombre de usuario"/>
            <label>Correo electronico: </label>
            <input class="form-control2" name='txt_correo' type="text" placeholder="Ingrese el correo electronico"/>
            <label>Genero: </label>
            <input class="form-control2" name='txt_genero' type="text" placeholder="Ingrese el genero"/>
            </div>
            <div class="form-reg-1">
            <label>Profeción: </label>
            <input class="form-control2" name='txt_profesion' type="text" placeholder="Ingrese su profesión"/>
            <label>Nombre de universidad: </label>
            <input class="form-control2" name='txt_universidad' type="text" placeholder="Ingrese el nombre de su universidad"/>
            <label>Descripción de perfil: </label>
            <input class="form-control2" name='txt_perfil' type="text" placeholder="Ingrese la descripción del perfil"/>
            <label>Fecha de nacimiento: </label>
            <input class="form-control2" name='txt_fecha_nacimiento' type="date" placeholder="Ingrese la fecha de nacimiento"/>
            </div>
            <div class="form-reg-1">
            <label>Numero celular: </label>
            <input class="form-control2" name='txt_num_celular' type="tel" placeholder="Ingrese el número de celular"/>
            <label>Foto de perfil: </label>
            <input class="form-control2" name='txt_foto_perfil' type="text" placeholder="Ingrese la foto de perfil"/>
            <label>Contraseña: </label>
            <input class="form-control2" name='txt_contrasenna1' type="password" placeholder="Ingrese la contraseña deseada"/>
            <label>Confirmación de contraseña: </label>
            <input class="form-control2" name='txt_contrasenna2' type="password" placeholder="Ingrese la contraseña nuevamente"/>
            </div>
            </div>
            <button class="button" type='submit'>Guardar registro</button>
        </form>
                    </div>
                </div>
         </div>
        <footer>
        <p>Proyecto base de datos, creado por: </p>
        </footer>
    </body>
</html>
