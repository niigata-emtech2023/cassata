<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>他ユーザのページ</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/main-jsp.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap"
	rel="stylesheet">
</head>
<body>
    <% 
    	List<UserBean> userList = (List<UserBean>) request.getAttribute("userList");
    	boolean followCheck = (boolean)request.getAttribute("followCheck");
    %>
	<% for(UserBean user: userList){ %>
	
		<% if(user.getBushoImg() != null) {%>
			<img src="<%=user.getBushoImg()%>"  alt="プロフィール写真">
		<% } else { %>
			<img src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k"  alt="プロフィール写真">
		<% } %>
		<form method="POST" name="follow" action="FollowServlet">
			<input type="hidden" name="user_id" value="<%= user.getUserID() %>">
			<a href="javascript:follow.submit()"><p>フォロー </p></a>
		</form>
	    <form method="POST" name="follower" action="FollowerServlet">
			<input type="hidden" name="user_id" value="<%= user.getUserID() %>">
			<a href="javascript:follower.submit()"><p>フォロワー</p></a>
		</form>
	    
		<!--ニックネーム -->
		<%=user.getNickname() %><br>
		ID：<%=user.getUserID() %><br>
		自己紹介：<%=user.getMyself()%><br>
		性別：<%=user.getGender()%><br>
		生年月日：<%=user.getBirthDate()%><br>
		推しの武将：<%=user.getBushoName()%><br>
		出身地：<%=user.getArea()%><br>
		
	
		<% if(followCheck) {%>
			<form action="FollowRemoveServlet" method="POST">
				<input type="hidden" name="otherUserID" value="<%= user.getUserID() %>">
				<input type="hidden" name="myUserID" value="<%= (String)session.getAttribute("user_id") %>">
				<input type="submit" value="フォロー解除">	
			</form>
		<% } else {%>	
			<form action="FollowSubmitServlet" method="POST">
				<input type="hidden" name="otherUserID" value="<%= user.getUserID() %>">
				<input type="hidden" name="myUserID" value="<%= (String)session.getAttribute("user_id") %>">
				<input type="submit" value="フォローする">	
			</form>
		<% } %>
		
	<% } %>
</body>
</html>