<%-- 
    Document   : approve_medical
    Created on : 25 Apr, 2020, 8:11:23 AM
    Author     : nikp
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .hed1{
                font-family: Arial, Helvetica, sans-serif;
                color:black;
                 font-size:35px;
                padding-left: 30px;
                padding-top: 15px;
            }
            .par{
                font-family: Arial, Helvetica, sans-serif;
                color:black;
                font-size:14px;
                padding-left: 30px;
                padding-right: 30px;
                padding-top: 3px;
            }
        </style>
    </head>
    <body>
        
        <p class="hed1"><u>Approve Medical Details</u></p>
        <div>
    <table class="table-bordered">
            <tr>
                <td><p class="par">Email Address</p>
                <td><p class="par">Name of Donor</p></td>
                <td><p class="par"> Blood Group</p>
                <td><p class="par">Age</p>
                <td><p class="par"> Suffered from Malaria/Jaundice</p>
                <td><p class="par"> Other medications/diseases</p>
                <td><p class="par"> Donated Before</p>
                <td><p class="par"> Approve</p>
                <td><p class="par"> Reject</p>     
            </tr>
            <%
            try{ 
                 Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            }
            catch(ClassNotFoundException e){
               
                 System.out.println(e);
                 
            }
        
            try{
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/proj", "nikp", "nikp");
                Statement stmt = con.createStatement();
                String query = "SELECT * FROM medical_records WHERE approval=0"; 
                 
                ResultSet rs = stmt.executeQuery(query);
           
                while(rs.next())
                {
                    String _email = rs.getString("email");
                    Statement stmt1 = con.createStatement();
                    String query2 = "SELECT * FROM user_details WHERE email='"+_email+"'"; 
                    ResultSet rs2 = stmt1.executeQuery(query2);
                    rs2.next();
                    String user = rs2.getString("username");
                    String bl_gr = rs.getString("bl_gr");
                    int age = rs.getInt("age");
                    String mal_jau = rs.getString("mal_jau");
                    String med_dis = rs.getString("med_dis");
                    String don_bef = rs.getString("donated_before");
                    
            %>
            <tr>
                <td><p class="par"><%=_email%></p></td>
                <td><p class="par"><%=user%></p></td>
                <td><p class="par"> <%=bl_gr%></p></td>
                <td><p class="par"><%=age%></p></td>
                <td><p class="par"> <%=mal_jau%></p></td>
                <td><p class="par"> <%=med_dis%></p></td>
                <td><p class="par"> <%=don_bef%></p></td>
                <td><input class="btn btn-success" onclick="window.location.href='http://localhost:8080/Bbms/admin_approve_f.jsp?user_email=<%=_email%>'" type="submit" value="Approve"></td>
                <td><input class="btn btn-danger" onclick="window.location.href='http://localhost:8080/Bbms/admin_reject_f.jsp?user_email=<%=_email%>'" type="submit" value="Disapprove"></td>
            </tr>
            <%
                }
            }
            catch(SQLException e){
            System.err.println(e);
            } 
%>
</table>
</div>
<p class="par"></p>
    </body>
</html>
