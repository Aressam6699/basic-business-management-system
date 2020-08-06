
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit department</title>
        <script src="validation.js" type="text/javascript" language="javascript"></script>
        <script language="javascript">
            function valid()
            {
                    if(isempty(document.f1.depname,"Field cannot be empty")){
                        return true;
                    }
                    return false;
            }
        </script>
        <link href="csspage.css" rel="StyleSheet" type="text/css">
    </head>
    <body>
        <h1 align="center">Edit department</h1>
        <%
            Connection obj1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull","root","aressam1999");
            Statement obj2=obj1.createStatement();
            String q="SELECT * FROM department WHERE depid='"+request.getParameter("id")+"'";
            ResultSet obj3=obj2.executeQuery(q);
            while(obj3.next())
            {
        %>
        <form action="editdepINS.jsp" method="post" name=f1 onsubmit="return valid()">
            <table class="table2">
                <tr>
                    <td>Department name : </td>
                    <td><input type="text" name=depname value="<%=obj3.getString("depname")%>"></td>
                </tr>
                <tr><td></td><td><input type="hidden" value="<%=request.getParameter("id")%>" name=hid><input type="submit" value="Edit"></td></tr>
                <tr><td><a href="viewdep.jsp">Back</a></td></tr>
            </table>
        </form>
                <%}%>
    </body>
</html>
