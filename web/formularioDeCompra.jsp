<%-- 
    Document   : formularioDeCompra
    Created on : 09-abr-2019, 13:18:38
    Author     : Sergio
--%>

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
            <div class="container"><a class="navbar-brand" href="#">CompraVENTA</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
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
    <!-- Start: 1 Row 2 Columns -->
    <div>
        <div class="container">
            <div class="row" style="margin-top: 25px;margin-bottom: 56px;">
                <div class="col-md-6">
                    <!-- Start: NombreProducto -->
                    <h1 style="margin-top: 0px;">Dirección de envío</h1>
                    <!-- End: NombreProducto -->
                </div>
                <div class="col-md-6 d-xl-flex justify-content-xl-end">
                    <!-- Start: eliminarDeLaCestaButton --><button class="btn btn-primary border rounded" type="button" style="margin-right: 0px;margin-left: 0px;width: 178px;background-color: rgb(85,85,85);height: 43px;margin-top: 8px;padding: 0px;"><i class="fas fa-chevron-circle-down float-left d-xl-flex justify-content-xl-end" style="padding-right: 9px;margin-right: -10px;margin-left: 4px;margin-top: 5px;width: 34px;"></i>Confirmar datos</button>
                    <!-- End: eliminarDeLaCestaButton -->
                </div>
            </div>
        </div>
    </div>
    <!-- End: 1 Row 2 Columns -->
    <!-- Start: 1 Row 1 Column -->
    <div>
        <div class="container">
            <div style="margin-bottom: 0px;">
                <h4>Nombre y apellidos:</h4><input class="border rounded border-dark shadow-sm" type="text" style="width: 619px;height: 43px;margin-top: 5px;"></div>
            <div style="margin-bottom: 47;margin-top: 30px;">
                <h4>Línea 1 de dirección:</h4><input class="border rounded border-dark shadow-sm" type="text" placeholder="  Calle y número, apartado de correos, nombre empresa" style="width: 619px;height: 43px;margin-top: 5px;"></div>
            <div style="margin-bottom: 47;margin-top: 30px;">
                <h4>Línea 2 de dirección:</h4><input class="border rounded border-dark shadow-sm" type="text" placeholder="  Apartamento, suite, unidad, edificio, piso, etc." style="width: 619px;height: 43px;margin-top: 5px;"></div>
            <div style="margin-bottom: 47;margin-top: 30px;">
                <h4>Ciudad:</h4><input class="border rounded border-dark shadow-sm" type="text" style="width: 619px;height: 43px;margin-top: 5px;"></div>
            <div style="margin-bottom: 47;margin-top: 30px;">
                <h4>Provincia/Región:</h4><input class="border rounded border-dark shadow-sm" type="text" style="width: 619px;height: 43px;margin-top: 5px;"></div>
            <div style="margin-bottom: 47;margin-top: 30px;">
                <h4>Código Postal:</h4><input class="border rounded border-dark shadow-sm" type="text" style="width: 619px;height: 43px;margin-top: 5px;"></div>
            <div style="margin-bottom: 47;margin-top: 30px;">
                <h4>Número de teléfono:</h4><input class="border rounded border-dark shadow-sm" type="text" style="width: 619px;height: 43px;margin-top: 5px;"></div>
            <div style="margin-bottom: 80px;margin-top: 30px;">
                <h4>NIF (Sólo para Canarias, Ceuta y Melilla):</h4><input class="border rounded border-dark shadow-sm" type="text" style="width: 619px;height: 43px;margin-top: 5px;"></div>
        </div>
    </div>
    <!-- End: 1 Row 1 Column -->
    <!-- Start: 1 Row 2 Columns -->
    <div>
        <div class="container">
            <div class="row" style="margin-top: -15px;margin-bottom: 56px;">
                <div class="col-md-6"></div>
                <div class="col-md-6 d-xl-flex justify-content-xl-end">
                    <!-- Start: eliminarDeLaCestaButton --><button class="btn btn-primary border rounded" type="button" style="margin-right: 0px;margin-left: 0px;width: 178px;background-color: rgb(85,85,85);height: 43px;margin-top: 8px;padding: 0px;"><i class="fas fa-chevron-circle-down float-left d-xl-flex justify-content-xl-end" style="padding-right: 9px;margin-right: -10px;margin-left: 4px;margin-top: 5px;width: 34px;"></i>Confirmar datos</button>
                    <!-- End: eliminarDeLaCestaButton -->
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
