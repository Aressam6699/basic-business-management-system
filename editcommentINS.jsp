
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
            String active,comment,commentid,rby;
            comment=request.getParameter("comment");
            active=request.getParameter("active");
            commentid=request.getParameter("commentid");
            rby=request.getParameter("rby");
            
            Connection obj1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull","root","aressam1999");
            Statement obj2=obj1.createStatement();
            String q="UPDATE comments SET comment='"+comment+"',active='"+active+"' WHERE commentid="+commentid;
            obj2.executeUpdate(q);
            response.sendRedirect("view.jsp?id="+rby);
        %>
    </body>
</html>
