<%-- 
    Document   : admin_dash
    Created on : 25 Apr, 2020, 5:52:10 AM
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
            }

            .m {
              font-family: "Lucida Console", Courier, monospace;
              font-size:20px;
              color: blue;
            }
            .g{
                font-family: Arial, Helvetica, sans-serif;
                color:green;
               
                
            }
           
            .hed1{
                font-family: Arial, Helvetica, sans-serif;
                color:black;
                 font-size:35px;
                padding-left: 30px;
                padding-top: 15px;
            }
            .hed2{
                font-family: Arial, Helvetica, sans-serif;
                color:black;
                 font-size:25px;
                padding-left: 30px;
                padding-top: 15px;
            }
            .par{
                font-family: Arial, Helvetica, sans-serif;
                color:black;
                font-size:19px;
                padding-left: 30px;
                padding-right: 30px;
                padding-top: 3px;
            }
            .myc{
                font-family: Arial, Helvetica, sans-serif;
                color:black;
                font-size:19px;
                padding-left: 30px;
                padding-right: 30px;
                padding-top: 3px;
            }
            .red{
                font-family: Arial, Helvetica, sans-serif;
                color:red;
                font-size:19px;
                padding-left: 45px;
                padding-top: 1px;
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
                padding-top:6px;
                padding-bottom:1px;
                border: 0px;
                background-color: rgba(255,0,0,0.2);
            }
            div.part{
                width:100%;
                height :20px;
                padding-top:6px;
                padding-bottom:20px;
                border: 0px;
                background-color: rgba(255,0,0,0.2);
            }
            div.q{
                width: 50%;
                
                border-radius: 25px;
                background-color: rgba(0,0,0,0.17);
                padding: 10px;
            }
        </style>
    </head> 
    <body>
        <div class="a"> <center><p class="serif"  >SaveLife Blood Bank</p></center> </div>
        <div class="b" align="right">
           <table><tr>
                   <td> <p class="myc"> Welcome ADMIN</p></td>
                            <td><input class = "btn btn-primary" type="button" onclick="window.location.href='http://localhost:8080/Bbms/log_out.jsp'" value="Logout" ></td>
                
                </tr></table>
        </div>
        <%
        String warn= (String)session.getAttribute("new_message");
        session.setAttribute("new_message",null);
        if(warn!=null)
        if(warn.length()!=0){
        %>
    <center>
        <p class="g"><%=warn%></p>
        <%}%>
    </center>
    <%
        String warn2= (String)session.getAttribute("warning1");
        session.setAttribute("warning1",null);
        if(warn2!=null)
        if(warn2.length()!=0){
        %>
    <center>
        <p class="red"><%=warn2%></p>
        <%}%>
    </center>
    
        <div  align="centre">
            <center>
              <p class="hed2"> Welcome ADMIN , you can mange the database from here only.</p>
           </center>
        </div>
    <center>
    <div class="part"></div>
    
    <p class="hed1"><u>See availabilty of blood</u></p>
    <jsp:include page="visualise_database.jsp" />  
    <div class="part"></div>
    <jsp:include page="approve_medical.jsp" />  
    <div class="part"></div>
 
  <jsp:include page="admin_donate.jsp" /> 
  <p class="par"></p>
    <div class="part"></div>
     <jsp:include page="admin_request.jsp" /> 
  <p class="par"></p>
     <div class="part"></div>
    </center>
    
    
    
    
    
    <%if(false){%>
    <center><p class="hed1"><u>Medical Records</u></p></center>
    <center>
        <div class="q" align="center">
            <center>
            
            <table>
                <tr><td>
            <p class="hed2">Current Medical Records:</p>
                    </td>
            
            <td>
            <p class="red">NO MEDICAL RECORD FOUND </p>
            </td>
            </tr>
            </table>
            </center>
           
            
        
           
            
            <p class="par"></p>
            <input class = "btn btn-primary" onclick="window.location.href='http://localhost:8080/Bbms/medical_u.jsp'" type="submit" value="Update Medical Record">
            
        </div>
    </center>
<div ><p></p></div>
<div class="part"></div>
    <jsp:include page="user_donate_blood.jsp" />  
    <div class="part"></div>
    <jsp:include page="user_request_blood.jsp" />
    <div class="part"></div>
    <jsp:include page="user_donation_history.jsp" />  
    <div class="part"></div>
    <jsp:include page="user_request_history.jsp" />
    <div class="part"></div>
       <%}%>
    </body>
</html>