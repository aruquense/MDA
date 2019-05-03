<%-- 
    Document   : detallesPedidos
    Created on : 30-abr-2019, 12:50:25
    Author     : OrlandoPadrón
--%>

<%@page import="java.sql.Array"%>
<%@page import="modelo.Producto"%>
<%@page import="command.HandlerBDD"%>
<%@page import="modelo.Pedido"%>
<%@page import="java.util.ArrayList"%>
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
    <!-- Start: 1 Row 2 Columns -->
    <div>
        <div class="container">
            <div class="row" style="margin-top: 25px;margin-bottom: 41px;">
                <div class="col-md-6">
                    <!-- Start: NombreProducto -->
                    <h1 style="margin-top: 0px;margin-left: -15px;">Detalles del pedido</h1>
                    <!-- End: NombreProducto -->
                </div>
                <div class="col-md-6 d-xl-flex justify-content-xl-end"></div>
            </div>
        </div>
    </div>
    <!-- End: 1 Row 2 Columns -->
    <!-- Start: 2 Rows 1+1 Columns -->
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive" style="margin-bottom: 99px;">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th style="width: 369px;">Dirección de envío</th>
                                    <th style="width: 321px;">Método de pago</th>
                                    <th>Resumen del pedido</th>
                                </tr>
                            </thead>
                            <tbody>
                                    <!-- Java -->
                                    <%
                                    HandlerBDD bdd = new HandlerBDD();
                                    Pedido order = null;
                                    ArrayList<Producto> listProd = new ArrayList<Producto>(); 
                                    if(request.getAttribute("orderDetails")!=null){
                                        order = (Pedido) request.getAttribute("orderDetails");
                                    }
                                    //Productos del pedido 
                                    if (order!=null){
                                        Integer[] idProductos = order.getIdproductos();
                                        for (Integer prod : idProductos) {
                                                listProd.add(bdd.leerProducto(prod));
                                        }
                                    }
                                    
                                    String dirEnvio = bdd.getUsuarioByID(order.getIdcomprador()).getLocalizacion();
                                    String stateOrder = order.getEstado();
                                    String ruta = "adsas";
                                    String nameProduct = "ASDAS";
                                    double precio = 0;
                                    double total = 0; 
                                    String description = "ASDAS";

                                    %>

                                <tr>

                                    <td><%=dirEnvio%></td>
                                    <td>Pago a contrarrembolso</td>
                                    <td>
                                        <div class="table-responsive table-borderless">
                                            <table class="table table-bordered">
                                                <tbody>
                                                    <tr>
                                    <%
                                    for (Producto prod : listProd) {
                                        nameProduct = prod.getNombre();
                                        precio = prod.getPrecio(); 
                                        total+=precio; 
                                        
                                    %>
                                                        <td><%=nameProduct%></td>
                                                        <td><%=precio%>€</td>
                                                    </tr>
                                                    <%}%>
                                                    <tr>
                                                        <td>Envío</td>
                                                        <td>10.5€</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 219px;font-weight: bold;">Total</td>
                                                        <td><%=total+10.5%>€</td>
                                                    </tr>
                                                    

                                                </tbody>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                        <!-- Java -->

                    <h2 style="margin-left: 11px;margin-bottom: 13px;">Fecha estimada de entrega —&nbsp;<span style="font-weight: normal;">12 de Mayo de 2019</span></h2>
                    <p style="margin-left: 14px;margin-bottom: 38px;">Estado del pedido:&nbsp;<span style="color: rgb(3,156,0);font-weight: bold;margin-left: 10px;"><%=stateOrder%></span></p>
                    <div class="table-responsive" style="margin-bottom: 99px;">
                        <table class="table">
                                                                <%
                                        for (Producto prod : listProd) {
                                            ruta = prod.getImg();
                                    %>
                            <tbody>
                                <tr>

                                    
                                    <td style="width: 253px;"><img src="<%=ruta%>" style="width: 208px;"></td>
                                    <td>
                                        <div class="table-responsive table-borderless">
                                            <table class="table table-bordered">
                                                <tbody>
                                                    <tr>
                                                        <%
                                                            
                                    
                                                                nameProduct = prod.getNombre();
                                                              
                                                                description = prod.getDescripcion();
                                        
                                                        %>
                                                        <td style="width: 219px;font-weight: bold;"><%=nameProduct%></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="font-weight: normal;"><%=description%>.</td>
                                                    </tr>
                                                    <tr></tr>
                                                    

                                                </tbody>
                                            </table>
                                        </div>
                                    </td>
                                    <%}%>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                                                                                                      
            </div>
        </div>
    </div>
    <!-- End: 2 Rows 1+1 Columns -->
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