
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String proname=request.getParameter("proname");
            String prodes,cname,ccont,lead,status;
            prodes=request.getParameter("prodes");
            cname=request.getParameter("cname");
            ccont=request.getParameter("ccont");
            lead=request.getParameter("lead");
            status=request.getParameter("status");
            Connection obj1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull","root","aressam1999");
            Statement obj2=obj1.createStatement();
            String q="INSERT INTO project(pid,proname,prodes,cname,ccont,lead,status) VALUE(0,'"+proname+"','"+prodes+"','"+cname+"','"+ccont+"','"+lead+"','"+status+"')";
            obj2.executeUpdate(q);
            response.sendRedirect("addproject.jsp");
        %>
    </body>
</html>
