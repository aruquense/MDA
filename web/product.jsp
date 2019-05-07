<%-- 
    Document   : product
    Created on : 04-abr-2019, 19:10:19
    Author     : sergio
--%>

<%@page import="modelo.Comentario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Pedido"%>
<%@page import="command.HandlerBDD"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>MDA</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/fonts/material-icons.min.css">
    <link rel="stylesheet" href="assets/css/Article-List.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Button.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <!-- Start: Navigation with Button -->
    <%@include file="navbar.jsp" %>
    <!-- End: Navigation with Button -->
    <%Producto producto = null;
    producto = (Producto) request.getAttribute("product");
    Usuario user = (Usuario) request.getAttribute("usuario");
    String name = user.getNombre()+"&nbsp;";
    %>
    <div class="container">
        <!-- Start: NombreProducto -->

        <h1 style="margin-top: 30px;"><%=producto.getNombre() %></h1>
        <!-- End: NombreProducto -->
    </div>
    <!-- Start: 1 Row 2 Columns -->
    <div style="margin-top: 13px;margin-bottom: 95px;">
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-xl-0" style="margin-left: -30px;"><img src="<%= producto.getImg() %>" style="width: 444px;margin-bottom: 0px;margin-top: 5px;margin-right: 0px;"></div>
                <div class="col-md-6">
                    <!-- Start: DescripcionLabel -->
                    <h3 class="text-left" style="margin-top: 10px;">Descripción:</h3>
                    <!-- End: DescripcionLabel -->
                    <!-- Start: DescripcionParrafo -->
                    <p class="text-justify" style="margin-top: 20px;"><%= producto.getDescripcion() %>&nbsp;</p>
                    <!-- End: DescripcionParrafo -->
                    <p style="font-style: italic;font-size: 15px;margin-top: 25px;">Este producto no se puede enviar a Canarias</p>
                    <!-- Start: EtiquetaPrecio -->
                    <h3 class="text-left" style="margin-top: 35px;">Vendedor:&nbsp;</h3>
                    <!-- End: EtiquetaPrecio -->
                    <!-- Start: Valor del Precio -->
                    <p style="color: #56c6c6;margin-top: -34px;margin-left: 152px;font-weight: bold;">
                        <%=name%><i class="fa fa-star float-none" style="margin-left: 42px;color: rgb(169,41,41);"></i>
                        <i class="fa fa-star float-none" style="margin-left: 3px;color: rgb(169,41,41);"></i>
                        <i class="fa fa-star float-none"
                            style="margin-left: 3px;color: rgb(169,41,41);"></i>
                        <i class="fa fa-star float-none" style="margin-left: 3px;color: rgb(169,41,41);"></i>
                        <i class="fa fa-star float-none" style="margin-left: 3px;color: rgb(152,151,151);"></i></p>
                        <form action="FrontController">
                            <input type="hidden" name="command" value="ViewUserCommand">
                            <input type="hidden" name="idUser" value="<%=producto.getIdvendedor()%>">
                            <button type="submit"  class="btn btn-primary border rounded" style="background-color: rgb(169,41,41); height: 58px;width: 150px">
                                <i class="material-icons float-right" style="">user_comment</i>Ir al vendedor
                            </button>
                        </form>
                    <!-- End: Valor del Precio -->
                    <!-- Start: EtiquetaPrecio -->
                    <h3 class="text-left" style="margin-top: 35px;">Precio:&nbsp;</h3>
                    <!-- End: EtiquetaPrecio -->
                    <!-- Start: Valor del Precio -->
                    <p style="color: #b10c0c;margin-top: -34px;margin-left: 104px;font-weight: bold;"><%= producto.getPrecio() %>€&nbsp;</p>
                    <!-- End: Valor del Precio -->
                    <%
                        Usuario usuario = (Usuario) session.getAttribute("usuario");
                        if(usuario!=null){
                    %>
                    <div class="btn-group" role="group" style="margin-top: 35px;margin-left: 54px;">
                        <form action="FrontController">
                            <input type="hidden" name="command" value="AddToShoppingCartCommand">
                            <input type="hidden" name="idproducto" value=<%= producto.getId().toString() %>>
                            <button type="submit"  class="btn btn-primary border rounded" style="margin-right: 11px;margin-left: 0px;width: 193px;background-color: rgb(169,41,41);height: 58px;">
                                <i class="material-icons float-left" style="padding-right: 9px;margin-right: -11px;margin-left: 4px;">shopping_cart</i>Añadir a la cesta
                            </button>
                        </form>
                        <button
                            class="btn btn-primary border rounded" type="button" style="margin-right: 11px;margin-left: 6px;width: 212px;background-color: rgb(169,41,41);"><i class="material-icons float-left" style="padding-right: 9px;margin-right: -11px;margin-left: 4px;">question_answer</i>Preguntar vendedor</button>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
    <!-- End: 1 Row 2 Columns -->
    <!-- Start: Comentarios -->
    <div class="container" style="margin-bottom: 85px;">
                <%
                    HandlerBDD handler = new HandlerBDD(); 
                    
                    boolean hasBought = false;
                    ArrayList<Pedido> pedidos = new ArrayList<Pedido>(); 
                    if (usuario != null){                    
                        pedidos = (ArrayList<Pedido>) handler.compradorHasBoughtProduct(usuario.getId());
                        for (Pedido pedido : pedidos) {
                                Integer[] idProductos = pedido.getIdproductos();
                            for (Integer id : idProductos) {
                                if (id == producto.getId().intValue()){
                                    hasBought = true; 
                                    System.out.println("El usuario " + usuario.getNombre() + "("+ usuario.getId()+") ha comprado el producto con id " + id);
                                    break;
                                }
                            }
                        }

                    }
                    
                    //Cogemos todos los comentarios todos los comentarios. 
                    ArrayList<Comentario> comentarios = handler.readComments(producto.getId().intValue());
                %>        
        <h1>Comentarios</h1>
        <%
            if(!comentarios.isEmpty()){
                for (Comentario comentario : comentarios) {
                       String nombreUsuario = handler.getUsuarioByID(comentario.getIdAuthor()).getNombre();
                       String comment = comentario.getComentario();
                       System.out.println("El id del comentario es: " + String.valueOf(comentario.getId()));
                       //Faltaría la imagen del usuario. 
            
       
                    if (usuario == null || usuario.getId() != handler.getUsuarioByID(comentario.getIdAuthor()).getId()){
                    
        %>
        <!-- Start: ComentarioSinBotones -->
        <div class="border rounded" style="margin-top: 19px;margin-bottom: 30px;background-color: rgba(187,187,187,0.17);height: 175px;">
            <div class="text-right d-xl-flex justify-content-xl-end" style="width: 762px;margin-bottom: -49px;margin-top: 18px;">
                <!-- Start: BotonesDeEdición/Borrado -->
                <div class="btn-group btn-group-sm" role="group" style="margin-top: -5px;margin-right: -329px;"></div>
                <!-- End: BotonesDeEdición/Borrado -->
            </div><img class="rounded-circle shadow-sm" style="width: 93px;margin-top: 47px;margin-left: 34px;padding-top: 8px;" src="assets/img/imagen_perfil.jpg">
            <p style="margin-top: -85px;margin-left: 186px;margin-bottom: 32px;"><label class="d-xl-flex justify-content-xl-start" style="margin-top: -4px;padding-right: 0px;margin-left: 37px;width: 680px;"><%=comment%></label><br></p>
            <!-- Start: NombreDelUsuario --><label class="d-xl-flex align-items-xl-start" style="margin-left: 30px;margin-top: 38px;padding-right: 1px;margin-right: 962px;"><%=nombreUsuario%></label>
            <!-- End: NombreDelUsuario -->
        </div>
        <!-- End: ComentarioSinBotones -->
        <%}else{%>
        <!-- Start: ComentarioDeUnUsuario -->
        <form action="FrontController" id="deleteForm+<%=comentario.getId()%>">
            <input type="hidden" name="idComment" value="<%=comentario.getId()%>">
            <input type="hidden" name="command" value="DeleteCommentCommand"> 
        </form>
                          
        <form action="editComment.jsp" id="editForm+<%=comentario.getId()%>">
            <input type="hidden" name="idComment" value="<%=comentario.getId()%>">
            <input type="hidden" name="message" value="<%=comentario.getComentario()%>"> 
        </form>                            
        <div class="border rounded" style="margin-top: 19px;margin-bottom: 30px;background-color: rgba(187,187,187,0.17);height: 175px;">
            <div class="text-right d-xl-flex justify-content-xl-end" style="width: 762px;margin-bottom: -49px;margin-top: 18px;">

                <!-- Start: BotonesDeEdición/Borrado -->                     
                            <div class="btn-group btn-group-sm" role="group" style="margin-top: -5px;margin-right: -329px;"><button class="btn btn-primary border rounded" type="submit" form="editForm+<%=comentario.getId()%>" style="margin-right: 7px;background-color: rgb(111,111,111);"><i class="fa fa-edit" style="margin-right: 7px;"></i>Editar</button><button class="btn btn-primary border rounded"
                                                                                                                                                                                                        type="submit" form="deleteForm+<%=comentario.getId()%>" style="background-color: rgb(169,41,41);"><i class="icon ion-android-delete" style="margin-right: 6px;"></i>Eliminar</button></div>
                <!-- End: BotonesDeEdición/Borrado -->
            </div><img class="rounded-circle shadow-sm" style="width: 93px;margin-top: 14px;margin-left: 34px;padding-top: 8px;" src="assets/img/imagen_perfil.jpg">
            <p style="margin-top: -85px;margin-left: 186px;margin-bottom: 32px;"><label class="d-xl-flex justify-content-xl-start" style="margin-top: -4px;padding-right: 0px;margin-left: 37px; width: 680px;"><%=comment%></label><br></p>
            <!-- Start: NombreDelUsuario --><label class="d-xl-flex align-items-xl-start" style="margin-left: 30px;margin-top: 38px;padding-right: 1px;margin-right: 962px;"><%=nombreUsuario%></label>
            <!-- End: NombreDelUsuario -->
        </div>
        <!-- End: ComentarioDeUnUsuario -->
        <%      }
            }
        }
     %>
    </div>
    <!-- End: Comentarios -->
    <%
        if (hasBought){
            System.out.println("Puede escribir una reseña");
    %>
    <!-- Start: Escribir comentario -->
    <div class="container" style="margin-bottom: 85px;">
        <h1>Escribir comentario</h1>
        <h5 style="font-style: normal;font-weight: normal;">Para escribir un comentario deberá haber comprado el producto.&nbsp;</h5>
        <!-- Start: ComentarioDeUnUsuario -->
        <div class="border rounded" style="margin-top: 19px;margin-bottom: 30px;background-color: rgba(187,187,187,0.17);height: 198px;">
            <!-- Start: textArea -->
            <div style="margin-top: 18px;margin-left: 15px;"><textarea class="border rounded d-xl-flex justify-content-xl-center" name="comment" style="width: 1030px;margin-left: 21px;height: 119px;margin-top: 2px;" form="commentForm"></textarea>
                <!-- Start: button -->
                <div class="text-right d-xl-flex justify-content-xl-end" style="width: 762px;margin-bottom: -49px;margin-top: 9px;">
                     <form action="FrontController" id="commentForm">
                            <input type="hidden" name="idProduct" value="<%=producto.getId()%>">
                            <input type="hidden" name="idAuthor" value="<%=usuario.getId()%>">
                            <input type="hidden" name="command" value="SaveCommentCommand">    
                    <!-- Start: Botón de enviado -->
                    <div class="btn-group btn-group-sm d-xl-flex justify-content-xl-end" role="group" style="margin-top: -5px;margin-right: -329px;margin-left: 21px;"><button class="btn btn-primary border rounded" type="submit" style="background-color: rgb(41,154,169);margin-right: 38px;margin-top: 11px;"><i class="fas fa-check-circle" style="margin-right: 6px;"></i>Enviar</button></div></form>
                    <!-- End: Botón de enviado -->
                </div>
                <!-- End: button -->
            </div>
            <!-- End: textArea -->
        </div>
        <!-- End: ComentarioDeUnUsuario -->
    </div>
    <%}%>
    <!-- End: Escribir comentario -->    
    <!-- Start: Footer Dark -->
    <div class="footer-dark">
        <footer>
            <div class="container">
                <div class="row">
                    <!-- Start: Services -->
                    <div class="col-sm-6 col-md-3 item">
                        <h3>Services</h3>
                        <ul>
                            <li><a href="#">Web design</a></li>
                            <li><a href="#">Development</a></li>
                            <li><a href="#">Hosting</a></li>
                        </ul>
                    </div>
                    <!-- End: Services -->
                    <!-- Start: About -->
                    <div class="col-sm-6 col-md-3 item">
                        <h3>About</h3>
                        <ul>
                            <li><a href="#">Company</a></li>
                            <li><a href="#">Team</a></li>
                            <li><a href="#">Careers</a></li>
                        </ul>
                    </div>
                    <!-- End: About -->
                    <!-- Start: Footer Text -->
                    <div class="col-md-6 item text">
                        <h3>Company Name</h3>
                        <p>Praesent sed lobortis mi. Suspendisse vel placerat ligula. Vivamus ac sem lacus. Ut vehicula rhoncus elementum. Etiam quis tristique lectus. Aliquam in arcu eget velit pulvinar dictum vel in justo.</p>
                    </div>
                    <!-- End: Footer Text -->
                    <!-- Start: Social Icons -->
                    <div class="col item social"><a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-instagram"></i></a></div>
                    <!-- End: Social Icons -->
                </div>
                <!-- Start: Copyright -->
                <p class="copyright">Company Name © 2017</p>
                <!-- End: Copyright -->
            </div>
        </footer>
    </div>
    <!-- End: Footer Dark -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>
