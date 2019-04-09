<%-- 
    Document   : inicioSesionBasic
    Created on : 09-abr-2019, 13:23:04
    Author     : OrlandoPadrón
--%>

<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Inicio Sesion</h1>
        <form action="FrontController" method="POST" enctype="multipart/form-data" >
            <input type="text" placeholder="nombre usuario" name="userName" value="" required>
            <input type="text" placeholder="password" name="password" value="" required>                      
            <input type="hidden" name="command" value="LoginCommand">                                    
            <input type="submit">
        </form>
        <%
            if(request.getAttribute("usuario") !=null){
            Usuario user = (Usuario)request.getAttribute("usuario");
            String name = user.toString();
            %>
            <p><%=name%></p>
            <%}%>
    </body>
</html>
