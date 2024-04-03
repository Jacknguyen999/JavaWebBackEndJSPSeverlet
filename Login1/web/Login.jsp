<%-- 
    Document   : Login
    Created on : Mar 29, 2024, 2:22:24 PM
    Author     : tienanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Web</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    </head>
    <body>
        <div class = "center">
            <h1>Login Form</h1>
        
        <%
            if(request.getAttribute("error")!=null){
                String er =(String) request.getAttribute("error");
            %>
            <h3  Style="color: red; text-align :center ">
                <%= er %></h3>
            <%
            }
            %>
            <form action="login" method="POST" onsubmit="handleFormSubmit(Event)">
            <div class="text">
                <input id="" type="text" name="user">
                <label>Username</label>
            </div>
            <div class="text">
                <input id="password" type="password" name="pass">
                <label for="password">Password</label>
                <span class="password-toggle-icon"><i id="show-pwd-btn" class="fas fa-eye"></i></span>
            </div>
        <div class="pass">
                    <a href="https://code.ptit.edu.vn/password/reset" >
                        Quên Mật Khẩu?
                    </a> 
                </div>
                <div class="signup">
                    Chưa có tài khoản? <a href="register.jsp" >Đăng kí </a>
                </div>
            
            <input class="login" type="submit" value="login">
            </div>
        </form>
    </body>
<script src="login.js"></script>
</html>
