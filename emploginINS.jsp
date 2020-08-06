
<%@page import="java.sql.ResultSet"%>
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
            String user,pass;
            user=request.getParameter("user");
            pass=request.getParameter("pass");
            Connection obj1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull","root","aressam1999");
            Statement obj2=obj1.createStatement();
            String q="SELECT * FROM empreg WHERE username='"+user+"' AND password='"+pass+"'";
            ResultSet obj3=obj2.executeQuery(q);
            if(obj3.next())
            {
                session.setAttribute("user",user);
                response.sendRedirect("emphome.jsp");
            }
            else
            {
                response.sendRedirect("emplogin.jsp?id=1");
            }
        %>
    </body>
</html>
