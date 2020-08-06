<html>
<head>
	<title>LOGIN PAGE PAGE</title>
        <script type="text/javascript">
        function noBack() {
            window.history.forward()
        }
        noBack();
        window.onload = noBack;
        window.onpageshow = function (evt) { if (evt.persisted) noBack(); }
        window.onunload = function () { void (0); }
        </script>   
       <script src="validation.js" type="text/javascript" language="javascript"></script>
        <script language="javascript">
            function valid()
            {
                    if(isempty(document.f1.admin,"please enter admin id")){
                    if(isempty(document.f1.pass,"please enter a password")){
                return true;
                    }}
                    return false;
            }
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
/*    padding: 20px; */
    width: 200px;
    height: 35px;    
}
	#ip3 {
    border-radius: 25px;
    border: 2px solid #000;
    color: white;
    background-color: black;
</style>
</head>
<body style="padding: 0; background-image: url('black.jpg');">
	<!-- NAVIGATION BAR WITH LOGO -->
	<div class="w3-bar w3-black" style="background-color: black;opacity: 0.6;    padding: 0px" align="center">
            <h1 style="color: white">IWP Project</h1>
	</div>
	<!-- BODY -->
	<div align="center" style="padding: 10px">
	<h1 align="center" style="color: white"><u>BUSINESS MANAGEMENT SYSTEM</u></h1>
	<h2 align="center" style="color: white"><u>ADMIN LOGIN</u></h2>
	<div align="center" style="background-color: grey; color: white;height: 250px;width: 500px;">

		<form action="adminloginINS.jsp" method="POST">
			<br>
			<table>
			<tr>
				<td style="font-size: 20px;color: black">ADMIN ID</td>
				<td ><input type="text" name="admin" id="ip2"><br><br></td>
			</tr>
			<tr>
				<td style="font-size: 20px; color: black">PASSWORD</td>
				<td><input type="password" name="pass" id="ip2"><br><br></td>
			</tr>
			<tr align="center">
				
				<td colspan="2" style="font-size: 20px"><input type="submit" name="submit" value="SUBMIT" id="ip3"></input>&nbsp<button onclick="window.location.href='link.jsp';" id="ip3">BACK</button></td>

			
			</tr>
		</table>
		</form>
		<br>
        <br>
        <%
            if(request.getParameter("id")!=null)
            {%>
            <font color="red">
            <h5 align="center">Wrong admin id or password</h5>
            </font>           
            <%}
        %>
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


