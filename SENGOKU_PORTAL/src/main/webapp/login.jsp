<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
</head>
<body>
    ログイン<br>
	<form action="LoginServlet" method="POST">
    ID：<input type="text" name="user_id" maxlength="8"><br>
	パスワード：<input type="password" name="password" maxlength="16"><br>
	<input type="submit" value="ログイン">
	</form>
</body>
</html>