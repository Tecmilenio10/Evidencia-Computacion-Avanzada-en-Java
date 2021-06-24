<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>  
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </head>
    <body>
        
        <%
            if(request.getAttribute("flag") != null){
                out.print("<h1>La edad no puede ser menor a 15 años");
            }
        %>
        <div class="container mt-4 col-lg-4">
            <div class="card border-info">
                <div class="card-header bg-info">
                    <h4>Agregar nuevo registro</h4>
                </div>
                <div class="card-body">
                    <form method="POST">
                        <label>Nombre</label>
                        <input type="text" name="nombre" class="form-control" />
                        <label>Usuario</label>
                        <input type="text" name="usuario" class="form-control" />
                        <label>Password</label>
                        <input type="text" name="password" class="form-control" />                        
                        <label>Edad</label>
                        <input type="text" name="edad" class="form-control"/>
                        <label>Sexo</label>
                        <!--<input type="text" name="sexo" class="form-control" />-->
                        <select name="sexo" class="form-control">
                            <option value="F"> Femenino</option>
                            <option value="M"> Masculino</option>
                        </select>
                        <input type="submit" value="Agregar" class="btn btn-success"/>
                        <a href="login.htm" class="btn btn-primary">Regresar</a>
                    </form>
                </div>
            </div>
        </div>
        
    </body>
</html>
