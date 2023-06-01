<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="icon" href="images/favicon.ico" id="favicon">
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
		request.setCharacterEncoding("UTF-8");
	
		int authority = 1;
		
		if(session.getAttribute("authority") != null){
			authority = (Integer)session.getAttribute("authority");
		}
	
	%>
	
	<header>
		<!-- ロゴをクリックでトップに遷移 -->
		<form method="POST" name="topPageLink" action="ShowTopPageServlet">
			<a href="javascript:topPageLink.submit()"><img class="logo" src="images/logo.jpg"></a>
		</form>
		
		<!-- ログイン状態であれば、「ニックネーム」でログイン中と表示する -->
		<p>
		<% if(session.getAttribute("user_id") == null){ %>
			ログインしていません
		<% } else { %>
			<span><%= session.getAttribute("nickname") %></span>でログイン中
		<% } %>
		</p>
		<div class="header-contents">
			
			<% if(authority == 2){ %>
				<!-- 管理者のユーザ管理画面（仮） -->
				<form method="POST" name="showcustomer" action="ShowCustomerServlet">
						<a href="javascript:showcustomer.submit()">ユーザ管理</a>
				</form>
			<% } else { %>
			
			<% } %>

			<!-- 新規登録リンク  -->
			<a href="register.jsp">新規登録</a>

			<!-- ログインリンク -->
			<% if(session.getAttribute("user_id") == null){ %>
				<a href="login.jsp">ログイン</a>
			<% } else { %>
				<form method="POST" name="logout" action="LogoutServlet">
					<a href="javascript:logout.submit()">ログアウト</a>
				</form>
			<% } %>
			

			<!-- アイコン -->
			<% if(session.getAttribute("user_id") == null){ %>
			
			<% } else { %>
				<form action="ShowMyProfileServlet" name="profileByIcon" method="POST">
					<input type="hidden" name="user_id" value="<%= session.getAttribute("user_id") %>">
	 				<a href="javascript:profileByIcon.submit()">
					<% if(session.getAttribute("busho_img") == null){%>
						<img class="user-icon" src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k">
					<% } else { %>
						<img class="user-icon" src="<%=session.getAttribute("busho_img")%>">
					<% } %>
					</a>
				</form>
			<% } %>
		</div>
	</header>
</body>
</html>