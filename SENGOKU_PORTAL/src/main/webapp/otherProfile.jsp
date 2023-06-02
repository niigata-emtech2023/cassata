<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>他ユーザのページ</title>
<link rel="icon" href="images/favicon.ico" id="favicon">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/main-jsp.css">
<link rel="stylesheet" href="css/profile.css">
<link rel="stylesheet" href="css/form.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<div class="jsp-main-contents profile-contents">
	    <% 
	    	List<UserBean> userList = (List<UserBean>) request.getAttribute("userList");
	    	boolean followCheck = (boolean)request.getAttribute("followCheck");
	    %>
		<% for(UserBean user: userList){ %>
		<div class="profile_contents">
			<div class="profile-icon-box">
				<% if(user.getBushoImg() != null) {%>
					<img class="icon" src="<%=user.getBushoImg()%>"  alt="アイコン ">
				<% } else { %>
					<img class="icon" src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k"  alt="プロフィール写真">
				<% } %>
			</div>
			<div class="profile-box">
				<div class="ff">
					<div class="follow">
						<form method="POST" name="follow" action="FollowServlet">
							<input type="hidden" name="user_id" value="<%= user.getUserID() %>">
							<a href="javascript:follow.submit()"><p>フォロー </p></a>
						</form>
					</div>
					<div class="follower">
					    <form method="POST" name="follower" action="FollowerServlet">
							<input type="hidden" name="user_id" value="<%= user.getUserID() %>">
							<a href="javascript:follower.submit()"><p>フォロワー</p></a>
						</form>
					</div>
		    	</div>
		    		<div class="nickname">
						<!--ニックネーム -->
						<%=user.getNickname() %><br>
					</div>
					ID：<%=user.getUserID() %><br>
					
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
					
					<div class="profile-change">
					<% if(followCheck) {%>
						<form action="FollowRemoveServlet" method="POST">
							<input type="hidden" name="otherUserID" value="<%= user.getUserID() %>">
							<input type="hidden" name="myUserID" value="<%= (String)session.getAttribute("user_id") %>">
							<input class="formButton" type="submit" value="フォロー解除">	
						</form>
					<% } else {%>	
						<form action="FollowSubmitServlet" method="POST">
							<input type="hidden" name="otherUserID" value="<%= user.getUserID() %>">
							<input type="hidden" name="myUserID" value="<%= (String)session.getAttribute("user_id") %>">
							<input class="formButton" type="submit" value="フォローする">
						</form>
					<% } %>
					</div>
				
			</div>
		</div>
		<% } %>
	</div>
</body>
</html>