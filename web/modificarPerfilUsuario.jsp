<%-- 
    Document   : modificarPerfilUsuario
    Created on : 09-abr-2019, 13:23:00
    Author     : Sergio
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
    <%@include file="navbar.jsp" %>
    <!-- End: Navigation with Button -->        
    <%Usuario usuario = (Usuario) session.getAttribute("usuario");

        %>
    <!-- Start: 1 Row 2 Columns -->
    <form action="FrontController" method="POST" enctype="multipart/form-data" >
    <div>
        <div class="container">
            <div class="row" style="margin-top: 25px;margin-bottom: 56px;">
                <div class="col-md-6">
                    <!-- Start: NombreProducto -->
                    <h1 style="margin-top: 0px;">Modificar perfil</h1>
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
        <div class="container">
            <div class="row" style="margin-bottom: 70px;">
                <div class="col-md-6">
                    <!-- Start: ImagenProducto --><img class="img-thumbnail border rounded-circle border-dark shadow" src="assets/img/imagen_perfil.jpg" style="width: 402px;margin-top: 0px;margin-left: 47px;background-color: rgb(169,41,41);">
                    <!-- End: ImagenProducto -->
                    <div style="margin-bottom: 0px;">
                        <div class="btn-group" role="group" style="margin-top: 35px;margin-left: 54px;"><button class="btn btn-primary border rounded" type="button" style="margin-right: 11px;margin-left: 0px;width: 193px;background-color: rgb(169,41,41);height: 58px;"><i class="icon ion-close float-left" style="padding-right: 9px;margin-right: -18px;margin-left: 12px;"></i>Eliminar Imagen</button>
                            <button
                                class="btn btn-primary border rounded" type="button" style="margin-right: 11px;margin-left: 6px;width: 177px;background-color: rgb(85,85,85);"><i class="material-icons float-left" style="padding-right: 9px;margin-right: -11px;margin-left: 4px;">file_upload</i>Subir Imagen</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-6" style="margin: 0px;">
                    <div style="margin-bottom: 0px;">
                        <strong><h4>Todos los campos han de ser cumplimentados</h4></strong>
                     <div style="margin-bottom: 0px;">
                        <h4>Nombre:</h4>
                        <input class="border rounded border-dark shadow-sm" type="text" placeholder="nombre" name="nombre"  value="<%= usuario.getNombre()%>" required style="width: 475px;height: 43px;margin-top: 5px;"></div>
                        
                        
                        
                    <div style="margin-bottom: 0px;">
                        <h4 style="margin-top: 25px;">Ubicación:</h4>
                        <input class="border rounded border-dark shadow-sm" type="text" placeholder="Ubicación" name="localizacion" value="<%= usuario.getLocalizacion()%>" required style="width: 475px;height: 43px;margin-top: 5px;"></div>
                    <div style="margin-bottom: 0px;">
                        <h4 style="margin-top: 25px;">Correo:</h4>
                        <input class="border rounded border-dark shadow-sm" type="text" placeholder="Correo" name="correo" value="<%= usuario.getCorreo()%>" required style="width: 475px;height: 43px;margin-top: 5px;"></div>
                    <div style="margin-bottom: 0px;">
                        <h4 style="margin-top: 25px;">Contraseña:</h4>
                        <input class="border rounded border-dark shadow-sm" type="password" placeholder="Contraseña" name="contrasena" value="" required style="width: 475px;height: 43px;margin-top: 5px;"></div>
                    <div style="margin-bottom: 0px;">
                        <h4 style="margin-top: 25px;">Repita contraseña:</h4>
                        <input class="border rounded border-dark shadow-sm" type="password" placeholder="Repita Contraseña" name="contrasena2" value="" required style="width: 475px;height: 43px;margin-top: 5px;"></div>
                        
                        
                        
                    <div style="margin-bottom: 0px;">
                        <h4 style="margin-top: 25px;">Opciones de privacidad:</h4>
                        <div style="margin-bottom: 47;margin-top: 15px;margin-left: 9px;">
                            <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-1"><label class="form-check-label" for="formCheck-1">Mostrar ubicación</label></div>
                            <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-1"><label class="form-check-label" for="formCheck-1">Mostrar visitas al perfil</label></div>
                            <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-1"><label class="form-check-label" for="formCheck-1">Mostrar valoraciones</label></div>
                            <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-1"><label class="form-check-label" for="formCheck-1">Mostrar productos a la venta</label></div>
                            <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-1"><label class="form-check-label" for="formCheck-1">Mostrar productos vendidos</label></div>
                        </div>
                    </div>
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
                    <!-- Start: eliminarDeLaCestaButton --><button  onclick="window.history.back()" class="btn btn-primary border rounded" type="button" style="margin-right: 22px;margin-left: 0px;width: 126px;background-color: rgb(169,41,41);height: 43px;margin-top: 8px;padding: 0px;"><i class="icon ion-close float-left d-xl-flex justify-content-xl-end" style="padding-right: 9px;margin-right: -12px;margin-left: 2px;margin-top: 4px;width: 34px;"></i>Volver</button>
                    <!-- End: eliminarDeLaCestaButton -->
                    <!-- Start: eliminarDeLaCestaButton -->
                    
                    <input type="hidden" placeholder="id" name="idUser" value="<%= usuario.getId()%>" required>
            <input type="hidden" name="command" value="UpdateUserCommand">
            <input value="Confirmar datos" class="btn btn-primary border rounded" type="submit" style="margin-right: 0px;margin-left: 0px;width: 178px;background-color: rgb(85,85,85);height: 43px;margin-top: 8px;padding: 0px;"><i class="fas fa-chevron-circle-down float-left d-xl-flex justify-content-xl-end" style="padding-right: 9px;margin-right: -10px;margin-left: 4px;margin-top: 5px;width: 34px;"></i></input>
                    
            
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
