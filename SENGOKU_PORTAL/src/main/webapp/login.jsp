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
	<form action="show-toppage-servlet" method="POST">
    ID：<input type="text" name="ID"><br>
	パスワード：<input type="password" name="password"><br>
	<input type="submit" value="ログイン">
	</form>
</body>
</html>