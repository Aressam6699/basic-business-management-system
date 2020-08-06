
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
            String admin,pass;
            admin=request.getParameter("admin");
            pass=request.getParameter("pass");
            Connection obj1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull","root","aressam1999");
            Statement obj2=obj1.createStatement();
            String q="SELECT * FROM admin WHERE admin='"+admin+"' AND password='"+pass+"'";
            ResultSet obj3=obj2.executeQuery(q);
            //jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull
            //session.setAttribute("count",new Integer(0));
            //int countAttempt = ((Integer)session.getAttribute("count")).intValue();

            if(obj3.next())
            {
                session.setAttribute("admin",admin);
                response.sendRedirect("adminhome.jsp");
            }
            else
            {
                response.sendRedirect("adminlogin.jsp?id=1");
            }
        %>
    </body>
</html>
