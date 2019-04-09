<%-- 
    Document   : index2
    Created on : 04-abr-2019, 18:51:19
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    </head>

    <body>
        <!-- Start: Navigation with Button -->
        <%@include file="navbar.jsp" %>
        
        <!-- End: Navigation with Button -->
        <div class="carousel slide" data-ride="carousel" id="carousel-1">
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active"><img class="w-100 d-block" src="assets/img/1531303705_amazon-primeday-offer.jpg" alt="Slide Image" style="filter: blur(0px) brightness(95%) grayscale(0%) hue-rotate(0deg) invert(0%);margin: 0px;"></div>
                <!--            <div class="carousel-item"><img class="w-100 d-block" src="http://placeholdit.imgix.net/~text?txtsize=42&amp;txt=Carousel+Image&amp;w=1400&amp;h=600" alt="Slide Image"></div>
                            <div class="carousel-item"><img class="w-100 d-block" src="http://placeholdit.imgix.net/~text?txtsize=42&amp;txt=Carousel+Image&amp;w=1400&amp;h=600" alt="Slide Image"></div>-->
            </div>
            <div>
                <!-- Start: Previous --><a class="carousel-control-prev" href="#carousel-1" role="button" data-slide="prev"><span class="carousel-control-prev-icon"></span><span class="sr-only">Previous</span></a>
                <!-- End: Previous -->
                <!-- Start: Next --><a class="carousel-control-next" href="#carousel-1" role="button" data-slide="next"><span class="carousel-control-next-icon"></span><span class="sr-only">Next</span></a>
                <!-- End: Next -->
            </div>
            <ol class="carousel-indicators">
                <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-1" data-slide-to="1"></li>
                <li data-target="#carousel-1" data-slide-to="2"></li>
            </ol>
        </div>
        <!-- Start: Lista de Productos Destacados -->
        <div class="article-list">
            <div class="container" style="margin-top: 18px;">
                <!-- Start: Intro -->
                <div class="intro">
                    <h2 class="text-center" style="font-size: 47px;color: rgb(79,79,79);">Productos Destacados</h2>
                </div>
                <!-- End: Intro -->
                <!-- Start: Articles -->
                <div class="row articles" style="margin-top: -41px;">
                    <div class="col-sm-6 col-md-4 item"><a href="#"><img class="img-fluid" src="assets/img/desk.jpg"></a>
                        <h3 class="name">Article Title</h3>
                        <p class="description">Aenean tortor est, vulputate quis leo in, vehicula rhoncus lacus. Praesent aliquam in tellus eu gravida. Aliquam varius finibus est, interdum justo suscipit id.</p><a href="#" class="action"></a>
                        <form action="FrontController">
                            <input type="hidden" name="command" value="ReadProductCommand">
                            <input type="hidden" name="idproducto" value="3">
                            <button type="submit">
                                <i class="fa fa-arrow-circle-right" style="color: #56c6c6;"></i>
                            </button>
                        </form>
                    </div>
                    <div
                        class="col-sm-6 col-md-4 item"><a href="#"><img class="img-fluid" src="assets/img/building.jpg"></a>
                        <h3 class="name">Article Title</h3>
                        <p class="description">Aenean tortor est, vulputate quis leo in, vehicula rhoncus lacus. Praesent aliquam in tellus eu gravida. Aliquam varius finibus est, interdum justo suscipit id.</p><a href="#" class="action"></a>
                        <form action="FrontController">
                            <input type="hidden" name="command" value="ReadProductCommand">
                            <input type="hidden" name="idproducto" value="2">
                            <button type="submit">
                                <i class="fa fa-arrow-circle-right" style="color: #56c6c6;"></i>
                            </button>
                        </form>
                    </div>
                    <div
                        class="col-sm-6 col-md-4 item"><a href="#"><img class="img-fluid" src="assets/img/loft.jpg"></a>
                        <h3 class="name">Article Title</h3>
                        <p class="description">Aenean tortor est, vulputate quis leo in, vehicula rhoncus lacus. Praesent aliquam in tellus eu gravida. Aliquam varius finibus est, interdum justo suscipit id.</p><a href="#" class="action"></a>
                        <form action="FrontController">
                            <input type="hidden" name="command" value="ReadProductCommand">
                            <input type="hidden" name="idproducto" value="1">
                            <button type="submit">
                                <i class="fa fa-arrow-circle-right" style="color: #56c6c6;"></i>
                            </button>
                        </form>
                    </div>
                </div>
                <!-- End: Articles -->
            </div>
        </div>
        <!-- End: Lista de Productos Destacados -->
        <!-- Start: Footer Dark -->
        <div class="footer-dark" style="margin-top: 70px;">
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
