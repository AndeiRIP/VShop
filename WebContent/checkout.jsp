<%@page import="user.ShoppingCart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="items.*,user.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	if (null == session.getAttribute("username"))
		response.sendRedirect("login.jsp");
%>

<html>
<head>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>Checkout</title>
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
		<h2>Your Order</h2>
		<hr>
	</div>
	
	<div style="width: 400px; margin-left:auto; margin-right:auto;">
		<ul>
			
			<%
				ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
				double totalPrice = 0;
				for (Item it : cart.getItems()) {
					totalPrice += it.getPrice();
			%><li><%=cart.getNumberOfItems(it.getItemId())%> :: <%=it.getName()%></li>
			<%
				}
			%>
			<b>Total Price: <%=totalPrice%> </b>
			
			<br>
			<a href="confirmOrder.jsp" class="button expanded">Confirm Order</a></li>
		</ul>
	</div>	
	
	<div class="callout large secondary">
		<h5> Thnaks for shoping with us!</h5>
	</div>
</body>
</html>