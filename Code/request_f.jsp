<%-- 
    Document   : request_f
    Created on : 24 Apr, 2020, 3:00:00 PM
    Author     : nikp
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!int approval,medical_updated;
String mess2;
String bl_gr;
int qty;%>
<%
    String email = (String) session.getAttribute("email");
    bl_gr = request.getParameter("bl_gr");
    String qtys  = request.getParameter("qty");
    qty = Integer.parseInt(qtys);
             try{     
                 Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            }
            catch(ClassNotFoundException e){
               
                 System.out.println(e);
                 
            }
        
            try{
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/proj", "nikp", "nikp");
                Statement stmt = con.createStatement();
                
              
                
                String name = (String)session.getAttribute("user");
             
                
                String query3 = "SELECT * from request_blood where email='"+email+"' and NOT is_received=1";
                      ResultSet rs3 = stmt.executeQuery(query3);
                      int check_f=0;
                     
                      while(rs3.next())
                      {
                         check_f=1;
                      }
                      if(check_f==1)
                      {
                      String mess5="A request already in pipeline";
                      session.setAttribute("warning1",mess5);
                      response.sendRedirect("logged_in.jsp");
                      }
                      else
                      {
                      String query2 = "INSERT INTO request_blood (email,bl_gr,quantity ,is_received,is_approved)" + " VALUES ('"+ email +"', '" + bl_gr +"',"+qty+",0,0)";
                      int rs2 = stmt.executeUpdate(query2); 
                      String mess4="Succesfully Registered request, admin will approve your request soon";
                      session.setAttribute("new_message",mess4);
                      response.sendRedirect("logged_in.jsp");
                      }
            }
                
                

                
            catch(SQLException e){
            System.err.println(e);
            }  
            
%>