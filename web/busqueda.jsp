<%-- 
    Document   : busqueda
    Created on : 09-abr-2019, 13:22:28
    Author     : Sergio
--%>

<%@page import="modelo.Usuario"%>
<%@page import="command.HandlerBDD"%>
<%@page import="java.util.ArrayList"%>
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
        <div>
            <%@include file="navbar.jsp" %>
        </div>
        <!-- End: Navigation with Button -->
        <!-- Start: 1 Row 2 Columns -->
        <div>
            <div class="container">
                <!-- Start: NombreProducto -->
                <%
                    String busqueda = request.getParameter("busqueda");
                %>
                <h1 style="margin-top: 0px;margin-left: 34px;">Resultados de la búsqueda '<%=busqueda%>'</h1>
                <!-- End: NombreProducto -->
                <div class="row" style="margin-top: 25px;margin-bottom: 41px;">
                    <div class="col-md-6"></div>
                </div>
            </div>
        </div>
        <!-- End: 1 Row 2 Columns -->
        <!-- Start: cesta -->
        <div class="container" style="margin-bottom: 130px;margin-top: 32px;">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th></th>
                            <th style="font-size: 20px;">Producto</th>
                            <th style="font-size: 20px;width: 55px;">Precio</th>
                            <th style="width: 327px;font-size: 20px;">Localización del vendedor</th>
                            <th style="font-size: 20px;">Vendedor</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (request.getAttribute("searchList") != null) {
                                ArrayList<Producto> list = (ArrayList<Producto>) request.getAttribute("searchList");
                                for (Producto prod : list) {
                                    String name = prod.getNombre();
                                    Double precio = prod.getPrecio();
                                    String desc = prod.getDescripcion();
                                    HandlerBDD handler = new HandlerBDD();
                                    Usuario user = handler.getUsuarioByID(prod.getIdvendedor());
                                    String nameSeller = user.getNombre();
                                    String loc = user.getLocalizacion();
                                    String ruta = prod.getImg();
                        %>
                        <tr>
                            <!--                        <td><img src="assets/img/61yI7vWa83L._SL1000_.jpg" style="width: 162px;margin-right: -18px;margin-left: -47px;margin-top: -6px;"></td>-->
                            <td><img src="<%=ruta%>" style="width: 162px;margin-right: -18px;margin-left: -47px;margin-top: -6px;"></td>
                            <td style="width: 300px;padding-top: 21px;"><%=name%></td>
                            <td style="width: 190px;margin-top: 0px;padding-top: 21px;"><strong><%=precio%>€</strong><br><br></td>
                            <td><%=loc%></td>
                            <td><%=nameSeller%></td>                        
                            <td style="width: 360px;">
                                <form action="FrontController">
                                    <input type="hidden" name="command" value="AddToShoppingCartCommand">
                                    <input type="hidden" name="idproducto" value=<%= prod.getId().toString()%>>
                                    <button type="submit"  class="btn btn-primary border rounded" style="margin-right: 11px;margin-left: 0px;width: 193px;background-color: rgb(169,41,41);height: 58px;">
                                        <i class="material-icons float-left" style="padding-right: 9px;margin-right: -11px;margin-left: 4px;">shopping_cart</i>Añadir a la cesta
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <%}
                        }%>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- End: cesta -->
        <div class="container" style="margin-bottom: 130px;margin-top: 32px;">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th></th>
                            <th style="font-size: 20px;">Nombre usuario</th>
                            <th style="font-size: 20px;width: 55px;">Correo</th>
                            <th style="width: 327px;font-size: 20px;">Localización</th>
                            <th style="font-size: 20px;">Valoración</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (request.getAttribute("userList") != null) {
                                ArrayList<Usuario> userList = (ArrayList<Usuario>) request.getAttribute("userList");
                                for (Usuario user: userList) {
                                    Long idUser = user.getId();
                                    String name = user.getNombre();
                                    String correo = user.getCorreo();
                                    String loc = user.getLocalizacion();
                                    String ruta = "assets/img/man-user-t-1.png";
                                    Double valoracion = user.getValoracion();
                                    
                        %>
                        <tr>
                            <!--                        <td><img src="assets/img/61yI7vWa83L._SL1000_.jpg" style="width: 162px;margin-right: -18px;margin-left: -47px;margin-top: -6px;"></td>-->
                            <td><img src="<%=ruta%>" style="width: 162px;margin-right: -18px;margin-left: -47px;margin-top: -6px;"></td>
                            <td style="width: 300px;padding-top: 21px;"><%=name%></td>
                            <td style="width: 190px;margin-top: 0px;padding-top: 21px;"> <%=correo%> <br><br></td>
                            <td><%=loc%></td>
                            <td><span class="stars" data-rating="4" data-num-stars="5" ></span></td>                        
                            <td style="width: 360px;">
                                <form action="FrontController">
                                    <input type="hidden" name="command" value="ViewUserCommand">
                                    <input type="hidden" placeholder="id" name="idUser" value=<%=idUser%> >         
                                    <button type="submit"  class="btn btn-primary border rounded" style="margin-right: 11px;margin-left: 0px;width: 193px;background-color: rgb(169,41,41);height: 58px;">
                                        <i class="material-icons float-left" style="padding-right: 9px;margin-right: -11px;margin-left: 4px;"></i>Ver detalles
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <%}
                        }%>
                    </tbody>
                </table>
            </div>
        </div>
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
