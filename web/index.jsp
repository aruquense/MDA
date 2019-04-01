<%-- 
    Document   : index
    Created on : 19-mar-2019, 14:55:11
    Author     : Gustavo
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sprint 0 MDA</title>
    </head>
    <body>
        <h1>Inserción de producto</h1>
        <form action="FrontController">
            <input type="text" placeholder="id del vendedor" name="idvendedor" value="" required>
            <input type="text" placeholder="nombre" name="nombre" value="" required>
            <input type="text" placeholder="precio" name="precio" value="" required>
            <input type="text" placeholder="descripción" name="descripcion" value="" >
            <input type="text" placeholder="rutaImagen" name="imagen" value="" required >
            <input type="hidden" name="command" value="AddProductCommand">
            <input type="submit">
        </form>
        <hr>
        <h1>Actualizar un producto</h1>
        <form action="FrontController">
            <input type="text" placeholder="id del producto" name="idproducto" value="" required>
            <input type="text" placeholder="Nuevo nombre" name="nombre" value="" required>
            <input type="text" placeholder="Nuevo precio" name="precio" value="" required>
            <input type="text" placeholder="Nueva descripción" name="descripcion" value="" >
            <input type="text" placeholder="Nueva rutaImagen" name="imagen" value="" required >
            <input type="hidden" name="command" value="UpdateProductCommand">
            <input type="submit">
        </form>
        <hr>
        <h1>Lectura de producto</h1>
        <form action="FrontController">
            <input type="text" placeholder="id del producto" name="idproducto" value="" required>
            <input type="hidden" name="command" value="ReadProductCommand">
            <input type="submit">
        </form>
        <hr>
        <h1>Eliminar un producto</h1>
        <form action="FrontController">
            <input type="text" placeholder="id del producto" name="idproducto" value="" required>
            <input type="hidden" name="command" value="DelProductCommand">
            <input type="submit">
        </form>
        <hr>
        <h1>Buscar un producto</h1>
        <form action="FrontController">
            <input type="text" placeholder="busca un producto" name="producto" value="" required>
            <input type="hidden" name="command" value="SearchProductCommand">
            <input type="submit">
        </form>
        <hr>
        <% if(request.getParameter("name")!=null){%>
        <h1>El nombre del producto es: <%=request.getParameter("name")%></h1>  
        <%}%>
        
        <% if(request.getAttribute("searchList")!=null){
            ArrayList<String> list = (ArrayList<String>) request.getAttribute("searchList");
            for (String name : list) {                                    
        %>
        <p>Búsqueda <%=name%></p>  
        <%  }
        }%>
        
    </body>
</html>
