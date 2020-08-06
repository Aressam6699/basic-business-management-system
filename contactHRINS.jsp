<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String des,rby,auth;
            des=request.getParameter("query");
            auth=request.getParameter("auth");
            rby=request.getParameter("hid");
            Connection obj1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull","root","aressam1999");
            Statement obj2=obj1.createStatement();
            String q="INSERT INTO request(reqid,rby,des,pid,domain,status) Values(0,'"+rby+"','"+des+"',"+auth+",'HR query','n')";
            obj2.executeUpdate(q);
            response.sendRedirect("request.jsp");
        %>
    </body>
</html>
