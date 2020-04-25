<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : logged_in.jsp
    Created on : 21 Apr, 2020, 12:28:46 AM
    Author     : nikp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! String name11;
  int is_record_updated=0;
                int age,approval;
                String mal_jau,surgery,med_dis,bl_gr,donated_before;
%>
<% name11=(String)session.getAttribute("user");%>

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
                            <td> <p class="par"> Welcome: <%= name11 %></p></td>
                            <td><p class="par"></p>
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
    <%
         String _email=(String) session.getAttribute("email");
          String _user=(String) session.getAttribute("user");
        
            try{ 
                 Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            }
            catch(ClassNotFoundException e){
               
                 System.out.println(e);
                 
            }
        
            try{
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/proj", "nikp", "nikp");
                Statement stmt = con.createStatement();
                String query = "SELECT * FROM medical_records WHERE email='" + _email + "'"; 
                ResultSet rs = stmt.executeQuery(query);
              
                is_record_updated=0;
                while(rs.next())
                {
                    is_record_updated=1;
                    age = rs.getInt("age");
                    approval = rs.getInt("approval");
                    bl_gr = rs.getString("bl_gr");
                    mal_jau=rs.getString("mal_jau");
                    surgery = rs.getString("surgery");
                    med_dis = rs.getString("med_dis");
                    donated_before = rs.getString("donated_before");
                    
                }
                

                }
            catch(SQLException e){
            System.err.println(e);
            }  
         
    
    %>
        <div  align="centre">
            <center>
              <p class="hed2"> Welcome to your personal Dashboard, view your medical details and review the request here</p>
           </center>
        </div>
    
    <div class="part"></div>
    <center><p class="hed1"><u>Medical Records</u></p></center>
    <center>
        <div class="q" align="center">
            <center>
            
            <table>
                <tr><td>
            <p class="hed2">Current Medical Records:</p>
                    </td>
            <%
            if(is_record_updated == 0)
            {
            %>
            <td>
            <p class="red">NO MEDICAL RECORD FOUND </p>
            </td>
            </tr>
            </table>
            </center>
            <%
            }
            else
            {
 
            %>
        
            <table class="table-bordered" >
                 <colgroup>
                    <col span="3">
                  
                  </colgroup>
                        <tr>
                            <td><p class="par">Age<p></td>
                            <td class="par" ><%=age%></td>
                        </tr>
                        <tr>
                            
                            <td> <p class="par">Choose your blood group:</p> </td>
                            <td class="par"><%=bl_gr%></td>
                        </tr>
                        <tr>
                            
                            <td><p class="par"> Have you donated before and when did you donate last time:</p></td>
                            <td class="par"><%=donated_before%></td>
                        </tr>
                        <tr>
                            <td><p class="par">Did you suffer from malaria jaundice in past (also mention when)</p></td>
                            <td class="par"><%=mal_jau%></td>
                        </tr>
                        <tr>
                            <td><p class="par">Did you undergo any surgery in past (mention time)<p></td>
                            <td class="par"><%=surgery%></td>
                        </tr>
                        <tr>
                            <td><p class="par">Do you take any medications or have any other disease</p></td>
                            <td class="par"><%=med_dis%></td>
                        </tr>
                </table>
            <table class="table-bordered">
                <tr><td><p class="par" >Status of verification</p></td>
                    <%
                    String mess;
                    if(approval==0)
                       mess="Yet to be approved";
                    else if(approval==1)
                        mess="VERIFIED";
                    else
                       mess="SORRY, YOU ARE NOT ELIGIBLE TO DONATE";
            
            %>
            <td><p class="par"><%=mess%></p></td>
            </table>
            <%}%>
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
    <p class="par"></p>
    <div class="part"></div>
       
    </body>
</html>
