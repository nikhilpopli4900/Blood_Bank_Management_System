<%-- 
    Document   : admin_reject_f
    Created on : 25 Apr, 2020, 11:33:49 AM
    Author     : nikp
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!String user_email;%>
<%
    user_email=request.getParameter("user_email");
        try{ 
                 Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            }
            catch(ClassNotFoundException e){
               
                 System.out.println(e);
                 
            }
        
            try{
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/proj", "nikp", "nikp");
                Statement stmt = con.createStatement();
                String query = "UPDATE medical_records SET approval=-1 WHERE email='"+user_email+"'"; 
                stmt.executeUpdate(query);
                response.sendRedirect("admin_dash.jsp");
            }
            catch(SQLException e){
            System.err.println(e);
            }  
%>