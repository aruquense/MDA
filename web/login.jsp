<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>    
</head>
<!------ Include the above in your HEAD tag ---------->

<body>
    <%@include file="navbar.jsp" %>
    <form action="FrontController" method="POST" enctype="multipart/form-data" >
            <input type="hidden" name="command" value="LoginCommand">                                                
    <div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="" method="post">
                            <h3 class="text-center text-info">Login</h3>
                            <div class="form-group">                                            
                                <label for="username" class="text-info">Username:</label><br>
                                <input type="text" name="userName" value="" required class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="password" name="password" value="" required class="form-control">
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
</body>
</html>