<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.FollowBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>フォロー一覧</title>
</head>
<body>
	<% 
		List<FollowBean> followList=(List<FollowBean>) request.getAttribute("followList");
	%>
	
	フォロー一覧<br>
	<%
		for(FollowBean follow: followList){ 
	%>
	<% if(follow.getBushoImg() != null){ %>
		<img src="<%=follow.getBushoImg() %>"  alt="武将の顔写真">
	<% } else { %>
		<img src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k"  alt="武将の顔写真">
	<% } %>
	
	<%=follow.getNickname()%><br>
	ID：<%=follow.getUserID() %><br>
	<% } %>
</body>
</html>