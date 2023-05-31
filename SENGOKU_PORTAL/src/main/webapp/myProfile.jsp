<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/main-jsp.css">
<link rel="stylesheet" href="css/profile.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="jsp-main-contents">
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="myProfile" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="myProfile" />
	</jsp:include>
	
    <% 
    	request.setCharacterEncoding("UTF-8");
    	List<UserBean> userList
    		=(List<UserBean>) request.getAttribute("userList");
    %>
	<% for(UserBean user: userList){ %>
	
	
	<div class="profile_contents" >
		<div class="profile-icon-box">
			<% if(user.getBushoImg() != null) {%>
				<img class="icon" src="<%=user.getBushoImg()%>"  alt="プロフィール写真">
			<% } else { %>
				<img src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k"  alt="プロフィール写真">
			<% } %>
		</div>
		<div class="profile-box">
	    	<form method="POST" name="follow" action="FollowServlet">
				<input type="hidden" name="user_id" value="<%= user.getUserID() %>">
				<a href="javascript:follow.submit()">フォロー</a>
			</form>
		    <form method="POST" name="follower" action="FollowerServlet">
				<input type="hidden" name="user_id" value="<%= user.getUserID() %>">
				<a href="javascript:follower.submit()">フォロワー</a>
			</form>
				
			 	<%=user.getNickname()%><br> 
				ID：<%=user.getUserID()%><br> 
				
				<!-- 自己紹介 -->
				<% if(user.getMyself() == null){%>
					自己紹介：未設定<br>
				<% } else { %>
					自己紹介：<%= user.getMyself() %><br>
				<% } %>
				
				<!-- 性別 -->
				<% if(user.getGender() == 1){ %>
					性別：不明<br> 
				<% } else if(user.getGender() == 2){ %>
					性別：男性<br>
				<% } else { %>
					性別：女性<br>
				<% } %>
				
				
				<% if(user.getBirthDate() == null) {%>
					生年月日：未設定<br>
				<% } else { %>
					生年月日：<%=user.getBirthDate()%><br> 
				<% } %>
				
				<% if(user.getBushoName() == null) {%>
					推しの武将：未設定<br>
				<% } else { %>
					推しの武将：<%=user.getBushoName()%><br>
				<% } %>
				
				<!--  出身地 -->
				<% if(user.getArea() == null || user.getArea().equals("")){%>
					出身地：未設定<br>
				<% } else { %>
					出身地：<%= user.getArea() %><br>
				<% } %>
				
			<form action="ProfileSendServlet" method="POST">
				<input type="hidden" name="busho_img" value="<%= user.getBushoImg() %>">
				<input type="hidden" name="nickname" value="<%=user.getNickname() %>">
				<input type="hidden" name="user_id" value="<%=user.getUserID()%>">
				<input type="hidden" name="myself" value="<%=user.getMyself() %>">
				<input type="hidden" name="gender" value="<%=user.getGender() %>">
				<input type="hidden" name="birth_date" value="<%=user.getBirthDate() %>">
				<input type="hidden" name="busho_id" value="<%=user.getBushoID() %>">
				<input type="hidden" name="area" value="<%=user.getArea()%>">
		
				<input type="submit" value="プロフィール変更">
			</form>	
		</div>
	<% } %>
	</div>
</body>
</html>