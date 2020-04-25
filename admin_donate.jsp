<%-- 
    Document   : admin_donate.jsp
    Created on : 26 Apr, 2020, 3:23:57 AM
    Author     : nikp
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
        
        <p class="hed1"><u>Blood Donation Requests</u></p>
        <div>
    <table class="table-bordered">
            <tr>
                <td><p class="par">Email Address</p>
                <td><p class="par">Name of Donor</p></td>
                <td><p class="par"> Blood Group</p>
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
                String query = "SELECT * FROM donate_blood WHERE is_approved=0"; 
                 
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
                    
                    
            %>
            <tr>
                <td><p class="par"><%=_email%></p></td>
                <td><p class="par"><%=user%></p></td>
                <td><p class="par"> <%=bl_gr%></p></td>
          
                <td><input class="btn btn-success" onclick="window.location.href='http://localhost:8080/Bbms/admin_donate_f.jsp?user_email=<%=_email%>&approvedd=1'" type="submit" value="Approve"></td>
                <td><input class="btn btn-danger" onclick="window.location.href='http://localhost:8080/Bbms/admin_donate_f.jsp?user_email=<%=_email%>&approvedd=-1'" type="submit" value="Disapprove"></td>
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

<p class="hed1"><u>Approved Requests</u></p>
        <div>
            
            
    <table class="table-bordered" style="width:80%">
            <tr>
                <td style="width:20%"><p class="par">Email Address</p></td>
                <td style="width:20%"><p class="par">Name of Donor</p></td>
                <td style="width:10%"><p class="par"> Blood Group</p></td>
                <td style="width:10%"><p class="par">Date</p></td>
                <td style="width:10%"><p class="par">Month</p></td>
                <td style="width:15%"><p class="par">Year</p></td>    
                <td style="width:15%"><p class="par"> Mark Donation</p></td>
                
            </tr>
     </table>
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
                String query = "SELECT * FROM donate_blood WHERE is_approved=1 and is_donated=0"; 
                 
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
                    
                    
            %>
            <form action="admin_mark_donated_f.jsp">
                <table class="table-bordered" style="width:80%">
            <tr>
                <td style="width:20%"><p class="par" ><%=_email%></p></td>
            <p hidden><input type="text" id="fname" name="user_email" value="<%=_email%>"></p>
                <td style="width:20%"><p class="par"><%=user%></p></td>
                <td style="width:10%"><p class="par"> <%=bl_gr%></p></td>
                <td style="width:10%"><input type="text" class="form-control" name="date" placeholder="dd"></td>
                <td style="width:10%"><input type="text" class="form-control" name="month" placeholder="mm"></td>
                <td style="width:15%"><input type="text" class="form-control" name="year" placeholder="yyyy"></td>
                <td style="width:15%"><input class="btn btn-success"  type="submit" value="Mark Donation"></td>
            </tr>
            </table>
            </form>

                <%
                }
            }
            catch(SQLException e){
            System.err.println(e);
            } 
%>

           

</div>



    </body>
</html>