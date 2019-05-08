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
                <div class="container"><a class="navbar-brand" href="index.jsp">CompraVENTA</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
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
                            <div class="container">
                                    <div class="row">
                                        <div class="col-md-24">
                                        <div class="input-group" id="adv-search">
                                            <form action="FrontController" class="form-inline">
                                                <input type="hidden" name="command" value="SearchCommand">
                                                <input type="text" name="busqueda" class="form-control" placeholder="Buscar productos y usuarios" />
                                                <button type="submit" class="btn btn-primary"><span class="fas fa-search" aria-hidden="true"></span></button>
                                            </form>
                                            <div class="input-group-btn">
                                                <div class="btn-group" role="group">
                                                    <div class="dropdown dropdown-lg">
                                                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></button>
                                                        <div class="dropdown-menu dropdown-menu-right" role="menu">
                                                            <form action="FrontController" class="form-horizontal" role="form">
                                                            <input type="hidden" name="command" value="AdvancedSearchCommand">
                                                              <div class="form-group">
                                                                <div class="form-group">
                                                                <label for="contain">Búsqueda avanzada</label>
                                                                <input type="text" name="busqueda" class="form-control" placeholder="Buscar productos y usuarios" />
                                                              </div>  
                                                                <label for="filter">Categoría</label>
                                                                <select class="form-control" name="categoria">
                                                                    <option value="Todo" selected>Todas las categorías</option>
                                                                    <option value="Ocio">Ocio</option>
                                                                    <option value="Hogar">Hogar</option>
                                                                </select>
                                                              </div>
                                                              <div class="form-group">
                                                                <label for="contain">Precio mínimo</label>
                                                                    <div class="slidecontainer">
                                                                      <input type="range" name="precioMin" min="0" max="500" value="0" class="slider" id="myRange">
                                                                      <span id="demo" style="font-weight:bold;color:blue">62</span>
                                                                    </div>
                                                                <script>
                                                                    var slider = document.getElementById("myRange");
                                                                    var output = document.getElementById("demo");
                                                                    output.innerHTML = slider.value; // Display the default slider value
                                                                    //
                                                                    // Update the current slider value (each time you drag the slider handle)
                                                                    slider.oninput = function() {
                                                                      slider2.min = slider.value;
                                                                      output.innerHTML = this.value;
                                                                    } 
                                                                </script>
                                                              </div>
                                                              <div class="form-group">
                                                                <label for="contain">Precio máximo</label>
                                                                    <div class="slidecontainer">
                                                                      <input type="range" name="precioMax" min="0" max="500" value="500" class="slider" id="myRange2">
                                                                      <span id="demo2" style="font-weight:bold;color:red">62</span>
                                                                    </div>
                                                                <script>
                                                                    var slider2 = document.getElementById("myRange2");
                                                                    var output2 = document.getElementById("demo2");
                                                                    output2.innerHTML = slider2.value; // Display the default slider value
                                                                    //output.innerHTML = slider2.value;
                                                                    
                                                                    // Update the current slider value (each time you drag the slider handle)
                                                                    slider2.oninput = function() {
                                                                      output2.innerHTML = this.value;
                                                                      slider.max = slider2.value;
                                                                      output.innerHTML = slider.value;
                                                                    } 
                                                                </script>
                                                              </div>
                                                              <button type="submit" class="btn btn-primary"><span class="fas fa-search" aria-hidden="true"></span></button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                      </div>
                                    </div>
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
        