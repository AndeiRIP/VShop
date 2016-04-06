<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="items.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String itemId = request.getParameter("id");
	Item it = Items.getRepository().getItem(itemId);
%>

<html>
<head>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<link rel="stylesheet" href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
	<title><%=it.getName()%></title>
</head>
<body>

	<div class="top-bar">
		<div class="top-bar-right">
			<a href="logout.jsp">Logout :: <%=session.getAttribute("username")%></a>
		</div>
	</div>

	<hr>
	<div class="row column text-center">
		<h2><%=it.getName() %></h2>
		<hr>
	</div>

	<div style="align:left">
		Name::<%=it.getName() %><br>
		Description::<%=it.getDesc() %><br>
		Price::<%=it.getPrice() %>
	</div>
	
	<div style="align:right">
		<img src="<%=it.getImagePath()%>" />
	</div>
	
	<textarea name="commentArea" rows="10" cols="20"></textarea>
	<ul>
		<%
			for (Comment com : it.getComments()) {
		%><li><%=com.getUserName()%>: <%=com.getComment()%></li>
		<%
			}
		%>
	</ul>
	
	<div class="callout large secondary">
		<h5> Thanks for shoping with us!</h5>
	</div>

</body>
</html>