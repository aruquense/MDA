<%-- 
    Document   : pedidos
    Created on : 09-abr-2019, 13:23:39
    Author     : Sergio
--%>

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
                    <h1 style="margin-top: 0px;margin-left: 34px;">Pedidos</h1>
                    <!-- End: NombreProducto -->
                </div>
                <div class="col-md-6 d-xl-flex justify-content-xl-end"></div>
            </div>
        </div>
    </div>
    <!-- End: 1 Row 2 Columns -->
    <!-- Start: pedidos en curso[Compras] -->
    <div class="container" style="margin-bottom: 130px;margin-top: 32px;">
        <h2 style="margin-left: 80px;margin-bottom: 35px;">Compras realizadas</h2>
        <div class="table-responsive" style="width: 1020px;margin-left: 84px;">
            <table class="table">
                <thead>
                    <tr>
                        <th></th>
                        <th style="font-size: 20px;">Producto</th>
                        <th style="font-size: 20px;">Precio</th>
                        <th style="font-size: 20px;width: 313px;">Dirección de envío</th>
                        <th style="font-size: 20px;width: 151px;">Estado de envío</th>
                        <th></th>
                    </tr>
                </thead>                
                <tbody>
                    <%
                    HandlerBDD handler = new HandlerBDD();
                    if(request.getAttribute("orderList")!=null){
                        ArrayList<Pedido> list = (ArrayList<Pedido>) request.getAttribute("orderList");
                        for (Pedido order : list) {                                                                
                            String stateOrder =order.getEstado();
                            for(Integer idProd: order.getIdproductos()){
                                Producto prod = handler.leerProducto(idProd);                                                                                                                                                            
                                String nameProduct = prod.getNombre();
                                Double precio = prod.getPrecio();
                                String ruta = prod.getImg();
                                Usuario seller = handler.getUsuarioByID(prod.getIdvendedor());
                                Usuario myUser = handler.getUsuarioByID(order.getIdcomprador());
                                //long idSeller = seller.getId();
                                String correoSeller = seller.getCorreo();
                                String dirEnvio = myUser.getLocalizacion();                                
                        %>                              
                    <tr>
                        <td><img src="<%=ruta%>" style="width: 162px;margin-right: -17px;margin-left: -34px;"></td>
                        <td style="width: 300px;padding-top: 21px;"><%=nameProduct%></td>
                        <td style="width: 190px;margin-top: 0px;padding-top: 21px;"><strong><%=precio%>€&nbsp;</strong><br><br></td>
                        <td><%=dirEnvio%>. Correo del vendedor: <%=correoSeller%></td>
                        <td style="color: rgb(3,156,0);font-weight: bold;"><%=stateOrder%></td>
                        <td style="width: 248px;height: 134px;"><button class="btn btn-primary border rounded" type="button" style="margin-right: 11px;margin-left: 74px;width: 228px;background-color: rgb(85,85,85);height: 42px;margin-top: 0px;margin-bottom: 11px;"><i class="fas fa-question-circle float-left" style="padding-right: 9px;margin-right: -6px;margin-left: -2px;margin-top: 3px;"></i>Contactar con vendedor</button>
                            <button
                                class="btn btn-primary border rounded" type="button" style="margin-right: 11px;margin-left: 74px;width: 228px;background-color: rgb(169,41,41);height: 42px;margin-top: 0px;"><i class="fa fa-star float-left" style="padding-right: 9px;margin-right: -25px;margin-left: 15px;margin-top: 4px;"></i>Valorar vendedor</button>
                        </td>
                    </tr>
                    <%    }
                    }        
                }%>                
                </tbody>
            </table>
        </div>
    </div>
    <!-- End: pedidos en curso[Compras] -->
    <!-- Start: pedidos en curso[Ventas] -->
    <div class="container" style="margin-bottom: 130px;margin-top: 32px;">
        <h2 style="margin-left: 80px;margin-bottom: 35px;">Ventas realizadas</h2>
        <div class="table-responsive" style="width: 1020px;margin-left: 84px;margin-bottom: 172px;">
            <table class="table">
                <thead>
                    <tr>
                        <th></th>
                        <th style="font-size: 20px;">Producto</th>
                        <th style="font-size: 20px;">Precio</th>
                        <th style="font-size: 20px;width: 313px;">Dirección de envío</th>
                        <th style="font-size: 20px;width: 151px;">Estado de envío</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%                    
                    if(request.getAttribute("orderSell")!=null){
                        ArrayList<Pedido> list = (ArrayList<Pedido>) request.getAttribute("orderSell");
                        for (Pedido order : list) {                                                                
                            String stateOrder = order.getEstado();
                            for(Integer idProd: order.getIdproductos()){
                                Producto prod = handler.leerProducto(idProd);                                                                                                                                                            
                                String nameProduct = prod.getNombre();
                                Double precio = prod.getPrecio();
                                String ruta = prod.getImg();
                                Usuario seller = handler.getUsuarioByID(prod.getIdvendedor());
                                Usuario myUser = handler.getUsuarioByID(order.getIdcomprador());
                                //long idSeller = seller.getId();
                                String correoSeller = seller.getCorreo();
                                String dirEnvio = myUser.getLocalizacion();                                
                        %>                      
                    <tr>
                        <td><img src="<%=ruta%>" style="width: 162px;margin-right: -17px;margin-left: -34px;"></td>
                        <td style="width: 300px;padding-top: 21px;"><%=nameProduct%></td>
                        <td style="width: 190px;margin-top: 0px;padding-top: 21px;"><strong><%=precio%>€&nbsp;</strong><br><br></td>
                        <td><%=dirEnvio%>. Correo del vendedor: <%=correoSeller%></td>
                        <td style="color: rgb(3,156,0);font-weight: bold;"><%=stateOrder%></td>
                        <td style="width: 248px;height: 134px;"><button class="btn btn-primary border rounded" type="button" style="margin-right: 11px;margin-left: 74px;width: 228px;background-color: rgb(85,85,85);height: 42px;margin-top: 0px;margin-bottom: 11px;"><i class="fas fa-question-circle float-left" style="padding-right: 9px;margin-right: -6px;margin-left: -2px;margin-top: 3px;"></i>Contactar con comprador</button>
                            <button
                                class="btn btn-primary border rounded" type="button" style="margin-right: 11px;margin-left: 74px;width: 228px;background-color: rgb(169,41,41);height: 42px;margin-top: 0px;"><i class="fa fa-exclamation-circle float-left" style="padding-right: 0px;margin-right: -92px;margin-left: 24px;margin-top: 4px;margin-bottom: 0px;"></i>Ver incidencias</button>
                        </td>
                    </tr>
                    <%    }
                    }        
                }%>                
                </tbody>
            </table>
        </div>
    </div>
    <!-- End: pedidos en curso[Ventas] -->
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
