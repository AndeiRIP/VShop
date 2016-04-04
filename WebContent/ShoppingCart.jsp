<%@ page errorPage="errorpage.jsp"%>
<%@ page import="java.util.*,items.*"%>

<jsp:useBean id="cart" scope="session" class="user.ShoppingCart" />
<%
	if (null == session.getAttribute("username"))
		response.sendRedirect("login.jsp");

	String itemID = request.getParameter("id");
	if (itemID != null) {
		cart.removeItem(itemID);
		response.reset();
	}
%>
<html>
<head>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>Shopping Cart</title>
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
		<h2>Your Products</h2>
		<hr>
	</div>
	
	<center>
		<table width="300" border="1" cellspacing="0" cellpadding="2"
			border="0">
			<tr>
				<th>Name</th>
				<th>Price</th>
				<th>Quantity</th>

			</tr>
			<%
				Collection<Item> itemsInCart = cart.getItems();
				for (Item item : itemsInCart) {
			%>
			<tr>
				<form action="ShoppingCart.jsp" method="post">
					<td><%=item.getName()%></td>
					<td align="center">$<%=item.getPrice()%></td>
					<td align="center"><%=cart.getNumberOfItems(item.getItemId())%></td>
					<td><a href="ShoppingCart.jsp?id=<%=item.getItemId()%>">Remove</a>
				</form>
			</tr>
			<%
				}
			%>
			<tr>
				<td>Total sum</td>
				<td>
					<%
						out.print(cart.getCost());
					%>
				</td>
			</tr>
		</table>
	</center>
	
	<br><br><br><br>
	<div style="width: 200px; height:100px; margin-left:auto; margin-right:auto;">
		<a href="checkout.jsp" class="button expanded"><b>Checkout</b></a>
		<a href="Browse.jsp" class="button small expanded hollow"><b>Back to Catalog</b></a>
	</div>
	
	<div class="callout large secondary">
		<h5> Thanks for shoping with us!</h5>
	</div>
</body>
</html>