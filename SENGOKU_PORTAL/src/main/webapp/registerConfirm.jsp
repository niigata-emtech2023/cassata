<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>新規会員登録の確認</title>
</head>
<body>
<!-- 登録 -->
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
=======
<title>Insert title here</title>
</head>
<body>

>>>>>>> branch 'master' of https://github.com/niigata-emtech2023/cassata
</body>
</html>