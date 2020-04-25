<%-- 
    Document   : log_out
    Created on : 26 Apr, 2020, 10:50:32 AM
    Author     : nikp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("user",null);
    session.setAttribute("email",null);
    session.setAttribute("admin",0);
    response.sendRedirect("index.jsp");
%>