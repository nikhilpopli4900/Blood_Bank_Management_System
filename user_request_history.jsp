<%-- 
    Document   : user_request_history
    Created on : 25 Apr, 2020, 4:09:25 AM
    Author     : nikp
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
int is_d=0;
int is_r=0;
%>
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
            div.q{
           
                width:65%;
                border-radius: 5px;
                background-color: lightgrey;
            }
         </style>
    </head>
    <body>
        <center>
        <p class="hed1"><u>History of Blood Packets Received</u></p>
<%
    


          int final11 = 0;
          
          String _email=(String)session.getAttribute("email");
          String _user=(String)session.getAttribute("user");
        
            try{ 
                 Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            }
            catch(ClassNotFoundException e){
               
                 System.out.println(e);
                 
            }
        
            try{
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/proj", "nikp", "nikp");
                Statement stmt = con.createStatement();
                String query = "SELECT * FROM request_blood WHERE email='" + _email + "' and is_received=1"; 
                ResultSet rs2 = stmt.executeQuery(query);
               

                //String u = rs.getString("username");
                  
%>  
        <table class="table-bordered">
            <tr>
                <td><p class="par">Name of Receiver</p></td>
                <td><p class="par"> Blood Group</p>
                <td><p class="par">No. of blood packets</p>
                <td><p class="par"> Date of Recieving</p>
                
            </tr>
        <%
                while(rs2.next())
                {
                    
                is_d = 1;
                 String name=(String)session.getAttribute("user");
                 String bl_gr = rs2.getString("bl_gr");
                 int qty = rs2.getInt("quantity");
                 int dd = rs2.getInt("date_dd");
                 int mm = rs2.getInt("month_mm");
                 int yyyy = rs2.getInt("year_yyyy");
                %>  
                <tr>
                    <td><p class="par"><%=name%></p></td>
                    <td><p class="par"><%=bl_gr%></p></td>
                    <td><p class="par"><%=qty%></p></td>
                    
                    <td><p class="par"><%=dd%> / <%=mm%> / <%=yyyy%></p></td>
                    </tr>
                 
        <%            
                }
               
        %>
        </table>
        
<%}
            catch(SQLException e){
            System.err.println(e);
            } 
%>
 <% if(is_d == 0)
                {
        %>            
                <p class="par">Not received blood till now!</p>
            
        <%
                }
        %>
</center>
    </body>
</html>
