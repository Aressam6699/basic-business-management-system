
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit project</title>
        <link href="csspage.css" rel="StyleSheet" type="text/css">
    </head>
    <body>
           <form action="editproINS.jsp" method="post">
        <%
            Connection obj1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull","root","aressam1999");
            Statement obj2=obj1.createStatement();
            String q="SELECT * FROM project WHERE pid='"+request.getParameter("id")+"'";
            ResultSet obj3=obj2.executeQuery(q);
            while(obj3.next())
            {
        %>
        <h1 align="center">Edit project</h1>
            <table class="table2">
            <tr>
                <td>Project name</td>
                <td><input type="text" name=proname value="<%=obj3.getString("proname")%>"></td>
            </tr>
            <tr>
                <td>Project description</td>
                <td><textarea name=prodes><%=obj3.getString("prodes")%></textarea></td>
            </tr>
            <tr>
                    <td>Client name : </td>
                    <td><input type="text" name=cname value="<%=obj3.getString("cname")%>"></td>
                </tr>
                <tr>
                    <td>Client contact number</td>
                    <td><input type="text" name=ccont value="<%=obj3.getString("ccont")%>"></td>
                </tr>
            <tr>
                <td>
                    Lead by:
                </td>
                
                <td><select name=lead>
                        <%
                            Statement obj4=obj1.createStatement();
                            String q2="SELECT * FROM empreg";
                            ResultSet obj5=obj4.executeQuery(q2);
                            while(obj5.next())
                            {
                                if(obj5.getString("eid").contains(obj3.getString("lead")))
                                {
                        %>
                        <option value=<%=obj5.getString("eid")%> selected><%=obj5.getString("name")%></option>
                        
                        <%
                            }
                            else
                            {
                        %>
                        <option value=<%=obj5.getString("eid")%>><%=obj5.getString("name")%></option>
                        <%
                            }}
                        %>
                    </select></td>
            </tr>
            <tr>
                <td>Submit</td>
                <td><input type="hidden" Value="<%=obj3.getString("pid")%>" name=hid><input type="submit"></td>
            </tr>
            
        </table>
            <%}%>
        </form>
        <a href="viewproject.jsp">Back</a>
    </body>
</html>
