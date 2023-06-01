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
	
	<!-- ページの表示状況によってナビゲーションの表示を変化させる -->
	<%
		String current_page = request.getParameter("current_page");
	%>
	
	<ul class="top-navigation-bar">
		
		<% if(current_page.equals("top")) { %>
			<li class="selected-page">
				<form method="POST" name="topPage" action="ShowTopPageServlet">
					<a href="javascript:top.submit()"><p>トップ</p></a>
				</form>
			</li>
			<li>
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
			
		<% } else if(current_page.equals("chat")){%>	
			<li>
				<form method="POST" name="topPage" action="ShowTopPageServlet">
					<a href="javascript:topPage.submit()"><p>トップ</p></a>
				</form>
			</li>
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
			
		<% } else if(current_page.equals("busho")){%>	
			<li>
			<form method="POST" name="topPage" action="ShowTopPageServlet">
				<a href="javascript:topPage.submit()"><p>トップ</p></a>
			</form>
			</li>
			<li>
				<form method="POST" name="chatList" action="ShowChatServlet">
					<a href="javascript:chatList.submit()"><p>全体チャット</p></a>
				</form>
			</li>
			<li class="selected-page">
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
		<% } else if(current_page.equals("myProfile")){%>	
			<li>
			<form method="POST" name="topPage" action="ShowTopPageServlet">
				<a href="javascript:topPage.submit()"><p>トップ</p></a>
			</form>
			</li>
			<li>
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
			<li class="selected-page">
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
		<% } else if(current_page.equals("searchUser")){%>	
			<li>
			<form method="POST" name="topPage" action="ShowTopPageServlet">
				<a href="javascript:topPage.submit()"><p>トップ</p></a>
			</form>
			</li>
			<li>
				<form method="POST" name="chatList" action="ShowChatServlet">
					<a href="javascript:chatList.submit()"><p>全体チャット</p></a>
				</form>
			</li>
			<li class="selected-page">
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
			<li class="selected-page">				
				<a href="searchUser.jsp"><p>ユーザ検索</p></a>
			</li>
		<% } else {%>	
			<li>
			<form method="POST" name="topPage" action="ShowTopPageServlet">
				<a href="javascript:topPage.submit()"><p>トップ</p></a>
			</form>
			</li>
			<li>
				<form method="POST" name="chatList" action="ShowChatServlet">
					<a href="javascript:chatList.submit()"><p>全体チャット</p></a>
				</form>
			</li>
			<li class="selected-page">
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