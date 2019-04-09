<%-- 
    Document   : carrito
    Created on : 08-abr-2019, 16:59:33
    Author     : sergio
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Producto"%>
<%@page import="modelo.Carrito"%>
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
                    <h1 style="margin-top: 0px;margin-left: 34px;">Cesta</h1>
                    <!-- End: NombreProducto -->
                </div>
                <div class="col-md-6 d-xl-flex justify-content-xl-end">
                    <!-- Start: eliminarDeLaCestaButton --><button class="btn btn-primary border rounded" type="button" style="margin-right: 0px;margin-left: 0px;width: 213px;background-color: rgb(85,85,85);height: 43px;margin-top: 8px;padding: 0px;"><i class="fas fa-chevron-circle-down float-left d-xl-flex justify-content-xl-end" style="padding-right: 9px;margin-right: -10px;margin-left: 4px;margin-top: 5px;width: 34px;"></i>Proceder a la compra</button>
                    <!-- End: eliminarDeLaCestaButton -->
                </div>
            </div>
        </div>
    </div>
        <% Carrito l = (Carrito) request.getSession().getAttribute("carrito"); 
        List<Producto> productos=null;%>
    <!-- End: 1 Row 2 Columns -->
    <!-- Start: cesta -->
    <div class="container" style="margin-bottom: 130px;margin-top: 32px;">
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th></th>
                        <th style="font-size: 20px;">Producto</th>
                        <th style="font-size: 20px;">Precio</th>
                        <th></th>
                    </tr>
                </thead>
                <% int i = 1;%>
                <%if (l != null){
                productos = l.getContents();%>
                <tbody>
                    <%for(Producto p : productos ) {%>
                    <tr>
                        <td><img src=<%=p.getImg()%> style="width: 162px;margin-right: -40px;"></td>
                        <td style="width: 300px;padding-top: 21px;"><%=p.getNombre()%></td>
                        <td style="width: 190px;margin-top: 0px;padding-top: 21px;"><strong><%=p.getPrecio()%>€&nbsp;</strong><br><br></td>
                        <form action="FrontController">
                            <input type="hidden" name="command" value="RemoveFromShoppingCartCommand">
                            <input type="hidden" name="idproducto" value=<%= p.getId().toString() %>>
                            <td style="width: 360px;"><button type="submit" class="btn btn-primary border rounded" style="margin-right: 11px;margin-left: 0px;width: 135px;background-color: rgb(169,41,41);height: 42px;margin-top: 0px;">
                                <i class="material-icons float-left" style="padding-right: 9px;margin-right: -11px;margin-left: 4px;">close</i>Eliminar
                            </button>
                       </form>
                    </tr>
                </tbody>
                    <%}%>
                <%}%>
            </table>
        </div>
    </div>
    <!-- End: cesta -->
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
