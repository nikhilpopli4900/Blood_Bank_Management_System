<%-- 
    Document   : donate_f
    Created on : 24 Apr, 2020, 12:26:05 PM
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
String bl_gr; %>
<%
    String email = (String) session.getAttribute("email");
             try{     
                 Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            }
            catch(ClassNotFoundException e){
               
                 System.out.println(e);
                 
            }
        
            try{
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/proj", "nikp", "nikp");
                Statement stmt = con.createStatement();
                String query = "SELECT * FROM medical_records WHERE email='" + email + "'"; 
                ResultSet rs = stmt.executeQuery(query);
              
                int flag=1;
                
                while(rs.next())
                {
                    flag = 0;
                    approval = rs.getInt("approval");
                    bl_gr=rs.getString("bl_gr");
                    
                    
                }
                if(flag==0)
                    {
                     medical_updated=1;   
                    }
                
                
                if(medical_updated==0)
            {    mess2 = "Enter Medical Records first";
            session.setAttribute("warning1",mess2);
            response.sendRedirect("medical_u.jsp");
            }
            else if(approval==-1)
            {
                String mess3="Medical Records could not be verified by the Admin";
                session.setAttribute("warning1", mess3);
                response.sendRedirect("logged_in.jsp");
            }
            else if(approval==0)
            {
                String mess3="Your Medical Records are yet to be verified,please wait";
                session.setAttribute("warning1", mess3);
                response.sendRedirect("logged_in.jsp");
            }
            else
            {
              
                String name = (String)session.getAttribute("user");
             
                
                String query3 = "SELECT * from donate_blood where email='"+email+"'";
                      ResultSet rs3 = stmt.executeQuery(query3); 
                      int flag_c = 0;
                      while(rs3.next())
                      {
                          int ap = rs3.getInt("is_approved");
                          int don = rs3.getInt("is_donated");
                          if(don==1)
                              continue;
                          else
                              flag = 1;
                      }
                      if(flag==1)
                      {
                      String mess5="A request already in pipeline";
                      session.setAttribute("warning1",mess5);
                      response.sendRedirect("logged_in.jsp");
                      }
                      else
                      {
                      String query2 = "INSERT INTO donate_blood (email,bl_gr,is_donated,is_approved)" + " VALUES ('"+ email +"', '" + bl_gr +"',0,0)";
                      int rs2 = stmt.executeUpdate(query2); 
                      String mess4="Succesfully Registered request, admin will approve your request soon";
                      session.setAttribute("new_message",mess4);
                      response.sendRedirect("logged_in.jsp");
                      }
            }
                
                

                }
            catch(SQLException e){
            System.err.println(e);
            }  
            
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    </body>
</html>
