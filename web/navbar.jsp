<%@page import="modelo.Usuario"%>
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
<div>
            <nav class="navbar navbar-light navbar-expand-md navigation-clean-button">
                <div class="container"><a class="navbar-brand" href="index2.jsp">CompraVENTA</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse"
                         id="navcol-1">
                        <ul class="nav navbar-nav mr-auto">
                            <%
                                Usuario userNav = (Usuario) session.getAttribute("usuario");
                                if(userNav!=null){
                                    long idUser = userNav.getId();
                            %>
                            <li class="nav-item" role="presentation"><a class="nav-link" href="myorder.jsp">Mis pedidos</a></li>                            
                            <li class="nav-item" role="presentation"><a class="nav-link" href="addProduct.jsp">Añadir una venta</a></li>                            
                            <%}%>
                            <li class="nav-item" role="presentation">
                                <div class="container h-100">
                                    <div class="d-flex justify-content-center h-100">
                                        <form action="FrontController">
                                            <div class="searchbar">
                                                <input type="hidden" name="command" value="SearchProductCommand">
                                                <input class="search_input" type="text" name="producto" placeholder="Busca un producto...">
                                                <a href="#" class="search_icon"><i class="fas fa-search"></i></a>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </li>
                            <%if(userNav!=null){%>
                        </ul><span class="navbar-text actions"><a class="btn btn-light action-button" role="button" href="unlogin.jsp">Cerrar sesión</a></span></div>
                    <%}else{%>
                        </ul><span class="navbar-text actions"> <a href="login.jsp" class="login">Inicia sesión</a><a class="btn btn-light action-button" role="button" href="register.jsp">Registrate</a></span></div>
                    <%}%>
                </div>
            </nav>
        </div>