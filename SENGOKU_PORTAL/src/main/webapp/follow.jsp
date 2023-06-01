<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.FollowBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>フォロー一覧</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/main-jsp.css">
<link rel="stylesheet" href="css/follow-follower.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap"
	rel="stylesheet">
</head>
<body>
	<% 
		List<FollowBean> followList=(List<FollowBean>) request.getAttribute("followList");
	%>
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<div class="jsp-main-contents">
		<div class="name">フォロー一覧</div><br>
		<%
			for(FollowBean follow: followList){ 
		%>
			<% if(follow.getBushoImg() != null){ %>
				<img src="<%=follow.getBushoImg() %>"  alt="武将の顔写真">
			<% } else { %>
				<img src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k"  alt="武将の顔写真">
			<% } %><br>
			
			<%=follow.getNickname()%><br>
			ID：<%=follow.getUserID() %><br>
		<% } %>
	</div>
</body>
</html>