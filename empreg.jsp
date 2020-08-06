

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Employee registration</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
        $( function() {
        $( "#datepicker" ).datepicker();
        } );
        </script>
        <script src="validation.js" type="text/javascript" language="javascript"></script>
        <script language="javascript">
            function valid()
            {
                    if(isempty(document.f1.name,"Please enter the name of the employee")){
                    if(isempty(document.f1.dob,"Please enter the birthdate")){
                    if(isselect(document.f1.department,"Please select a daprtment")){  
                    if(isempty(document.f1.email,"Empty paramter email")){    
                    if(isemail(document.f1.email,"Invalid email(format: abc@def.in / abc@def.com)")){
                        if(isempty(document.f1.mobile,"Empty paramter mobile number")){
                        if(isnum(document.f1.mobile,"Invalid mobile number")){
                                if(islength(document.f1.mobile,10,10,"Mobile number should be of 10 digits")){
                        
                            
                return true;
            }}}}}}}}
                    return false;
            }
        </script>
        <link href="csspage.css" rel="StyleSheet" type="text/css">
    </head>
    
    <body>
        <%
            Connection obj1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull","root","aressam1999");
            Statement obj2=obj1.createStatement();
            String q="SELECT * FROM department";
            ResultSet obj3=obj2.executeQuery(q);
        %>
        <h1 align="center">Register an employee</h1>
        <form action="empregINS.jsp" method="post" name=f1 onsubmit="return valid()">
        <table class="table2">
            <tr>
                <td>Name</td>
                <td><input type="text" name=name></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
                    <input type="radio" name=gen value="m" checked>Male
                    <input type="radio" name=gen value="f">Female
                </td>
            </tr>
            <tr>
                <td>Birth Date</td>
                <td><input type="text" id="datepicker" name=dob value="01/01/1999"></td>
            </tr>
            <tr>
                <td>Department</td>
                <td>
                    
                    <select name=department>
                        <option value="sel">sel</option>
                    <%while(obj3.next())
                    {%>
                        <option value="<%=obj3.getString("depid")%>"><%=obj3.getString("depname")%></option>
                    <%}%>
                    </select>
                    
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="text" name=email></td>
            </tr>
            <tr>
                <td>Mobile</td>
                <td><input type="text" name=mobile></td>
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
                <td><input type="submit" value="enroll"></td>
            </tr>   
            <tr>
                <td><a href="manageemployees.jsp">Back</a></td>
            </tr>
        </table>
        </form>
        </body>
</html>
