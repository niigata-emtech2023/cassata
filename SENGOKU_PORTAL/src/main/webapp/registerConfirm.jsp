<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規会員登録の確認</title>
</head>
<body>
	<form action="registerComplete.jsp" method="POST">
		ID：<% request.getParameter("ID"); %><br>
		パスワード：<% request.getParameter("password"); %><br>
		ニックネーム：<% request.getParameter("nickname"); %><br>
		<input type="submit" value="確認画面へ">
	</form>
</body>
</html>