<%-- 
    Document   : admin_donate_f
    Created on : 26 Apr, 2020, 3:37:24 AM
    Author     : nikp
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!String user_email;
int approvedd;%>
<%
    user_email=request.getParameter("user_email");
    String aa = request.getParameter("approvedd");
    approvedd = Integer.parseInt(aa);
             try{ 
                 Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            }
            catch(ClassNotFoundException e){
               
                 System.out.println(e);
                 
            }
        
            try{
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/proj", "nikp", "nikp");
                Statement stmt = con.createStatement();
                String query = "UPDATE donate_blood SET is_approved="+approvedd+"WHERE email='"+user_email+"'"; 
                stmt.executeUpdate(query);
                response.sendRedirect("admin_dash.jsp");
            }
            catch(SQLException e){
            System.err.println(e);
            }  
%>