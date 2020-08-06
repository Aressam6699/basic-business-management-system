
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin home</title>
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
            if(session.getAttribute("admin")==null)
            {
                response.sendRedirect("adminlogin.jsp");
            }
            
        %>
        <h1 align="center">Admin home</h1>
        Select file: <br />
<form action="fileupload.jsp" method="post" enctype="multipart/form-data">
<input type="file" name="file">
<br>
<input type="submit" value="Upload File">
</form>
        <table class="table2">
            <tr>
                <td>
                    <table class="table1">
                        <tr>
                            <td><a href="manageemployees.jsp">Manage employees</a></td>
                        </tr>
                        <tr>
                            <td><a href="department.jsp">Manage departments</a></td>
                        </tr>
                        <tr>
                            <td><a href="project.jsp">Manage projects</a></td>
                        </tr>
                        <tr>
                            <td><a href="viewreq.jsp">View requests</a></td>
                        </tr>
                        <tr>
                            <td><a href="techsupport.jsp">Tech support</a></td>
                        </tr>
                        <tr>
                            <td><a href="logout2.jsp">Log out</a></td>
                        </tr>
                    </table>
                </td>
                <td> Admin : <%=session.getAttribute("admin")%></td>
            </tr>
        </table>
    </body>
</html>








<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ADMIN HOME PAGE</title>
        <script type="text/javascript">
        function noBack() {
            window.history.forward()
        }
        noBack();
        window.onload = noBack;
        window.onpageshow = function (evt) { if (evt.persisted) noBack(); }
        window.onunload = function () { void (0); }

        </script>
	<style>
	.footer {
	   position: fixed;
	   left: 0;
	   bottom: 0;
	   width: 100%;
	   background-color: BLACK;
	   color: white;
	   text-align: center;
	}
	div.inl{
	display: inline;
	}
	#ip2 {
    border-radius: 25px;
    border: 2px solid #000;
    padding: 20px; 
    width: 200px;
    height: 15px;    
}
	#ip3 {
    border-radius: 25px;
    border: 2px solid #000;
    color: white;
    background-color: black;
    padding: 20px; 
    margin-bottom: 20px;
    width: 200px;
    height: 25px; 
    font-size: 20px;   
}
sidenav {
  height: 100%;
  width: 250px;
  position: fixed;
  z-index: 0;
  top: 0;
  left: 0;
  /*background-color: #111;*/
  overflow-x: hidden;
  padding-top: 0px;
  background-color: black;
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
}

.sidenav a:hover {
  color: #f1f1f1;
}
#ip1{
	display: inline;
}

.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 28px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
div.anim {
  width: 10px;
  height: 10px;
  background-color: grey;
  position: relative;
  -webkit-animation-name: example;
  -webkit-animation-duration: 10s; 
  animation-duration: 10s;
}

.zoom {
  transition: transform .2s; /* Animation */
  margin: 0 auto;
  color: black;
}

.zoom:hover {
  transform: scale(1.2); 

}

</style>
</head>
<body style="padding: 0; background-image: url('a.jpg');font-family: Lato, sans-serif;">
    <%
            if(session.getAttribute("admin")==null)
            {
                response.sendRedirect("adminlogin.jsp");
            }
            
        %>
	<!-- NAVIGATION BAR WITH LOGO -->
	<div class="w3-bar w3-black" style="background-color: black;opacity: 0.6;    padding: 0px" align="center">
            <h1 style="color: white">IWP Project</h1>
	</div>
	<!-- BODY -->
	<div class="container">
		<div class="row">
			<div style="float: left; color:black;height: 450px" class="sidenav col-sm-4">
				<a href="#about" class="zoom">About</a>
				  <a href="#services"class="zoom">Services</a>
				  <a href="#clients"class="zoom">Clients</a>
				  <a href="#contact" class="zoom">Contact</a>
			</div>
			
			<div style="" class="sidenav col-sm-8" align="center">
				<h2 align=""><u>ADMIN HOME</u>         </h2>
				<div style="width: 600px; height: 350px; background-color: black;padding-bottom: 30px">
					<br><br>
					<!-- <div class="anim"></div> -->
					<div style="width: 540px; height: 300px; background-color: grey;padding: 10;vertical-align:middle;line-height:30px;" align="center" >
						<br>
						<table border="1px;solid" bgcolor="white" style="border-image: url('a.jpg')">
							<tr>
								<td>USERNAME:</td><td>abc</td>
							</tr>
							<tr>
								<td>NAME:</td>
								<td>abc</td>
							</tr>
							<tr>
								<td>CONTACT:</td>
								<td>123</td>
							</tr>
							<tr>
								<td>EMAIL</td>
								<td>mahima.shrivastava</td>
							</tr>
							<tr>
								<td>UPLOAD:</td>
								<td><form action="action_page.php">
		  							<input type="file" name="myFile"><br><br>
		  							<input type="submit">
									</form>
								</td>
							</tr>
							
						</table>
					</div>
					
				</div>
			</div>
		</div>
	</div>

	
	<!-- FOOTER -->
	<div class="footer">
		<div class="row">		
			<p align="center" style="color: grey">
				<u>GROUP MEMBERS:</u><br>
					MAHIMA SHRIVASTAVA<br>
					SAMARTH NAIR
			</p>
		</div>
	</div>

</body>
</html>