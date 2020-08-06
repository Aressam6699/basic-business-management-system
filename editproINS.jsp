
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
            String proname,prodes,cname,ccont,lead,hid;
            proname=request.getParameter("proname");
            prodes=request.getParameter("prodes");
            cname=request.getParameter("cname");
            ccont=request.getParameter("ccont");
            lead=request.getParameter("lead");
            hid=request.getParameter("hid");
            Connection obj1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull","root","aressam1999");
            Statement obj2=obj1.createStatement();
            String q="UPDATE project SET proname='"+proname+"',prodes='"+prodes+"',cname='"+cname+"',ccont='"+ccont+"',lead='"+lead+"' WHERE pid='"+request.getParameter("hid")+"'";
            obj2.executeUpdate(q);
            response.sendRedirect("viewproject.jsp");
        %>
    </body>
</html>
