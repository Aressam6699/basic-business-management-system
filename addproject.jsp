

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create a project</title>
        <script src="validation.js" type="text/javascript" language="javascript"></script>
        <script language="javascript">
            function valid()
            {
                    if(isempty(document.f1.proname,"Field cannot be empty")){
                    if(isempty(document.f1.prodes,"Field cannot be empty")){
                    if(isempty(document.f1.cname,"Field cannot be empty")){
                    if(isempty(document.f1.ccont,"Field cannot be empty")){
                        if(isnum(document.f1.ccont,"Invalid mobile number")){
                            if(islength(document.f1.ccont,10,10,"10 digits")){
                        
                    if(isselect(document.f1.lead,"Leader not selected")){
                        return true;
                    }}}}}}}
                    return false;
            }
        </script>
        <link href="csspage.css" rel="StyleSheet" type="text/css">
    </head>
    <body>
        <%
            Connection obj1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull","root","aressam1999");
            Statement obj2=obj1.createStatement();
            String q="SELECT * FROM empreg";
            ResultSet obj3=obj2.executeQuery(q);
            
        %>
        <h1 align="center">Create project : </h1>
        <form action="addprojectINS.jsp" method="post" name=f1 onsubmit="return valid()">
            <table class="table2">
                <tr>
                    <td>Name of the project : </td>
                    <td><input type="text" name=proname></td>
                </tr>
                <tr>
                    <td>Project description : </td>
                    <td><textarea name=prodes></textarea></td>
                </tr>
                <tr>
                    <td>Client name : </td>
                    <td><input type="text" name=cname></td>
                </tr>
                <tr>
                    <td>Client contact number</td>
                    <td><input type="text" name=ccont></td>
                </tr>
                <tr>
                    <td>Lead by:</td>
                    <td>
                        
                        <select name=lead>
                            <option value="sel">sel</option>
                            <%
                            while(obj3.next())
                            {
                        %>
                            <option value="<%=obj3.getString("eid")%>"><%=obj3.getString("name")%></option>
                        <%
                            }
                        %>
                        </select>
                        
                    </td>
                </tr>
                <tr>
                    <td>Is active?</td>
                    <td>
                        <input type="radio" name=status value="y" checked>YES
                        <input type="radio" name=status value="n">NO
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Assign"></td>
                </tr
                <tr>
                    <td><a href="project.jsp">Back</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
