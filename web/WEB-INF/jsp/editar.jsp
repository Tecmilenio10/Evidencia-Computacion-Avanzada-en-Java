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
        
        <div class="container mt-4 col-lg-4">
            <div class="card border-info">
                <div class="card-header bg-info">
                    <h4>Actualizar registro</h4>
                </div>
                <div class="card-body">
                    <form method="POST">
                        <label>Nombre</label>
                        <input type="text" name="nombre" value="${lista[0].Nombre}" class="form-control" />
                        <label>Usuario</label>
                        <input type="text" name="usuario" value="${lista[0].Usuario}" class="form-control" />
                        <label>Password</label>
                        <input type="text" name="password" value="${lista[0].Password}" class="form-control" />
                        <label>Edad</label>
                        <input type="text" name="edad" value="${lista[0].Edad}" class="form-control" required pattern="^\$?[1-9]{2})"/>
                        <label>Sexo</label>
                        <!--<input type="text" name="sexo" class="form-control" />-->
                        <select name="sexo" class="form-control" value="${lista[0].Sexo}" >
                            <option value="F"> Femenino</option>
                            <option value="M"> Masculino</option>
                        </select>
                        
                        <input type="submit" value="Actualizar" class="btn btn-success"/>
                        <!--<a href="index.htm" class="btn btn-primary">Regresar</a>-->
                    </form>
                </div>
            </div>
        </div>
        
    </body>
</html>
