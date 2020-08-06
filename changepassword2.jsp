
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change password</title>
        <script src="validation.js" type="text/javascript" language="javascript"></script>
        <script language="javascript">
            function valid()
            {
                    if(isempty(document.f1.password,"please enter old password")){
                    if(isempty(document.f1.p1,"please enter a new password")){
                    if(isempty(document.f1.p2,"please re enter new password to confirm")){
                    if(iscompare(document.f1.p1,document.f1.p2,"passwords didnt match")){                                    
                return true;
            }}}}
                    return false;
            }
        </script>
        <link href="csspage.css" rel="StyleSheet" type="text/css">
    </head>
    <body>
        <form name=f1 onsubmit="return valid()" action="changepassword2INS.jsp" method="post" onsubmit="return valid()">
            <table class="table2">
                <tr>
                    <td>Enter old password</td>
                    <td><input type="password" name=password></td>
                </tr>
                <tr>
                    <td>Enter new password</td>
                    <td><input type="password" name=p1></td>
                </tr>
                <tr>
                    <td>Confirm new password</td>
                    <td><input type="password" name=p2></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="hidden" value="<%=request.getParameter("id")%>" name="hid"><input type="submit" value="change"></td>
                </tr>
                <tr><td> <a href="HRhome.jsp">Back</a></td></tr>
            </table>
        </form>
               
                <br>
                <br>
                <%
            if(request.getParameter("id2")!=null)
            {
                %>
            
            <font color="red">
            Problem in updating password.<br>Please enter correct password.
            </font>           
            <%}
        %>
    </body>
</html>
