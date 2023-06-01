<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ検索</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/main-jsp.css">
<link rel="stylesheet" href="css/search.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="searchUser" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="searchUser" />
	</jsp:include>
		<div class="name">
		ユーザ検索
		</div>
	
		<div class="form">
			<form action="SearchUserServlet" method="POST" class="search_container">
				<input type="text" name="keyword" placeholder="キーワードを入力してください">
				<input type="submit" value="検索">
			</form>
		</div>
</body>
</html>