<%-- 
    Document   : user_donation_history
    Created on : 25 Apr, 2020, 4:08:54 AM
    Author     : nikp
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
int is_d=0;

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
        <p class="hed1"><u>History of Blood Donation</u> ?</p>
        <table class="table-bordered">
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
             
                 String query2 = "SELECT * FROM donate_blood WHERE email='" + _email + "' and is_donated=1"; 
                ResultSet rs = stmt.executeQuery(query2);

                //String u = rs.getString("username");
                  
%>  
        
            <tr>
                <td><p class="par">Name of Donor</p></td>
                <td><p class="par"> Blood Group</p>
                <td><p class="par"> Date of Donation</p>
                
            </tr>
        <%
                while(rs.next())
                {
                    
                is_d = 1;
                 String name=(String)session.getAttribute("user");
                 String bl_gr = rs.getString("bl_gr");
                 int id = rs.getInt("blood_packet_id");
                 
                 String query3 = "SELECT * FROM blood_packet WHERE blood_packet_id=" + id; 
                ResultSet rs3 = stmt.executeQuery(query3);
                rs3.next();
                int dd = rs3.getInt("date_dd");
                 int mm = rs3.getInt("month_mm");
                 int yyyy = rs3.getInt("year_yyyy");
                %>  
                    <tr>
                    <td><p class="par"><%=name%></p></td>
                    <td><p class="par"><%=bl_gr%></p></td>
                    <td><p class="par"><%=dd%> / <%=mm%> / <%=yyyy%></p></td>
                    </tr>
                 
        <%            
                }
               
        %>
       
        
<%      }
            catch(SQLException e){
            System.err.println(e);
            } 
%>
 <% if(is_d == 0)
                {
        %>            
                <p class="par">No Donations Made till now!</p>
            
        <%
                }
        %>
         </table>
        <p class="par"></p>
</center>
    </body>
</html>
