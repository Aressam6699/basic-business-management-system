
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html charset=UTF-8">
        <title>Edit bug</title>
        <link href="csspage.css" rel="StyleSheet" type="text/css">
    </head>
    <body>
        <%
            Connection obj1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugtracker?zeroDateTimeBehavior=convertToNull","root","aressam1999");
            Statement obj2=obj1.createStatement();
            String q="SELECT * FROM project WHERE status='y'";
            ResultSet obj3=obj2.executeQuery(q);
            
            Statement obj4=obj1.createStatement();
            String q2="SELECT * FROM empreg";
            ResultSet obj5=obj4.executeQuery(q2);
            
            Statement obj6=obj1.createStatement();
            String q3="SELECT * FROM empreg";
            ResultSet obj7=obj6.executeQuery(q3);
            
            Statement obj8=obj1.createStatement();
            String q4="SELECT * FROM bugs WHERE bugid='"+request.getParameter("id")+"'";
            ResultSet obj9=obj8.executeQuery(q4);
            while(obj9.next())
            {
        %>
        <h1 align="center">Edit this bug</h1>
        <form action="editbugINS.jsp" method="post">
            <table class="table2">
                <tr>
                    <td>Do you want to revoke this bug?</td>
                    <td> <input type="radio" name=active value="n">Yes<br>
                         <input type="radio" name=active value="y" checked>No
                    </td>
                </tr>
                <tr><td><br></td>
                    <td><br></td></tr>
                <tr>
                    <td>Project : </td>
                    <td>
                        <select name=project>
                            <%while(obj3.next())
                            {
                                if(obj3.getString("pid").contains(obj9.getString("project")))
                                {
                            %>
                            <option value="<%=obj3.getString("pid")%>" selected><%=obj3.getString("proname")%></option>
                            <%
                            }
                            else
                                {
                            %>
                            <option value="<%=obj3.getString("pid")%>"><%=obj3.getString("proname")%></option>
                            <%
                                }
                            }
                            %>
                        </select>
                    </td>
                </tr>
                <tr><td><br></td>
                    <td><br></td>
                </tr>
                <tr>
                    <td>Bug name</td>
                    <td><input type="text" name=bug value="<%=obj9.getString("bug")%>"></td>
                </tr>
                <tr><td><br></td>
                    <td><br></td>
                </tr>
                <tr>
                    <td>Bug description</td>
                    <td><textarea name=bugdes><%=obj9.getString("bugdes")%></textarea></td>
                </tr>
                <tr><td><br></td>
                    <td><br></td>
                </tr>
                <tr>
                    <td>Assign bug to : </td>
                    <td>
                        <select name=assign>
                            <option value="sel">sel</option>
                            <%while(obj5.next())
                            {
                                if(obj5.getString("eid").contains(obj9.getString("assign")))
                                {
                            %>
                            <option value="<%=obj5.getString("eid")%>" selected><%=obj5.getString("name")%></option>
                            <%
                            }
                                else
                                {
                            %>
                            <option value="<%=obj5.getString("eid")%>"><%=obj5.getString("name")%></option>
                            <%
                                }
                            }
                            %>
                        </select>
                    </td>
                </tr>
                <tr><td><br></td>
                    <td><br></td>
                </tr>
                
                <tr>
                    <td>Priority:</td>
                    <td>
                        <%
                        if(obj9.getString("status").contains("H"))
                        {
                        %>
                        <input type="radio" name=status value="H" checked>High<br>
                        <input type="radio" name=status value="M">Medium<br>
                        <input type="radio" name=status value="L">Low
                        <%
                        }
                        else if(obj9.getString("status").contains("M"))
                        {
                        %>
                        <input type="radio" name=status value="H">High<br>
                        <input type="radio" name=status value="M" checked>Medium<br>
                        <input type="radio" name=status value="L">Low
                        <%
                        }
                        else
                        {
                        %>
                        <input type="radio" name=status value="H">High<br>
                        <input type="radio" name=status value="M">Medium<br>
                        <input type="radio" name=status value="L" checked>Low
                        <%
                        }
                        %>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="hidden" value="<%=request.getParameter("id")%>" name=hid2>
                        <input type="hidden" value="<%=session.getAttribute("user")%>" name=hid><input type="submit" value="Submit change"></td>
                    
                </tr>
                <tr>
                    <td><a href="emphome.jsp">Back</a></td>
                    <td></td>
                </tr>
            </table>
        </form>
    <%}%>
    </body>
</html>
