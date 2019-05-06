<%-- 
    Document   : editComment
    Created on : 05-may-2019, 17:29:22
    Author     : orlan
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
    <div class="container">
        <!-- Start: NombreProducto -->
        <h1 style="margin-top: 30px;">Editar comentario</h1>
        <!-- End: NombreProducto -->
    </div>    
    <!-- Start: Escribir comentario -->
    <%
        String comment = request.getParameter("message");
        int idMessage = Integer.parseInt(request.getParameter("idComment"));
    %>
    <form action="FrontController" id="formEdit">
        <input type="hidden" name="idMessage" value="<%=idMessage%>">
        <input type="hidden" name="command" value="EditCommentCommand"> 
        
    </form>
    <div class="container" style="margin-bottom: -57px;">
        <!-- Start: ComentarioDeUnUsuario -->
        <div class="border rounded" style="margin-top: 22px;margin-bottom: 336px;background-color: rgba(187,187,187,0.17);height: 299px;">
            <!-- Start: textArea -->
            <div style="margin-top: 18px;margin-left: 15px;"><textarea class="border rounded d-xl-flex justify-content-xl-center" name="comment" form="formEdit" style="width: 1030px;margin-left: 21px;height: 215px;margin-top: 2px;"><%=comment%></textarea>
                <!-- Start: button -->
                <div class="text-right d-xl-flex justify-content-xl-end" style="width: 762px;margin-bottom: -49px;margin-top: 9px;">
                    <!-- Start: BotonesDeEdición/Borrado -->
                    <div class="btn-group btn-group-sm d-xl-flex justify-content-xl-end" role="group" style="margin-top: -5px;margin-right: -329px;margin-left: 21px;"><button class="btn btn-primary border rounded" type="submit" form="formEdit" style="background-color: rgb(41,154,169);margin-right: 38px;margin-top: 11px;"><i class="fas fa-check-circle" style="margin-right: 6px;"></i>Guardar</button></div>
                    <!-- End: BotonesDeEdición/Borrado -->
                </div>
                <!-- End: button -->
            </div>
            <!-- End: textArea -->
        </div>
        <!-- End: ComentarioDeUnUsuario -->
    </div>
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
