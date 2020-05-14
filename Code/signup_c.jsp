<%-- 
    Document   : signup_c
    Created on : 24 Apr, 2020, 12:53:56 PM
    Author     : nikp
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
      
            /* */
          String _user1=request.getParameter("user_new");
          String _pass1=request.getParameter("pass_1");
          String _pass2=request.getParameter("pass_2");
          String _email=request.getParameter("email");
          String _phone=request.getParameter("phone");
          if(_user1==null)
          {
             out.println("username ploxx"); 
             return;
          }
          if(_pass1==null)
          {
             out.println("pass1 ploxx"); 
             return;
          }
          if(_pass2==null)
          {
             out.println("pass2 ploxx"); 
             return;
          }
          if(_email==null)
          {
             out.println("email ploxx"); 
             return;
          }
          if(_phone==null)
          {
             out.println("phn ploxx"); 
             return;
          }
          
      
                if(_user1.length()!=0 && _pass1.length()!=0&&_pass2.length()!=0&&_email.length()!=0 && _phone.length()!=0)
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

                      while(rs.next())
                      {

                          flag=1;

                      }
                      if(flag==1)
                      {
                        session.setAttribute("warning11", "choose new email please");
                        response.sendRedirect("signup.jsp"); 
                      }
                      if(!_pass1.equals(_pass2))
                      {
                        session.setAttribute("warning11", "Enter Same Password please");
                        response.sendRedirect("signup.jsp");
                      }
                      int max = 4;
                     query = "INSERT INTO user_details" + " VALUES ('"+ _user1 +"', '" + _pass1 +"','" + _email +"','"+_phone+"')";
                      int rs2 = stmt.executeUpdate(query);
                      session.setAttribute("message1","Please Login to continue, Signup Succesfull");
                      response.sendRedirect("index.jsp");
                      return;
                  }
                  catch(SQLException e){
                  System.err.println(e);
                  }  
                }
               
          else
          {
              session.setAttribute("warning11", "Please fill all fields");
                        response.sendRedirect("signup.jsp");
          }
        
    
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
