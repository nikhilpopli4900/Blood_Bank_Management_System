<%-- 
    Document   : user_request_blood
    Created on : 24 Apr, 2020, 10:26:58 AM
    Author     : nikp
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!String message;
String mess22;%>
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
        <%
           String email=(String)session.getAttribute("email"); 
         %>
    <center>
       
       <p class="hed1"><u>NEED BLOOD</u> ?</p>
        
        <p class="par"> Click on the Below link if you need blood. Once the request is approved by the admin, you may visit us anytime to recieve the donation with necessary proof.</p>
       
        <center>
 <div class="q">
            <form action="request_f.jsp" >
                <table >
                 <colgroup>
                    <col span="3">
                  
                  </colgroup>
                       
                  <tr> 
                            <td> <p class="par">Choose your blood group:  </p> </td>
                            <td>
                            <select name="bl_gr" class="form-control">
                              <option value="a+">A+ (A positive)</option>
                              <option value="a-">A- (A negative)</option>
                               <option value="b+">B+ (B positive)</option>
                              <option value="b-">B- (B negative)</option>
                               <option value="ab+">AB+ (AB positive)</option>
                              <option value="ab-">AB- (AB negative)</option>
                               <option value="o+">O+ (O positive)</option>
                              <option value="o-">O- (O negative)</option>
                              <option value="nots">Not Sure</option>
                              
                            </select></td>
                        </tr>
                        <tr>
                            
                            <td> <p class="par">Number of packets of blood required:</p> </td>
                            <td>
                            <select name="qty" class="form-control">
                              <option value=1>One</option>
                              <option value=2>Two</option>
                               <option value=3>Three</option>
                              <option value=4>Four</option>
                              
                              
                            </select></td>
                        </tr>
                </table>
                <p class="par"></p>
                <table>
                        <tr>
                            
                            <td colspan="2" style = "text-align: center" ><input class = "btn btn-success" type="submit" value="Request blood"></td>
                        </tr>
                      
                </table>
            </form>
        </div>
    </center>
        <p class="par"></p>
        <p class="par"><b>Status of pending Request:</b></p>
        <table class="table-bordered">
            <tr>
                <td><p class="par">Name</p></td>
                <td><p class="par"> Blood Group</p> </td>
                <td><p class="par">Quantity</p></td>   
                <td><p class="par">Status</p></td>
            </tr>
                <%
                   
           String _email = (String)session.getAttribute("email");
            try{ 
                 Class.forName("org.apache.derby.jdbc.ClientDriver");
            }
            catch(ClassNotFoundException e){
                 System.out.println(e); 
                 }
            try{
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/proj", "nikp", "nikp");
                Statement stmt = con.createStatement();
                String query = "SELECT * FROM request_blood WHERE email='" + _email + "' AND NOT is_received=1"; 
                ResultSet rs = stmt.executeQuery(query);

                //String u = rs.getString("username");
                String usern = (String)session.getAttribute("user");
                while(rs.next())
                {
                    String bl_gr = rs.getString("bl_gr");
                    int qty = rs.getInt("quantity");
                    int appr = rs.getInt("is_approved");
                    
                    if(appr==0)
                       mess22="Yet to be approved";
                    if(appr==1)
                       mess22="Approved, collect the blood anytime";
                    if(appr==-1)
                        mess22="This request could not be fulfilled ";
       %> 
                <tr>
                    <td><p class="par"><%=usern%></p></td>
                    <td><p class="par"><%=bl_gr%></p></td>
                    <td><p class="par"><%=qty%></p></td>   
                    <td><p class="par"><%=mess22%></p></td>
                </tr>
          <%
               }
                                

            }
            catch(SQLException e){
            System.err.println(e);
                
          }
                %>
               
        </table>
                <p class="par"></p>
        
    </center>
    </body>
</html>

