

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create a department</title>
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
        <h1 align="center">Create department</h1>
        <form action="adddepINS.jsp" method="post" name=f1 onsubmit="return valid()">
            <table class="table2">
                <tr>
                    <td>Name of the department : </td>
                    <td><input type="text" name=depname></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Create"></td>
                </tr
                <tr>
                    <td><a href="department.jsp" class="button">Back</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
