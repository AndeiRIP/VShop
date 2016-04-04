<%@page import="user.ShoppingCart"%>
<%@ page errorPage="errorpage.jsp"
	import="items.Item,items.Items,items.ItemRepository"%>

<jsp:useBean id="cart" scope="session" class="user.ShoppingCart" />
<%
	if (session.getAttribute("username") == null) {
		response.sendRedirect("login.jsp");
	}
%>
<html>
<head>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>Browse Catalog</title>
	<link rel="stylesheet" href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
</head>

<body>
	<%
		String id = request.getParameter("id");
		String message = "";
		if (id != null) {
			Item it = Items.getRepository().getItem(id);
			cart.addItem(it);
			message = String
					.format("Item '%s' added to cart", it.getName());
		}
	%>
	
	<div class="top-bar">
		<a href="ShoppingCart.jsp">Shopping Cart Quantity:</a>
		<%=cart.getNumOfItems()%>
		
		<div class="top-bar-right">
			<a href="logout.jsp">Logout :: <%=session.getAttribute("username")%></a>
		</div>
	</div>
	
	<hr>
	<div class="row column text-center">
		<h2>Our Products</h2>
		<hr>
	</div>
	
	<%
		if (!message.equals("")) {
	%>
			<div style="padding: 5px; border: 1px solid #666;"><%=message%></div>
	<%
		}
	%>
	
	<!-- Display Items -->
	<div class="row small-up-2 large-up-4">
	<%
		ItemRepository repos = Items.getRepository();

		for (Item it : repos.getItems()) {
	%>
		<div class="column">
			<a href="ItemDisplay.jsp?id=<%=it.getItemId()%>"><img src=<%=it.getImagePath()%> width="300" height="400"></a>
			<h5><%=it.getName()%></h5>
			<p>$<%=it.getPrice()%></p>
			<a action="Browse.jsp" href="Browse.jsp?id=<%=it.getItemId()%>" class="button expanded">Add</a>
		</div>
	<%
		}
	%>
	</div>
	<hr>

	<div class="callout large secondary">
		<h5> Thnaks for shoping with us!</h5>
	</div>
	
</body>
</html>