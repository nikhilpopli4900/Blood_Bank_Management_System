<%-- 
    Document   : code1
    Created on : 15 Apr, 2020, 8:19:51 AM
    Author     : nikp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            td{
                padding: 20px;
            }
            .serif {
              font-family: "Times New Roman", Times, serif;
              font-size: 80px;
              color: white;
            }
            .f {
              font-family: "Times New Roman", Times, serif;
              font-size: 20px;
              color: red;
            }
            div.a{
                width: 100%;
                border: 0px solid darkblue;
                border-radius: 0px;
                background-color: rgb(200,20,10);
         
            }
            div.c{
                height: 80px;
                padding-right: 25px;
            }
            div.d{
                height: 30px;
            }
            div.q{
                width: 25%;
                
                border-radius: 5px;
                background-color: lightgrey;
            }
        </style>
    </head>
    <body>
    <div class="a"> <center><p class="serif"  >SaveLife Blood Bank</p></center> </div>
    <div class="c" align="right"><input class = "btn btn-danger" onclick="window.location.href='http://localhost:8080/Bbms/index.jsp'" type="submit" value="Home"></div>
    <center>
        <%
            String warn1 = request.getParameter("warning");
            if(warn1!=null){
        %>
        <p class="f"> <%=warn1%></p>
        <% } %>
        <h1>LOGIN</h1>
    </center>
    <center>
        <div class="q">
            <form action="login_f.jsp" method="POST">
                <table >
                        <tr>
                            <td>Email</td>
                            <td><input type="text" class="form-control" name="user" placeholder="email"></td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td><input type="password" class="form-control" name="pass" placeholder="password"></td>
                        </tr>
                        <tr>

                            <td colspan="2" style = "text-align: center" ><input class = "btn btn-success" type="submit" value="Login"></td>
                        </tr>
                </table>
            </form>
        </div>
    </center>
    <div class="d"></div>
    <center>
        <div>
            <p>Do not have an account?   </p>
            <input class = "btn btn-primary" onclick="window.location.href='http://localhost:8080/Bbms/signup.jsp'" type="submit" value="Signup">
        </div>
    </center>

    </body>
</html>

