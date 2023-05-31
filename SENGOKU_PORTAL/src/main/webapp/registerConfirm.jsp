<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規会員登録の確認</title>
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
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<div class="jsp-main-contents">
		<p>以下の情報でよろしいですか？</p>
			ID：<%= request.getAttribute("user_id") %><br>
			パスワード：<%= request.getAttribute("password") %><br>
			ニックネーム：<%= request.getAttribute("nickname") %><br>
		<form action="RegisterServlet" method="POST">
			<input type="hidden" name="user_id" value="<%= request.getAttribute("user_id") %>">
			<input type="hidden" name="password" value="<%= request.getAttribute("password") %>">
			<input type="hidden" name="nickname" value="<%= request.getAttribute("nickname") %>">
		<input type="submit" value="確定">
		</form>
	</div>
</body>
</html>