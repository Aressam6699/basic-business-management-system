

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
            String active,project,bug,bugdes,assign,status,rby;
            project=request.getParameter("project");
            bug=request.getParameter("bug");
            bugdes=request.getParameter("bugdes");
            assign=request.getParameter("assign");
            status=request.getParameter("status");
            rby=request.getParameter("hid");
            active=request.getParameter("active");
            Connection obj1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull","root","aressam1999");
            Statement obj2=obj1.createStatement();
            String q="UPDATE bugs SET active='"+active+"',project='"+project+"',bug='"+bug+"',bugdes='"+bugdes+"',assign='"+assign+"',status='"+status+"',rby='"+rby+"' WHERE bugid="+request.getParameter("hid2");
            obj2.executeUpdate(q);
            response.sendRedirect("ownbug.jsp?id="+rby);
        %>
    </body>
</html>
