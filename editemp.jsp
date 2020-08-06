

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
        <title>Edit employee details</title>
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
            String q="SELECT * FROM empreg WHERE eid='"+request.getParameter("id2")+"'";
            ResultSet obj3=obj2.executeQuery(q);
            while(obj3.next())
            {
            %>
        <h1 align="center">Edit details : </h1>
        <form action="editempINS.jsp" method="post" name=f1 onsubmit="return valid()">
        <table class="table2">
            <tr>
                <td>Name</td>
                <td><input type="text" name=name value="<%=obj3.getString("name")%>"></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
                    <%
                        if(obj3.getString("gen").contains("m"))
                        {
                    %>
                    <input type="radio" name=gen value="m" checked>Male
                    <input type="radio" name=gen value="f">Female
                    
                    <%
                        }
                        else
                        {
                    %>
                    
                    <input type="radio" name=gen value="m">Male
                    <input type="radio" name=gen value="f" checked>Female
                    <%
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td>Birth Date</td>
                <td><input type="text" id="datepicker" name=dob value="<%=obj3.getString("dob")%>"></td>
            </tr>
            <tr>
                <td>Department</td>
                <td>
                    <select name=department>
                    <%
                        Statement obj4=obj1.createStatement();
                        String q2="SELECT * FROM department";
                        ResultSet obj5=obj4.executeQuery(q2);
                        while(obj5.next())
                        {
                        if(obj5.getString("depid").contains(obj3.getString("department")))
                        {
                    %>
                        <option value="<%=obj5.getString("depid")%>" selected><%=obj5.getString("depname")%></option>
                    <%
                    }
                        else
                        {
                    %>
                    <option value="<%=obj5.getString("depid")%>"><%=obj5.getString("depname")%></option>
                   <%
                        }
                        }
                   %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="text" name=email value="<%=obj3.getString("email")%>"></td>
            </tr>
            <tr>
                <td>Mobile</td>
                <td><input type="text" name=mobile value="<%=obj3.getString("mobile")%>"></td>
            </tr> 
            <tr>
               <td>Is active?</td>
                    <td>
                        
                        
                        <%
                                if(obj3.getString("status").contains("y"))
                                {
                        %>
                                <input type="radio" value="y" name=status checked>YES
                                <input type="radio" value="n" name=status>NO
                                    <%
                                }
                                else
                                {                                       
                                    %>
                                <input type="radio" value="y" name=status>YES
                                <input type="radio" value="n" name=status checked>NO
                                    <%
                                }
                                    %>
                        
                                    
                                    
                    </td>               
                </td>
            </tr>
            <tr>
                <td><input type="hidden" name=hid value="<%=request.getParameter("id2")%>"><input type="submit" value="Submit"></td>
            </tr>    
            <tr>
                <td><a href="manageemployees.jsp">Back</a></td>
            </tr>
        </table>
<%  
            }
%>
        </form>
    </body>
</html>
