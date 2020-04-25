<%-- 
    Document   : index
    Created on : 24 Apr, 2020, 12:47:52 PM
    Author     : nikp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <title>SaveLife Blood Bank</title>
        <style>
            .serif {
              font-family: "Times New Roman", Times, serif;
              font-size: 80px;
              color: white;
            }

            .sansserif {
              font-family: Arial, Helvetica, sans-serif;
              font-size: 30px;
            }

            .monospace {
              font-family: "Lucida Console", Courier, monospace;
            }
            div.a{
                width: 100%;
                border: 0px solid darkblue;
                border-radius: 0px;
                background-color: rgb(200,20,10);
         
            }
            div.b{
                width: 100%;
                padding-right: 25px;
                borde: 0px;
                background-color: rgba(255,0,0,0.2);
            }
        </style>
    </head> 
    <body>
        <div class="a"> <center><p class="serif"  >SaveLife Blood Bank</p></center> </div>
        <div class="b" align="right">
            <table >
                       
                        <tr>

                            <td colspan="2" style = "text-align: center" ><input class = "btn btn-primary" type="button" onclick="window.location.href='http://localhost:8080/Bbms/login.jsp'" value="Login" ></td>
                            <td colspan="2" style = "text-align: center" ><input class = "btn btn-primary" type="button" onclick="window.location.href='http://localhost:8080/Bbms/signup.jsp'" value="Signup"></td>
                        </tr>
            </table>
        </div>
       <%
        String warn2= (String)session.getAttribute("message1");
        session.setAttribute("message1",null);
        if(warn2!=null)
        if(warn2.length()!=0){
        %>
    <center>
        <p class="sansserif"><%=warn2%></p>
        <%}%>
    </center>
    </body>
</html>
