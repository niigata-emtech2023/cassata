<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List, model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ検索結果</title>
	<link rel="icon" href="images/favicon.ico" id="favicon">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/button.css">
	<link rel="stylesheet" href="css/main-jsp.css">
	<link rel="stylesheet" href="css/busholist.css">
	<link rel="stylesheet" href="css/follow.css">
	<link rel="stylesheet" href="css/form.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap"
		rel="stylesheet">
</head>
<body class="follow-body">
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<!-- <div class="jsp-main-contents"> -->
	<div class="jsp-main-contents">
	<%
		List<UserBean> userList = (List<UserBean>) request.getAttribute("userList");
		String keyword = (String)request.getAttribute("keyword");
		request.setCharacterEncoding("UTF-8");
	%>

	
	<div class="bushoListFromHead">
		<div class="bushoHeadForm bushoflex">
			<form action="SearchUserSortServlet" method="POST">
			<label class="selectbox-003">
				<select name="sort">
					<option value="user_id">ID順</option>
					<option value="created_at">登録日順</option>
					<option value="u.birth_date">生年月日順</option>
				</select>
			</label>
			<label class="selectbox-003">
				<select name="order">
					<option value="ASC">昇順</option>
					<option value="DESC">降順</option>
				</select>
			</label>
				<input type="hidden" name="keyword" value="<%= keyword %>">
				<input class="formButton sortButton" type="submit" value="ソート">
			</form>
		</div>
		<div class="busholistheadtext bushoflex">
			検索結果
		</div>
		<div class="bushoHeadAdd bushoflex">
			キーワード：<%= keyword %>
		</div>
	</div>
	

			<!-- フォロー一覧の表示 -->
			<div class="followUserBox">
				
					<%
						for(UserBean user: userList){ 
					%>
					<div class="followUser">
						<div>
						<% if(user.getBushoImg() != null){ %>
							<img src="<%=user.getBushoImg() %>"  class="busho-img" alt="武将の顔写真">
						<% } else { %>
							<img src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k"  class="busho-img"  alt="武将の顔写真">
						<% } %>
						</div>
						<div class="follow-name">名前：<span><%=user.getNickname()%></span></div>
						<div class="follow-id">ID：<span><%=user.getUserID() %></span></div>
						<div class="follow-id">推しの武将：<span><%=user.getBushoName() %></span></div>
						<div>
							<form action="ShowOtherProfileServlet" method="POST">
								<input type="hidden" name="user_id" value="<%=user.getUserID() %>">
								<input class="formButton" type="submit" value="プロフィールへ">
							</form>
						</div>
					</div>
					<% } %>
				
			</div>
	</div>
	
</body>
</html>