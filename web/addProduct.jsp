<%-- 
    Document   : addProduct
    Created on : 09-abr-2019, 13:22:17
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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
    </head>

    <body>
        <!-- Start: Navigation with Button -->
        <%@include file="navbar.jsp" %>
        <!-- End: Navigation with Button -->
        <!-- Start: 1 Row 2 Columns -->
        <form action="FrontController" method="POST" enctype="multipart/form-data" >
            <div>
                <div class="container">
                    <div class="row" style="margin-top: 25px;margin-bottom: 56px;">
                        <div class="col-md-6">
                            <!-- Start: NombreProducto -->
                            <h1 style="margin-top: 0px;">Añadir nuevo producto</h1>
                            <!-- End: NombreProducto -->
                        </div>
                        <div class="col-md-6 d-xl-flex justify-content-xl-end">                    
                            <!-- End: eliminarDeLaCestaButton -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- End: 1 Row 2 Columns -->
            <!-- Start: 1 Row 2 Columns -->
            <div>
                <%
                    Usuario user = (Usuario) session.getAttribute("usuario");
                    long idVendedor = user.getId();
                %>

                <input type="hidden" placeholder="id del vendedor" name="idvendedor" value="<%=idVendedor%>" required>                        
                <input type="hidden" name="command" value="AddProductCommand">                    

                <div class="container">
                    <div class="row" style="margin-bottom: 70px;">
                        <div class="col-md-6">
                            <!-- Start: ImagenProducto --><img id="profile-img-tag" src="" style="width: 380px;margin-top: 0px;margin-left: 48px;">
                            <!-- End: ImagenProducto -->
                            <div style="margin-bottom: 0px;">
                                <div class="btn-group" role="group" style="margin-top: 35px;margin-left: 54px;">
                                    <div class="fileUpload btn btn-danger border rounded" style="margin-right: 11px;margin-left: 6px;width: 177px;background-color: rgb(85,85,85);">
                                        <span><i class="material-icons float-left" style="padding-right: 9px;margin-right: -11px;margin-left: 4px;">file_upload</i> Sube una imagen</span>
                                        <input type="file" class="upload" name="file" id="profile-img">
                                    </div>
                                    <script type="text/javascript">
                                        function readURL(input) {
                                            if (input.files && input.files[0]) {
                                                var reader = new FileReader();

                                                reader.onload = function (e) {
                                                    $('#profile-img-tag').attr('src', e.target.result);
                                                }
                                                reader.readAsDataURL(input.files[0]);
                                            }
                                        }
                                        $("#profile-img").change(function () {
                                            readURL(this);
                                        });
                                    </script>                                   
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6" style="margin: 0px;">
                            <div style="margin-bottom: 0px;">                        
                                <h4>Nombre del Producto:</h4><input class="border rounded border-dark shadow-sm" name="nombre" type="text" style="width: 475px;height: 43px;margin-top: 5px;" required></div>
                            <div style="margin-bottom: 47;margin-top: 30px;">                        
                                <h4>Descripción del producto:</h4><textarea class="border rounded border-dark form-control-lg" name="descripcion" style="height: 200px;width: 475px;margin-top: 5px;"></textarea></div>
                            <div style="margin-bottom: 47;margin-top: 30px;">                        
                                <h4>Precio (€):</h4><input class="border rounded border-dark shadow-sm" type="text" name="precio" style="width: 364px;height: 43px;margin-top: 5px;"></div>
                            <!--                    <div style="margin-bottom: 72;margin-top: 30px;">
                                                    <h4>Restricciones de envío:</h4><select style="width: 364px;"><option value="0" selected="">Sin restricciones</option><option value="1">No se envía a las Islas Canarias</option><option value="2">No se envía ni a las Islas Canarias ni a las Islas Baleares </option></select></div>-->
                        </div>
                    </div>
                </div>
            </div>
            <!-- End: 1 Row 2 Columns -->
            <!-- Start: 1 Row 2 Columns -->
            <div>
                <div class="container">
                    <div class="row" style="margin-top: -15px;margin-bottom: 56px;">
                        <div class="col-md-6"></div>
                        <div class="col-md-6 d-xl-flex justify-content-xl-end" style="margin-top: 39px;">
                            <!-- Start: eliminarDeLaCestaButton --><button class="btn btn-primary border rounded" type="button" style="margin-right: 22px;margin-left: 0px;width: 113px;background-color: rgb(169,41,41);height: 43px;margin-top: 8px;padding: 0px;"><i class="icon ion-close float-left d-xl-flex justify-content-xl-end" style="padding-right: 9px;margin-right: -17px;margin-left: 1px;margin-top: 5px;width: 34px;"></i>Cancelar</button>
                            <!-- End: eliminarDeLaCestaButton -->
                            <!-- Start: eliminarDeLaCestaButton --><button class="btn btn-primary border rounded" type="submit" style="margin-right: 0px;margin-left: 0px;width: 178px;background-color: rgb(85,85,85);height: 43px;margin-top: 8px;padding: 0px;"><i class="fas fa-chevron-circle-down float-left d-xl-flex justify-content-xl-end" style="padding-right: 9px;margin-right: -14px;margin-left: 9px;margin-top: 5px;width: 34px;"></i>Crear producto</button>
                            <!-- End: eliminarDeLaCestaButton -->
                        </div>
                    </div>
                </div>
            </div>
        </form>
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
