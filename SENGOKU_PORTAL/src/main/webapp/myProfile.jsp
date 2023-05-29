<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ</title>
</head>
<body>
    <% 
    	List<UserBean> userList
    		=(List<UserBean>) request.getAttribute("userList");
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
	<form action="ProfileSendServlet" method="POST">
		<%=user.getNickname() %><br>
		ID：<%=user.getUserID() %><br>
		自己紹介：<%=user.getMyself()%><br>
		性別：<%=user.getGender()%><br>
		生年月日：<%=user.getBirthDate()%><br>
		推しの武将：<%=user.getBushoID()%><br>
		出身地：<%=user.getArea()%><br>
		<% } %>	
		<input type="submit" value="プロフィール変更">	
	</form>	
</body>
</html>