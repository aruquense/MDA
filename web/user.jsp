<%-- 
    Document   : product
    Created on : 04-abr-2019, 19:10:19
    Author     : sergio
--%>

<%@page import="modelo.ComentarioUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="command.HandlerBDD"%>
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
        <%Usuario user = null;
            user = (Usuario) request.getAttribute("user");
            long idvendedor = Long.parseLong(request.getParameter("idUser"));
            Usuario usuario = (Usuario) session.getAttribute("usuario");

            Double valoracion = Double.parseDouble(request.getParameter("valoracion"));
            if (request.getParameter("valoracion").equals("NaN")) {
                valoracion = 0.;
            }
        %>
        <div class="container">
            <!-- Start: NombreUsuario -->

            <h1 style="margin-top: 30px;"><%= request.getParameter("nombre")
                %>                 

                        
                       
  
                        
            <!-- End: NombreUsuario -->
        </div>
        <!-- Start: 1 Row 2 Columns -->
        <div style="margin-top: 13px;margin-bottom: 95px;">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-xl-0" style="margin-left: -30px;"><img src="<%= request.getParameter("img")%>" style="height: 200px;width: 200px;margin-bottom: 0px;margin-top: 5px;margin-right: 0px;"></div>
                    <!--<div class="col-md-6 offset-xl-0" style="margin-left: -30px;"><img src=<%= request.getParameter("img")%> style="width: 444px;margin-bottom: 0px;margin-top: 5px;margin-right: 0px;"></div>-->
                    <div class="col-md-6">
                        <!-- Start: DescripcionLabel -->
                        <h3 class="text-left" style="margin-top: 10px;">Localización:</h3>
                        <!-- End: DescripcionLabel -->
                        <!-- Start: DescripcionParrafo -->
                        <p class="text-justify" style="margin-top: 20px;"><%= valoracion%><i class="fa fa-star float-none" style="color: rgb(169,41,41);"></i></p>
                        <!-- End: DescripcionParrafo -->
                        <p style="font-style: italic;font-size: 15px;margin-top: 25px;">Este usuario no se puede enviar a Canarias xD</p>
                        <!-- Start: EtiquetaPrecio -->
                        <h3 class="text-left" style="margin-top: 35px;">valoracion: &nbsp;</h3>
                        <!-- End: EtiquetaPrecio -->
                        <!-- Start: Valor del Precio -->
                        <p style="font-style: italic;font-size: 15px;margin-top: 25px;"><%= request.getParameter("valoracion")%></p>
                        <p style="font-style: italic;font-size: 15px;margin-top: 25px;">                    


                        <form action="FrontController" method="POST" enctype="multipart/form-data" >

                            <input type="hidden" placeholder="nombre" name="nombre" value="<%= request.getParameter("nombre")%>" >

                            0<input type="range" name="puntuacion" min="0" max="10" value="5">

                            10<input type="hidden" name="command" value="ScoreUserCommandwithName">

                            <input type="submit" value="Puntuar usuario"><br><br>
                        </form></p>

                        <!-- End: Valor del Precio -->
                        <h3 class="text-left" style="margin-top: 35px;">nvisitas &nbsp;</h3>
                        <p style="font-style: italic;font-size: 15px;margin-top: 25px;"><%= request.getParameter("nvisitas")%></p>
                        <h3 class="text-left" style="margin-top: 35px;">nvaloraciones &nbsp;</h3>
                        <p style="font-style: italic;font-size: 15px;margin-top: 25px;"><%= request.getParameter("nvaloraciones")%></p>                                        
                    </div>
                </div>

                <hr>                
                <h1>Comentarios hacia este usuario</h1>
                <div class="container" style="margin-bottom: 85px;">
                    <%
                        HandlerBDD handler = new HandlerBDD();
                        ArrayList<ComentarioUsuario> comentarios = handler.readCommentsFromUser(idvendedor);
                        for (ComentarioUsuario comentario : comentarios) {
                            String texto = comentario.getComentario();
                            Usuario usuarioComentario = handler.getUsuarioByID(comentario.getIdusuario());
                            String nombreUsuario = usuarioComentario.getNombre();
                            long idUsuarioComentario = comentario.getIdusuario();
                            %>
                    <div class="border rounded" style="margin-top: 19px;margin-bottom: 30px;background-color: rgba(187,187,187,0.17);height: 175px;">
                    <%if (usuario != null && usuario.getId() == idUsuarioComentario) {%>                    
                        <form action="FrontController" id="deleteForm+<%=comentario.getId()%>">
                            <input type="hidden" name="idComment" value="<%=comentario.getId()%>">
                            <input type="hidden" name="command" value="DeleteCommentUserCommand"> 
                        </form>                          
                        <form action="editCommentUser.jsp" id="editForm+<%=comentario.getId()%>">
                            <input type="hidden" name="idComment" value="<%=comentario.getId()%>">
                            <input type="hidden" name="message" value="<%=comentario.getComentario()%>"> 
                        </form>       
                        <div class="btn-group btn-group-sm" role="group" style="margin-top: -5px;margin-right: -329px;">
                            <button class="btn btn-primary border rounded" type="submit" form="editForm+<%=comentario.getId()%>" style="margin-right: 7px;background-color: rgb(111,111,111);"><i class="fa fa-edit" style="margin-right: 7px;"></i>Editar</button>
                            <button class="btn btn-primary border rounded" type="submit" form="deleteForm+<%=comentario.getId()%>" style="background-color: rgb(169,41,41);"><i class="icon ion-android-delete" style="margin-right: 6px;"></i>Eliminar</button>
                        </div>
                        <%}%>

                        <div class="text-right d-xl-flex justify-content-xl-end" style="width: 762px;margin-bottom: -49px;margin-top: 18px;">
                            <!-- Start: BotonesDeEdición/Borrado -->
                            <div class="btn-group btn-group-sm" role="group" style="margin-top: -5px;margin-right: -329px;"></div>
                            <!-- End: BotonesDeEdición/Borrado -->
                        </div><img class="rounded-circle shadow-sm" style="width: 93px;margin-top: 47px;margin-left: 34px;padding-top: 8px;" src="assets/img/imagen_perfil.jpg">
                        <p style="margin-top: -85px;margin-left: 186px;margin-bottom: 32px;"><label class="d-xl-flex justify-content-xl-start" style="margin-top: -4px;padding-right: 0px;margin-left: 37px;width: 680px;"><%=texto%></label><br></p>
                        <!-- Start: NombreDelUsuario --><label class="d-xl-flex align-items-xl-start" style="margin-left: 30px;margin-top: 38px;padding-right: 1px;margin-right: 962px;"><%=nombreUsuario%></label>
                        <!-- End: NombreDelUsuario -->
                    </div>
                    <%}%>
                </div>
            </div>
            <%if (usuario != null) {%>
            <div class="container" style="margin-bottom: 85px;">
                <h1>Escribir comentario</h1>                
                <!-- Start: ComentarioDeUnUsuario -->
                <div class="border rounded" style="margin-top: 19px;margin-bottom: 30px;background-color: rgba(187,187,187,0.17);height: 198px;">
                    <!-- Start: textArea -->
                    <form action="FrontController" id="commentForm">                            
                        <div style="margin-top: 18px;margin-left: 15px;"><textarea class="border rounded d-xl-flex justify-content-xl-center" name="comentario" style="width: 1030px;margin-left: 21px;height: 119px;margin-top: 2px;" form="commentForm"></textarea>
                        <!-- Start: button -->                        
                            <input type="hidden" name="idvendedor" value=<%=idvendedor%>>
                            <input type="hidden" name="idusuariocomentando" value=<%=usuario.getId()%>>
                            <input type="hidden" name="command" value="ComentarUsuario">
                            <br>
                            <button type="submit"  class="btn btn-primary border rounded" style="background-color: rgb(169,41,41); height: 58px;width: 150px">
                                <i class="material-icons float-right" style="">user_comment</i>Comentar
                            </button>
                        </form>                        
                        <!-- End: button -->
                    </div>
                    <!-- End: textArea -->
                </div>
                <!-- End: ComentarioDeUnUsuario -->
            </div>                                
            <%}%>
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
