<%@page import="java.util.List"%>
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
        <a href="index2.jsp">index2</a>
        <h1>Pay</h1>
        <form action="FrontController" method="POST" enctype="multipart/form-data" >    
            <input type="hidden" name="command" value="PayCommand">    
            <input type="submit" value="PayCommand">
        </form> 
        		<h1>Comentar vendedor</h1>
        <form action="FrontController" method="POST" enctype="multipart/form-data" >
            <input type="text" placeholder="idvendedor" name="idvendedor" value="" required>
            <input type="text" placeholder="idusuariocomentando" name="idusuariocomentando" value="" required>
            <input type="text" placeholder="Comentario" name="comentario" value="" required>
            <input type="hidden" name="command" value="ComentarUsuario">    
            <input type="submit">
        </form>   
        <h1>TEST MarkProductAsSold</h1>
        <form action="FrontController" method="POST" enctype="multipart/form-data" >
            <input type="text" placeholder="idproducto" name="idproducto" value="" required>         
            <input type="hidden" name="command" value="TestMarkProductAsSold">    
            <input type="submit">
        </form>        
        <h1>View user</h1>
        <form action="FrontController" method="POST" enctype="multipart/form-data" >
            <input type="text" placeholder="id" name="idUser" value="" required>         
            <input type="hidden" name="command" value="ViewUserCommand">    
            <input type="submit">
        </form>        
        <h1>Update User user</h1>
        <form action="FrontController" method="POST" enctype="multipart/form-data" >
            <input type="text" placeholder="id" name="idUser" value="" required>
            <input type="text" placeholder="nombre" name="nombre" value="" required>
            <input type="text" placeholder="correo" name="correo" value="" required>
            <input type="password" placeholder="contrasena" name="contrasena" value="" required>
            <input type="password" placeholder="Repite contrasena" name="contrasena2" value="" required>
            <input type="text" placeholder="localizacion" name="localizacion" value="" required>                      
            <input type="hidden" name="command" value="UpdateUserCommand">    
            <input type="submit">
        </form>     
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
        <% Carrito l = (Carrito) request.getSession().getAttribute("carrito"); 
         List<Producto> productos=null;
        %>
        <%if (l != null){
        productos = l.getContents();%>
        <p>El carrito contiene: <p><br>
            <% for (Producto p : productos) { %>
                <% String name = p.getNombre();%>
                <p>Producto: <%=name%></p>
            <%}%>
        <%}%>
        
    </body>
</html>
