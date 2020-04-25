<%-- 
    Document   : admin_mark_donated_f
    Created on : 26 Apr, 2020, 5:44:48 AM
    Author     : nikp
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!String user_email;
int curr_ind;
String bl_gr;%>
<%
    curr_ind=0;
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
                String query = "SELECT * from blood_packet";
                ResultSet rs = stmt.executeQuery(query);
                while(rs.next())
                {
                    int t = rs.getInt("blood_packet_id");
                    if(curr_ind<t)
                    {
                        curr_ind=t;
                    }
                        
                }
                curr_ind++;
                Statement stmt2 = con.createStatement();
                String query2 = "SELECT * from medical_records WHERE email='" + user_email + "'";
                ResultSet rs2 = stmt.executeQuery(query2);
                rs2.next();
                bl_gr = rs2.getString("bl_gr");
           
                String dds = request.getParameter("date");
                String mms = request.getParameter("month");
                String yyyys = request.getParameter("year");
                int dd = Integer.parseInt(dds);
                int mm = Integer.parseInt(mms);
                int yyyy = Integer.parseInt(yyyys);
                Statement stmt3 = con.createStatement();
                String query3 = "INSERT INTO blood_packet (email,bl_gr, date_dd,month_mm,year_yyyy,blood_packet_id,is_available) VALUES ('"+ user_email +"','"+bl_gr+"',"+dd+"," + mm + "," + yyyy + "," +curr_ind +",1)" ;         
                stmt.executeUpdate(query3);
                
                
                Statement stmt4 = con.createStatement(); 
                String query4 = "UPDATE donate_blood SET is_donated = 1,blood_packet_id="+curr_ind+" WHERE email ='" +user_email + "' and is_approved = 1";         
                stmt.executeUpdate(query4);
                response.sendRedirect("admin_dash.jsp");
                
                
                
            }
            catch(SQLException e){
            System.err.println(e);
            }  
%>