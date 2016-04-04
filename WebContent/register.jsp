<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="user.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String username = request.getParameter("username");
	String userpass = request.getParameter("userpass");
	String passconfirm = request.getParameter("passconfirm");

	String message = null;

	if (username != null && userpass != null) {

		if (!userpass.equals(passconfirm)) {
			message = "Passwords do not match";
		} else if (Users.getRepository().contains(username)) {
			message = String.format("User already taken: '%s'",
					username);
		} else {
			if (Users.getRepository().addUser(
					new UserDetails(username, userpass))) {
				message = String.format(
						"User '%s' succesfully registered", username);
			} else {
				message = String.format(
						"User '%s' could not be registered", username);
			}
		}
	}
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Registration</title>
	<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<%-- 
	<script type="text/javascript">
		function confirmpass(form) {
			if (form.userpass.value == "") {
				alert("Empty password field.");
				return false;
			} else if (form.userpass.value != form.confirmpass.value) {
				alert("Password fields do not match.");
				return false;
			}
			else return true;

		}
	</script> --%>

	<%
		if (message != null) {
	%><div style="padding: 5px; border: 1px solid #666;"><%=message%></div>
	<%
		}
	%>

<div class="container">
	<div id="login-form">
	
		<h3>Register</h3>
		
		<fieldset>	
		
			<form id="registeruser" action="register.jsp" method="post">
				<input type="text" name="username" value="UserName" onBlur="if(this.value=='')this.value='Email'" onFocus="if(this.value=='Email')this.value='' "/>
				
				<input type="password" name="userpass" value="Password" onBlur="if(this.value=='')this.value='Password'" onFocus="if(this.value=='Password')this.value='' "/>
				
				<input type="password" name="passconfirm" value="Password" onBlur="if(this.value=='')this.value='Password'" onFocus="if(this.value=='Password')this.value='' "/>
				
				<input type="submit" value="Register" name="registerformsubmit" />
				
				<footer class="clearfix">
					<p><span class="info">?</span><a href=login.jsp>Back to Login!</a></p>
				</footer>
			</form>
			
		</fieldset>
	<div>
</div>
</body>
</html>