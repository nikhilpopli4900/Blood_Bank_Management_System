<%-- 
    Document   : admin_mark_given
    Created on : 26 Apr, 2020, 9:28:26 AM
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
int qty;
int curr_ind;
String bl_gr;%>
<%
    curr_ind=0;
    user_email=request.getParameter("user_email");
    bl_gr=request.getParameter("blg");
    String qtys = request.getParameter("qty");
    int qty1 = Integer.parseInt(qtys);
    qty=qty1;
             try{ 
                 Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            }
            catch(ClassNotFoundException e){
               
                 System.out.println(e);
                 
            }
            int[] ids;
            ids = new int[qty];
            try{
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/proj", "nikp", "nikp");
                Statement stmt = con.createStatement();
                String query = "SELECT * from blood_packet where bl_gr = '"+bl_gr+"' and is_available=1";
                ResultSet rs = stmt.executeQuery(query);
                while(rs.next())
                {
                    if(qty1==0)
                        break;
                  ids[qty1-1] = rs.getInt("blood_packet_id"); 
                  qty1--;      
                }
               for(int i=0;i<qty;i++)
               {
                Statement stmt2 = con.createStatement();
                String query2 = "UPDATE blood_packet SET is_available=0 WHERE blood_packet_id ="+ids[i];
                stmt.executeUpdate(query2);
               }
                String dds = request.getParameter("date");
                String mms = request.getParameter("month");
                String yyyys = request.getParameter("year");
                int dd = Integer.parseInt(dds);
                int mm = Integer.parseInt(mms);
                int yyyy = Integer.parseInt(yyyys);
                Statement stmt3 = con.createStatement();
                String query3 = "UPDATE request_blood SET is_received=1, quantity ="+qty+", date_dd="+dd+", month_mm="+mm+", year_yyyy="+yyyy+ "where email='"+user_email+"' and is_received=0";    
                stmt.executeUpdate(query3);
                response.sendRedirect("admin_dash.jsp");
                
                
                
            }
            catch(SQLException e){
            System.err.println(e);
            }  
%>
