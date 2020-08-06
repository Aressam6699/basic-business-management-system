
<%@page import="java.sql.ResultSet"%>
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
            Connection obj1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull","root","aressam1999");
            Statement obj2=obj1.createStatement();
            String pass=request.getParameter("p1");
            String pass2=request.getParameter("p2");
            String hid=request.getParameter("hid");
            String password=request.getParameter("password");
            
            String q="SELECT * FROM empreg WHERE password='"+password+"' AND username='"+hid+"'";
                ResultSet obj3=obj2.executeQuery(q);
                if(obj3.next())
                {
                   
                    String updateq="UPDATE empreg SET password='"+pass+"' WHERE username='"+hid+"'";
                    
                    Statement obj4=obj1.createStatement();
                    obj4.executeUpdate(updateq);
                    response.sendRedirect("emphome.jsp");
                    
                    }
                else
                {
                    response.sendRedirect("changepassword.jsp?id2=2");
                }
            
            
            
        %>
    </body>
</html>
