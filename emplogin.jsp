
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee login</title>
        <script src="validation.js" type="text/javascript" language="javascript"></script>
        <script language="javascript">
            function valid()
            {
                    if(isempty(document.f1.user,"please enter username")){
                    if(isempty(document.f1.pass,"please enter a password")){
                return true;
                    }}
                    return false;
            }
        </script>
        <link href="csspage.css" rel="StyleSheet" type="text/css">
        <script type="text/javascript">
        function noBack() {
            window.history.forward()
        }
        noBack();
        window.onload = noBack;
        window.onpageshow = function (evt) { if (evt.persisted) noBack(); }
        window.onunload = function () { void (0); }
        </script>   
    </head>
    <body>
        <h1 align="center">Employee login</h1>
        <form name=f1 onsubmit="return valid()" action="emploginINS.jsp" method="post">
            <table class="table2">
                <tr>
                    <td>Username:</td>
                    <td><input type="text" name=user></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name=pass></td>
                </tr>
                <tr><td><input type="submit" value="Log-in"></td></tr>
            </table>
        </form>
         <br>
        <br>
        <%
            if(request.getParameter("id")!=null)
            {%>
            <font color="red">
            Wrong username or password
            </font>           
            <%}
        %>
        <a href="link.jsp">Back</a>
    </body>
</html>
