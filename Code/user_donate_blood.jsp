<%-- 
    Document   : user_donate_blood
    Created on : 24 Apr, 2020, 10:26:38 AM
    Author     : nikp
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!String message;%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        .hed1{
                font-family: Arial, Helvetica, sans-serif;
                color:black;
                 font-size:35px;
                 padding-right: 30px;
                
               }
         .par{
                font-family: Arial, Helvetica, sans-serif;
                color:black;
                font-size:19px;
                padding-left: 30px;
                padding-right: 30px;
                padding-top: 3px;
            }
         </style>
    </head>
    <body>
        <%
           String email=(String)session.getAttribute("email"); 
         %>
    <center>
       
       <p class="hed1"><u>DONATE BLOOD</u></p>
        
        <p class="par"> Click on the Below link if you are interested to donate. Once the request is approved by the admin, you may visit us anytime to donate</p>
       
        <input class = "btn btn-success" onclick="window.location.href='http://localhost:8080/Bbms/donate_f.jsp'" type="submit" value="Donate Blood">
        <p class="par"></p>
        <table>
            <tr>
                <td><p class="par"><b>Status of pending Request:</b></p></td>
                <%
                   
           String _email = (String)session.getAttribute("email");
            try{ 
                 Class.forName("org.apache.derby.jdbc.ClientDriver");
            }
            catch(ClassNotFoundException e){
                 System.out.println(e); 
                 }
            try{
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/proj", "nikp", "nikp");
                Statement stmt = con.createStatement();
                String query = "SELECT * FROM donate_blood WHERE email='" + _email + "'"; 
                ResultSet rs = stmt.executeQuery(query);

                //String u = rs.getString("username");
                int temp=-2,t=-2,d=-2;
                while(rs.next())
                {
                  t=rs.getInt("is_approved");
                  d = rs.getInt("is_donated");
                      
                }
                if(t==-2){
                    message = "No pending request";
                }
                if(t==-1)
                {
                  message = "Your request was denied by admin";
                  
                }
                if(t==0)
                {
                    message = "Yet to be approved";
                }
                if(t==1)
                {
                    if(d==1)
                        message = "No pending request1";
                    else
                        message = "You request is approved you may visit to donate in any workin hours";
                    
                }
                

                }
            catch(SQLException e){
            System.err.println(e);
                
          }
                %>
                <td><p class ="par"><%=message%></td> 
            </tr>
        </table>
       
        
    </center>
    </body>
</html>
