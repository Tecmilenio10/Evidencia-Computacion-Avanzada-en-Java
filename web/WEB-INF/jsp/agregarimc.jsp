
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
                out.print("<h1>La estatura no puede ser superior a 2.5m o menor a 1m");
            }
            if(request.getAttribute("flag1") != null){
                out.print("<h1>El peso debe ser mayo a 0");
            }
        %>
        <div class="container mt-4 col-lg-4">
            <div class="card border-info">
                <div class="card-header bg-info">
                    <h4>Agregar nuevo IMC</h4>
                </div>
                <div class="card-body">
                    <form method="POST">
                        <label>Fecha</label>
                        <input type="date" name="fechaIMC" class="form-control" value="2021-06-01" required pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"/>
                        <label>Estatura</label>
                        <input type="text" name="estatura" class="form-control"  required pattern="^\$?[1-2]+(.[0-9]{2})"/>
                        <label>Peso</label>
                        <input type="text" name="peso" class="form-control"  required pattern="^\$?[0-9]+(.[0-9]{2})"/>                        
                        <input type="submit" value="Agregar" class="btn btn-success"/>
                        <!--<a href="listaimc.htm" class="btn btn-primary">Regresar</a>-->
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
