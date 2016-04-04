<%@page import="user.ShoppingCart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="orders.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	if (null == session.getAttribute("username"))
		response.sendRedirect("login.jsp");

	ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
	Orders.getRepository().addOrder(
			new Order((String) session.getAttribute("username"), cart
					.toString()));
	cart.removeAllItems();
%>
<head>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
</head>
<body>
	<div class="top-bar">
		<div class="top-bar-right">
			<a href="logout.jsp">Logout :: <%=session.getAttribute("username")%></a>
		</div>
	</div>
	
	<hr>
	<div class="row column text-center">
		<h2>Order succesfully submited.</h2>
		<hr>
	</div>
	
	<br><br><br><br>
	<div style="width: 200px; height:100px; margin-left:auto; margin-right:auto;">
		<a href="Browse.jsp" class="button expanded"><b>Back To Browse</b></a>
	</div>
	
	<div class="callout large secondary">
		<h5> Thanks for shoping with us!</h5>
	</div>
</body>
</html>