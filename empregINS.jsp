
<%@page import="java.sql.PreparedStatement"%>
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
            String q,name,gen,department,email,mobile,status,dob;
            name=request.getParameter("name");
            gen=request.getParameter("gen");
            department=request.getParameter("department");
            email=request.getParameter("email");
            mobile=request.getParameter("mobile");
            status=request.getParameter("status");
            dob=request.getParameter("dob");
            Connection obj1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull","root","aressam1999");
            Statement obj2=obj1.createStatement();
            q="INSERT INTO empreg(eid,name,gen,dob,department,email,mobile,status,username,password) VALUE(0,'"+name+"','"+gen+"','"+dob+"','"+department+"','"+email+"','"+mobile+"','"+status+"','"+email+"','"+mobile+"')";
            obj2.executeUpdate(q);
            response.sendRedirect("empreg.jsp");
            %>
    </body>
</html>
