<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規会員登録</title>
</head>
<body>
	<form action="registerConfilm.jsp" method="POST">
		ID：<input type="text" name="ID"><br>
		パスワード：<input type="password" name="password">8桁以上<br>
		ニックネーム：<input type="text" name="nickname"><br>
		<input type="submit" value="確認画面へ">
	</form>
</body>
</html>