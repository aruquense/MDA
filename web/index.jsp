<%@page import="java.util.Map"%>
<%@page import="modelo.Carrito"%>
<%@page import="modelo.Pedido"%>
<%@page import="modelo.Producto"%>
<%@page import="command.FrontController"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Sprint 0 MDA</title>
    </head>
    <body>        
        <h1>Score user</h1>
        <form action="FrontController" method="POST" enctype="multipart/form-data" >
            <input type="text" placeholder="id" name="idUsuario" value="" required>
            <input type="text" placeholder="puntuacion" name="puntuacion" value="" required>                
            <input type="hidden" name="command" value="ScoreUserCommand">    
            <input type="submit">
        </form>            
        <h1>Register user</h1>
        <form action="FrontController" method="POST" enctype="multipart/form-data" >
            <input type="text" placeholder="nombre" name="nombre" value="" required>
            <input type="text" placeholder="correo" name="correo" value="" required>
            <input type="password" placeholder="contrasena" name="contrasena" value="" required>
            <input type="text" placeholder="localizacion" name="localizacion" value="" required>                      
            <input type="hidden" name="command" value="RegisterUserCommand">    
            <input type="submit">
        </form>     
        <h1>Inserción de producto</h1>
        <form action="FrontController" method="POST" enctype="multipart/form-data" >
            <input type="text" placeholder="id del vendedor" name="idvendedor" value="" required>
            <input type="text" placeholder="nombre" name="nombre" value="" required>
            <input type="text" placeholder="precio" name="precio" value="" required>
            <input type="text" placeholder="descripción" name="descripcion" value="" >                       
            <input type="hidden" name="command" value="AddProductCommand">
            <input type="file" name="file" accept=".jpg"/>                                      
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
        <hr>
        <h1>Obtener pedidos de un usuario</h1>
        <form action="FrontController">
            <input type="text" placeholder="Elige un usuario" name="idUser" value="" required>
            <input type="hidden" name="command" value="GetOrderCommand">
            <input type="submit">
        </form>
        <hr>
        <h1>Añadir producto al carrito</h1>
        <form action="FrontController">
            <input type="text" placeholder="id del producto" name="idproducto" value="" required>
            <input type="text" placeholder="cantidad" name="cantidad" value="" required>
            <input type="hidden" name="command" value="AddToShoppingCartCommand">
            <input type="submit">
        </form>
        <hr>
        <h1>Eliminar producto del carrito</h1>
        <form action="FrontController">
            <input type="text" placeholder="id del producto" name="idproducto" value="" required>
            <input type="hidden" name="command" value="RemoveFromShoppingCartCommand">
            <input type="submit">
        </form>
        <hr>
        <% if(request.getParameter("name")!=null){%>
        <h1>El nombre del producto es: <%=request.getParameter("name")%></h1>  
        <%}%>
        
        <% if(request.getAttribute("searchList")!=null){
            ArrayList<Producto> list = (ArrayList<Producto>) request.getAttribute("searchList");
            for (Producto prod : list) {                                    
            String name = prod.toString();            
        %>
        <p>Búsqueda <%=name%></p>  
        <%  }
        }%>
        <% if(request.getAttribute("orderList")!=null){
            ArrayList<Pedido> list = (ArrayList<Pedido>) request.getAttribute("orderList");
            for (Pedido order : list) {                                    
            String name = order.toString();            
        %>
        <p>Pedido:  <%=name%>, tiene los productos: </p>          
        <%  for(Integer idProd: order.getIdproductos()){                
        %>
        <p><%=idProd%></p>  
            <%}
          }

        
        }%>
        
        <% Carrito l = (Carrito) request.getSession().getAttribute("carrito"); %>
        <%if (l != null){%>
        <p>El carrito contiene: <p><br>
            <% Map<Producto,Integer> elements = l.getContents(); %>
            <% for (Map.Entry<Producto, Integer> entry : elements.entrySet()) { %>
                <% String name = entry.getKey().getNombre();%>
                <%int cantidad = entry.getValue();%>
                <p>Producto: <%=name%>, cantidad: <%=cantidad%><p>
            <%}%>
        <%}%>
        
    </body>
</html>
