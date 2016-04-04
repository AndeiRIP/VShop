<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="user.*"%>

<%
	if(session.getAttribute("username") != null){
		response.sendRedirect("Browse.jsp");
	}
	String username = request.getParameter("username");
	String password = request.getParameter("userpass");
	UserRepository users = Users.getRepository();
	if (username != null && password != null)
		if (users.validate(username, password)) {
			session.setAttribute("username", username);
			response.sendRedirect("Browse.jsp");
		} else {
			out.print(" Wrong username / password ");
		}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/style.css">
</head>

<body>
<div class="container">
	<div id="login-form">
	
		<h3>Login</h3>
		
		<fieldset>
			<form id="loginform" action="login.jsp" method="post">
				
				<input type="text" name="username" value="UserName" onBlur="if(this.value=='')this.value='Email'" onFocus="if(this.value=='Email')this.value='' "/>

				<input type="password" name="userpass" value="Password" onBlur="if(this.value=='')this.value='Password'" onFocus="if(this.value=='Password')this.value='' "/>
				
				<input type="submit" value="Login" />
				
				<footer class="clearfix">
					<p><span class="info">?</span><a href="register.jsp">Register!</a></p>
				</footer>
			</form>
		</fieldset>
		
	<div>
</div>
</body>
</html>