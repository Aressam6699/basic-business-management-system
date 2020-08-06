
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report a bug</title>
        <link href="csspage.css" rel="StyleSheet" type="text/css">
    </head>
    <body>
        <%
            Connection obj1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull","root","aressam1999");
            Statement obj2=obj1.createStatement();
            String q="SELECT * FROM comments WHERE commentid="+request.getParameter("id");
            ResultSet obj3=obj2.executeQuery(q);
            
            //Statement obj4=obj1.createStatement();
            //String q2="SELECT * FROM empreg";
            //ResultSet obj5=obj4.executeQuery(q2);
            
            //Statement obj6=obj1.createStatement();
            //String q3="SELECT * FROM empreg";
            //ResultSet obj7=obj6.executeQuery(q3);
            
            //Statement obj8=obj1.createStatement();
            //String q4="SELECT * FROM bugs WHERE bugid='"+request.getParameter("id")+"'";
            //ResultSet obj9=obj8.executeQuery(q4);
            while(obj3.next())
            {
        %>
        <h1 align="center">Edit this comment : </h1>
        <form action="editcommentINS.jsp" method="post">
            <table class="table2">
                <tr>
                    <td>Do you want to revoke this comment?</td>
                    <td> <input type="radio" name=active value="n">Yes<br>
                         <input type="radio" name=active value="y" checked>No
                    </td>
                </tr>
                <tr><td><br></td>
                    <td><br></td></tr>
                <tr>
                    <td>Comment : </td>
                    <td><textarea name=comment><%=obj3.getString("comment")%></textarea></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="hidden" name=rby value="<%=obj3.getString("rby")%>">
                        <input type="hidden" name=commentid value="<%=obj3.getString("commentid")%>">
                        <input type="submit" value="Change"></td>
                </tr>
                <tr>
                    <td><a href="view.jsp?id=<%=obj3.getString("rby")%>">Back</a></td>
                    <td></td>
                </tr>
            </table>
        </form>
    <%}%>
    </body>
</html>
