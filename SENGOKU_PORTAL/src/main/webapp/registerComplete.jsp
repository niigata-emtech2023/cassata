<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規会員登録の完了</title>
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
		<!--  重複したら失敗  -->
		 <% if((Integer)request.getAttribute("count") != 0){ %>
			<p>登録が完了しました。</p>
		<% } else { %>
			<p>登録に失敗しました。IDが重複している可能性があります。</p>
		<% } %>
		<form action="ShowTopPageServlet" method="POST">
			<input type="submit" value="トップぺージへ">
		</form>
	</div>
</body>
</html>