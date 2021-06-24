
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container mt-4">
            <div class="card border-info">                                
                <div class="card-body">
                    
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Fecha</th>
                                <th>Estatura</th>
                                <th>Peso</th>
                                <th>IMC</th>
                                <th>Nivel</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dato" items="${lista}">
                            <tr>
                                <td>${dato.FechaIMC}</td>
                                <td>${dato.Estatura}</td>
                                <td>${dato.Peso}</td>
                                <td>${dato.IMC}</td>
                                <td>${dato.Nivel}</td>                                
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
                <div class="card-header bg-info text-white">
                    <a href="agregarimc.htm" class="btn btn-light">Registro IMC</a>
                </div>                

            </div>
            
        </div>
    </body>
</html>
