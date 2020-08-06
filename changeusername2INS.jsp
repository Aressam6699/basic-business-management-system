

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
            String password=request.getParameter("pass");
            String user=request.getParameter("user");
            String hid=request.getParameter("hid");
            
            String q="SELECT * FROM empreg WHERE password='"+password+"' AND username='"+hid+"'";
                ResultSet obj3=obj2.executeQuery(q);
                if(obj3.next())
                {
                   
                    String updateq="UPDATE empreg SET username='"+user+"' WHERE username='"+hid+"'";
                    
                    Statement obj4=obj1.createStatement();
                    obj4.executeUpdate(updateq);
                    session.removeAttribute("user");
                    session.setAttribute("user",user);
                    response.sendRedirect("HRhome.jsp");
                    
                    }
                else
                {
                    response.sendRedirect("changeusername2.jsp?id2=2");
                }
            
            
            
        %>
    </body>
</html>
