<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顧客の削除確定（管理者専用画面）</title>
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
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<div class="jsp-main-contents">
		<%
			List<UserBean> userList =(List<UserBean>) request.getAttribute("userList"); 
		%>
		<%
			for(UserBean user: userList){ 
		%>
		<!--プロフィール写真：-->
		<div class="profile_contents" >
		<div class="profile-icon-box">
		<img class="icon" src="<%=user.getBushoImg() %>" alt="武将の顔写真">	
		</div>
		<div class="profile-box">
		<span class="nickname">
		ニックネーム：<%=user.getNickname() %><br>
		</span>
		ID：<%=user.getUserID() %><br>
		自己紹介：<%=user.getMyself() %><br>	
		性別：<%=user.getGender() %><br>
		生年月日：<%=user.getBirthDate() %>	<br>
		推しの武将：<%=user.getBushoName() %><br>
		出身地：<%=user.getArea() %><br>
		<%} %>
		以上のユーザを削除しました
		<form action="ShowCustomerServlet" method="POST">
		<div class="profile-change">
			<input type="submit" value="一覧へ">
			</div>
		</form>
		</div>
	</div>
	</div>
</body>
</html>