
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee home</title>
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
        <%
            if(session.getAttribute("user")==null)
            {
                response.sendRedirect("emplogin.jsp");
            }
          
            
            Connection obj1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull","root","aressam1999");
            Statement obj2=obj1.createStatement();
            String q="SELECT * FROM empreg WHERE username='"+session.getAttribute("user")+"'";
            ResultSet obj3=obj2.executeQuery(q);
            while(obj3.next())
            {
            %>
        <h1>User : <%=obj3.getString("name")%></h1>
        <table class="table1">
            
            <tr>
                <td><a href="changeusername.jsp?id=<%=session.getAttribute("user")%>">Change username</a></td>
            </tr>
            <tr>
                <td><a href="changepassword.jsp?id=<%=session.getAttribute("user")%>">Change password</a></td>
            </tr>
            <tr>
                <td><a href="reportbug.jsp?id=<%=session.getAttribute("user")%>">Report a bug</a></td>
            </tr>
            <tr>
                <td><a href="ownbug.jsp?id=<%=session.getAttribute("user")%>">View bugs I reported</a></td>
            </tr>
            <tr>
                <td><a href="mybugs.jsp?id=<%=obj3.getString("eid")%>">View bugs reported to me</a></td>
            </tr>
            <tr>
                <td><a href="view.jsp?id=<%=obj3.getString("eid")%>">View all solutions you gave</a></td>
            </tr>
            <tr>
                <td><a href="request.jsp?id=<%=obj3.getString("eid")%>">Contact authority</a></td>
            </tr>
            <tr>
                <td><a href="logout.jsp">Logout</a></td>
            </tr>
        </table>
        <%
            }
        %>
    </body>
</html>
