<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    
    </head>
    <!------ Include the above in your HEAD tag ---------->

    <body>
        <%@include file="navbar.jsp" %>
        <form action="FrontController" method="POST" name="RegForm" onsubmit="return validate()">
            <input type="hidden" name="command" value="RegisterUserCommand">                                                
            <div id="login">
                <h3 class="text-center text-white pt-5">Login form</h3>
                <div class="container">
                    <div id="login-row" class="row justify-content-center align-items-center">
                        <div id="login-column" class="col-md-6">
                            <div id="login-box" class="col-md-12">
                                <form id="login-form" class="form" action="" method="post">
                                    <h3 class="text-center text-info">Registra tu usuario</h3>
                                    <div class="form-group">                                            
                                        <label for="user" class="text-info">Usuario:</label><br>
                                        <input type="text" name="user" value="" required class="form-control">
                                    </div>
                                    <div class="form-group">                                            
                                        <label for="userConfirm" class="text-info">Confirma tu usuario:</label><br>
                                        <input type="text" name="userConfirm" value="" required class="form-control">
                                    </div>
                                    <div class="form-group">                                            
                                        <label for="email" class="text-info">Email: </label><br>
                                        <input type="text" name="email" value="" required class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="text-info">Contraseña:</label><br>
                                        <input type="password" name="password" value="" required class="form-control">
                                    </div>                            
                                    <div class="form-group">
                                        <label for="passwordConfirm" class="text-info">Confirma tu contraseña: </label><br>
                                        <input type="password" name="passwordConfirm" value="" required class="form-control">
                                    </div>                            
                                    <div class="form-group">
                                        <label for="localizacion" class="text-info">Indique su dirección de envío:</label><br>
                                        <input type="text" name="localizacion" value="" required class="form-control">
                                    </div>                            
                                    <div class="form-group">                                
                                        <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <script>
            function validate()
            {
                var name = document.forms["RegForm"]["user"];
                var nameConfirm = document.forms["RegForm"]["userConfirm"];
                var email = document.forms["RegForm"]["email"];
                var password = document.forms["RegForm"]["password"];
                var passwordConfirm = document.forms["RegForm"]["passwordConfirm"];

                if (name.value == "")
                {
                    window.alert("Please enter your name.");
                    name.focus();
                    return false;
                }
                if (name.value != nameConfirm.value) {
                    window.alert("Name user are different.");
                    nameConfirm.focus();
                    name.focus();
                    return false;
                }
                if (nameConfirm.value == "")
                {
                    window.alert("Please enter your name.");
                    nameConfirm.focus();
                    return false;
                }
                if (email.value == "")
                {
                    window.alert("Please enter a valid e-mail address.");
                    email.focus();
                    return false;
                }

                if (email.value.indexOf("@", 0) < 0)
                {
                    window.alert("Please enter a valid e-mail address.");
                    email.focus();
                    return false;
                }

                if (email.value.indexOf(".", 0) < 0)
                {
                    window.alert("Please enter a valid e-mail address.");
                    email.focus();
                    return false;
                }

                if (password.value == "")
                {
                    window.alert("Please enter your password");
                    password.focus();
                    return false;
                }
                if (passwordConfirm.value == "")
                {
                    window.alert("Please enter your password");
                    passwordConfirm.focus();
                    return false;
                }
                if (password.value != passwordConfirm.value) {
                    window.alert("Passwords are different");
                    password.focus();
                    passwordConfirm.focus();
                    return false;
                }

                return true;
            }</script> 
    </body>
</html>