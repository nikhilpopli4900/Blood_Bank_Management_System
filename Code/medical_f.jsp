<%-- 
    Document   : login_f
    Created on : 20 Apr, 2020, 4:54:08 AM
    Author     : nikp
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! String param;%>
<%! String name11;%>
<%! String _email;%>
<% name11=(String)session.getAttribute("user");%>
<% _email=(String)session.getAttribute("email");%>
<%
            
            String age = request.getParameter("age");
            String bl_gr = request.getParameter("bl_gr");
            String don_bef = request.getParameter("donated_before");
            String mal_jau = request.getParameter("mal_jau");
            String surgery = request.getParameter("surgery");
            String med_dis = request.getParameter("med_dis");
            
            
           
            if(age==null||bl_gr==null)//    ||age.length()==0||bl_gr.length()==0)
            {
                session.setAttribute("warning1", "Enter valid age and blood group");
                response.sendRedirect("medical_u.jsp");
            }
            else if(age.length()==0||bl_gr.length()==0)
            {
               session.setAttribute("warning1", "Enter valid age and blood group");
                response.sendRedirect("medical_u.jsp"); 
            }
            else
            {
                int ages = Integer.parseInt(age);
                
                try{ 
                 Class.forName("org.apache.derby.jdbc.ClientDriver");
            
                }
                catch(ClassNotFoundException e){

                     System.out.println(e);

                }

                try{
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/proj", "nikp", "nikp");
                    Statement stmt = con.createStatement();
                   // String query = "SELECT * medical_records WHERE email='" + _email + "'"; 
                    //ResultSet rs = stmt.executeQuery(query);
                    String query = "INSERT INTO medical_records (email,age,donated_before,mal_jau,surgery,med_dis,approval,bl_gr) VALUES('"+_email + "'," + ages + ",'" + don_bef +"','" + mal_jau + "','" + surgery +"','"+med_dis + "',0,'" + bl_gr +"')"   ;
                    stmt.executeUpdate(query);
                    session.setAttribute("new_message","Succesfully Updated Details");
                    response.sendRedirect("logged_in.jsp");

                    }
                catch(SQLException e){
                System.err.println(e);
                }  
                
                
            }
            /*try{ 
                 Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            }
            catch(ClassNotFoundException e){
               
                 System.out.println(e);
                 
            }
        
            try{
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/proj", "nikp", "nikp");
                Statement stmt = con.createStatement();
                String query = "SELECT * FROM user_details WHERE email='" + _email + "'"; 
                ResultSet rs = stmt.executeQuery(query);

                //String u = rs.getString("username");
                

                }
            catch(SQLException e){
            System.err.println(e);
            }  */
          
             
         
    
    
%>
