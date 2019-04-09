<%-- 
    Document   : myorder
    Created on : 09-abr-2019, 17:29:35
    Author     : Gustavo
--%>

<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script>
                window.onload=function(){
                // Una vez cargada la página, el formulario se enviara automáticamente.
		document.forms["miformulario"].submit();
            }
        </script>
    </head>
    <body>
        <%Usuario user = (Usuario)session.getAttribute("usuario");
        long id = user.getId();
        %>
        <form action="FrontController" name="miformulario" method="POST">            
            <input type="hidden" name="command" value="UnloginCommand">            
        </form>
    </body>
</html>
