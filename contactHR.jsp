<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact HR</title>
        <script src="validation.js" type="text/javascript" language="javascript"></script>
        <script language="javascript">
            function valid()
            {
                    if(isempty(document.f1.query,"Field cannot be empty")){
                    if(isselect(document.f1.auth,"Leader not selected")){
                        return true;
                    }}
                    return false;
            }
        </script>
        <link href="csspage.css" rel="StyleSheet" type="text/css">
    </head>
    <body>
        <%
            Connection obj1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull","root","aressam1999");
            Statement obj2=obj1.createStatement();
            String q="SELECT * FROM empreg WHERE department='5'";
            ResultSet obj3=obj2.executeQuery(q);
            
        %>
        <h1 align="center">Contact HR : </h1>
        <form action="contactHRINS.jsp" method="post" name=f1 onsubmit="return valid()">
            <table class="table2">
                    <td>Select an HR authority :</td>
                    <td>
                        
                        <select name=auth>
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
                    <td>Your query/complaint :</td>
                    <td>
                        <textarea name=query></textarea>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="hidden" value="<%=session.getAttribute("user")%>" name=hid><input type="submit" value="Go"></td>
                </tr
                <tr>
                    <td><a href="request.jsp">Back</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
