<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/button.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap"
	rel="stylesheet">
</head>
<body>
	<header>
		<img class="logo" src="images/logo.jpg">
		<!-- ログイン状態であれば、「ニックネーム」でログイン中と表示する -->
		<p>
		<% if(session.getAttribute("nickname") == null){ %>
			ログインしていません
		<% } else { %>
			<span><%= session.getAttribute("nickname") %></span>でログイン中
		<% } %>
		</p>
		<div class="header-contents">
		
			<!-- 管理者のユーザ管理画面（仮） -->
			<form method="POST" name="showcustomer" action="ShowCustomerServlet">
					<a href="javascript:showcustomer.submit()">ユーザ管理</a>
				</form>

			<!-- 新規登録リンク  -->
			<a href="register.jsp">新規登録</a>

			<!-- ログインリンク -->
			<% if(session.getAttribute("nickname") == null){ %>
				<a href="login.jsp">ログイン</a>
			<% } else { %>
				<form method="POST" name="logout" action="LogoutServlet">
					<a href="javascript:logout.submit()">ログアウト</a>
				</form>
			<% } %>
			

			<!-- アイコン -->
			<% if(session.getAttribute("busho_img") == null){%>
				<img class="user-icon" src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k">
			<% } else { %>
				<img class="user-icon" src="<%=session.getAttribute("busho_img")%>">
			<% } %>
		</div>
	</header>
	
	<!-- ページの表示状況によってナビゲーションの表示を変化させる -->
	<%
		String current_page = request.getParameter("current_page");
	%>
	
	<ul class="navigation-bar">
		
		<% if(current_page.equals("top")) { %>
			<li class="selected-page">
				<form method="POST" name="top" action="ShowTopPageServlet">
					<a href="javascript:top.submit()">トップ</a>
				</form>
			</li>
			<li>
				<form method="POST" name="chatList" action="ShowChatServlet">
					<a href="javascript:chatList.submit()">全体チャット</a>
				</form>
			</li>
			<li>
				<form method="POST" name="bushoList" action="ShowBushoListServlet">
					<a href="javascript:bushoList.submit()">武将一覧</a>
				</form>
			</li>
			<% if(session.getAttribute("user_id") != null){ %>
			<li>
				<form method="POST" name="myProfile" action="ShowMyProfileServlet">
					<input type="hidden" name="user_id" value="<%=session.getAttribute("user_id") %>">
					<a href="javascript:myProfile.submit()">マイページ</a>
				</form>
				
			</li>
			<% } else { %>
			
			<% } %>
			<li>				
				<a href="searchUser.jsp"><p>ユーザ検索</p></a>
			</li>
		<% } else if(current_page.equals("chat")){%>	
			<li><a href="top.jsp"><p>トップ</p></a></li>
			<li class="selected-page">
				<form method="POST" name="chatList" action="ShowChatServlet">
					<a href="javascript:chatList.submit()"><p>全体チャット</p></a>
				</form>
			</li>
			<li>
				<form method="POST" name="bushoList" action="ShowBushoListServlet">
					<a href="javascript:bushoList.submit()"><p>武将一覧</p></a>
				</form>
			</li>
			<% if(session.getAttribute("user_id") != null){ %>
			<li>
				<form method="POST" name="myProfile" action="ShowMyProfileServlet">
					<input type="hidden" name="user_id" value="<%=session.getAttribute("user_id") %>">
					<a href="javascript:myProfile.submit()"><p>マイページ</p></a>
				</form>
				
			</li>
			<% } else { %>
			
			<% } %>
			<li>				
				<a href="searchUser.jsp"><p>ユーザ検索</p></a>
			</li>
		<% } %>
		
	</ul>
</body>
</html>