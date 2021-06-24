

<%@page import="java.util.Enumeration"%>
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
            HttpSession sesion = request.getSession(false);
            Enumeration e=sesion.getAttributeNames();
            if(e.hasMoreElements()){
                out.println(sesion.getAttribute("IdUsuario"));
            }
        %>
        <div class="container mt-4 col-lg-4">
            <div class="card border-info">
                <div class="card-header bg-info">                    
                    
                </div>
                <div class="card-body">
                    <form method="POST">                        
                        <label>Usuario</label>
                        <input type="text" name="usuario" class="form-control" />
                        <label>Password</label>
                        <input type="text" name="password" class="form-control" />                        
                        
                        <input type="submit" value="Ingresar" class="btn btn-success"/> &nbsp;&nbsp;&nbsp;       
                        <a href="agregar.htm" class="btn btn-light">Registro!</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
