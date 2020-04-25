<%-- 
    Document   : welcome
    Created on : 17 Apr, 2020, 7:33:58 AM
    Author     : nikp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!jsp:include page="login_c.jsp">
    <!jsp:param name="name1" value="nikhil"/>
    
<!!/jsp:include>
<%
/*response.sendRedirect("login_c.jsp");*/
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String name = (String)session.getAttribute("user");%>
        
        <h1>Hello <%= name %></h1>
    </body>
</html>
