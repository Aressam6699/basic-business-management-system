
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change username</title>
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
        <form name=f1 onsubmit="return valid()" action="changeusername2INS.jsp" method="post" onsubmit="return valid()">
            <table class="table2">
                <tr>
                    <td>Enter new username :</td>
                    <td><input type="text" name=user></td>
                </tr>
                <tr>
                    <td>Enter password :</td>
                    <td><input type="password" name=pass></td>
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
            Please enter the correct credentials.
            </font>           
            <%}
        %>
    </body>
</html>
