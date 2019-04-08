<%-- 
    Document   : product
    Created on : 04-abr-2019, 19:10:19
    Author     : sergio
--%>

<%@page import="modelo.Usuario"%>
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
        <nav class="navbar navbar-light navbar-expand-md navigation-clean-button">
            <div class="container"><a class="navbar-brand" href="index2.jsp">CompraVENTA</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse"
                    id="navcol-1">
                    <ul class="nav navbar-nav mr-auto">
                        <li class="nav-item" role="presentation"><a class="nav-link active" href="#">First Item</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="#">Second Item</a></li>
                        <li class="dropdown nav-item"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#">Dropdown </a>
                            <div class="dropdown-menu" role="menu"><a class="dropdown-item" role="presentation" href="#">First Item</a><a class="dropdown-item" role="presentation" href="#">Second Item</a><a class="dropdown-item" role="presentation" href="#">Third Item</a></div>
                        </li>
                    </ul><span class="navbar-text actions"> <a href="#" class="login">Log In</a><a class="btn btn-light action-button" role="button" href="#">Sign Up</a></span></div>
            </div>
        </nav>
    </div>
    <!-- End: Navigation with Button -->
    <%Usuario user = null;%>
    <%user = (Usuario) request.getAttribute("user");%>
    <div class="container">
        <!-- Start: NombreUsuario -->

        <h1 style="margin-top: 30px;"><%= request.getParameter("nombre") %></h1>
        <!-- End: NombreUsuario -->
    </div>
    <!-- Start: 1 Row 2 Columns -->
    <div style="margin-top: 13px;margin-bottom: 95px;">
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-xl-0" style="margin-left: -30px;"><img src="assets/img/man-user-t-1.png" style="height: 200px;width: 200px;margin-bottom: 0px;margin-top: 5px;margin-right: 0px;"></div>
                <!--<div class="col-md-6 offset-xl-0" style="margin-left: -30px;"><img src=<%= request.getParameter("img") %> style="width: 444px;margin-bottom: 0px;margin-top: 5px;margin-right: 0px;"></div>-->
                <div class="col-md-6">
                    <!-- Start: DescripcionLabel -->
                    <h3 class="text-left" style="margin-top: 10px;">Localización:</h3>
                    <!-- End: DescripcionLabel -->
                    <!-- Start: DescripcionParrafo -->
                    <p class="text-justify" style="margin-top: 20px;"><%= request.getParameter("localizacion") %>&nbsp;</p>
                    <!-- End: DescripcionParrafo -->
                    <p style="font-style: italic;font-size: 15px;margin-top: 25px;">Este usuario no se puede enviar a Canarias xD</p>
                    <!-- Start: EtiquetaPrecio -->
                    <h3 class="text-left" style="margin-top: 35px;">valoracion: &nbsp;</h3>
                    <!-- End: EtiquetaPrecio -->
                    <!-- Start: Valor del Precio -->
                    <p style="font-style: italic;font-size: 15px;margin-top: 25px;"><%= request.getParameter("valoracion") %></p>
                    <!-- End: Valor del Precio -->
                    <h3 class="text-left" style="margin-top: 35px;">nvisitas &nbsp;</h3>
                    <p style="font-style: italic;font-size: 15px;margin-top: 25px;"><%= request.getParameter("nvisitas") %></p>
                    <h3 class="text-left" style="margin-top: 35px;">nvaloraciones &nbsp;</h3>
                    <p style="font-style: italic;font-size: 15px;margin-top: 25px;"><%= request.getParameter("nvaloraciones") %></p>
                    <div class="btn-group" role="group" style="margin-top: 35px;margin-left: 54px;"><button class="btn btn-primary border rounded" type="button" style="margin-right: 11px;margin-left: 0px;width: 193px;background-color: rgb(169,41,41);height: 58px;"><i class="material-icons float-left" style="padding-right: 9px;margin-right: -11px;margin-left: 4px;">shopping_cart</i>Añadir a la cesta</button>
                        <button
                            class="btn btn-primary border rounded" type="button" style="margin-right: 11px;margin-left: 6px;width: 212px;background-color: rgb(169,41,41);"><i class="material-icons float-left" style="padding-right: 9px;margin-right: -11px;margin-left: 4px;">question_answer</i>Preguntar vendedor</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End: 1 Row 2 Columns -->
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
