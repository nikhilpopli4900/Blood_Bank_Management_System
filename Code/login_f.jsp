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
<%! String email1;%>
<%


          int final11 = 0;
          
          String _email=request.getParameter("user");
          String _pass1=request.getParameter("pass");
         if(_email.length()!=0 && _pass1.length()!=0)
          {
            try{ 
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
                int flag=0;
                String p="";
                while(rs.next())
                {
                   p = rs.getString("password");
                   name11=rs.getString("username");
                   email1 = _email;
                    flag=1;

                }
                if(flag==0)
                {
                  final11=1; //kon ho tum
                }         
                else if(_pass1.equals(p))//&&_user1.equals(u))
                { 

                    final11 = 0;
                }
                else
                final11 = 2; //wrong password

                }
            catch(SQLException e){
            System.err.println(e);
            }  
          }
             
          else
          {
              final11=3;
              
          }
         if(final11==1)
            param="Email Address not registered";
         if(final11==2)
             param="Incorrect Password";
         if(final11 ==3)
             param="Empty email or password";
    
    
%>
<%
         if(final11==0){%>
             

            <%
             if(email1.equals("admin@admin.com"))
             {
                 session.setAttribute("admin",1);
                 response.sendRedirect("admin_dash.jsp");
             }
             else
             {
             
                session.setAttribute("user",name11);
                session.setAttribute("email",email1);
                response.sendRedirect("logged_in.jsp");
             }  
                
            %>
           
         
         
<%} else{%>
        <jsp:include page="login.jsp" >
            <jsp:param name="warning" value="<%=param%>" />
  
</jsp:include>
   <% } %>  
