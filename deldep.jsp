

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dissolve Departments</title>
        <link href="csspage.css" rel="StyleSheet" type="text/css">
    </head>
    <body>
        <h1 align="center">Departments : </h1>
    <%
        Connection obj1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull","root","aressam1999");
        Statement obj2=obj1.createStatement();
        String q="SELECT * FROM department";
        ResultSet obj3=obj2.executeQuery(q);
    %>
    <table class="table2">
        <%
        while(obj3.next())
        {
        %>
        <tr>
            <td><%=obj3.getString("depname")%></td>
            <td><a href="deldepINS.jsp?id=<%=obj3.getString("depid")%>">Delete</a></td>
        </tr>
        <%
        }
        %>
        <tr>
            <td><a href="department.jsp">Back</a></td>
        </tr>
    </table>
    </body>
</html>