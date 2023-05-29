<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ検索</title>
</head>
<body>
<form action="SearchUserServlet" method="POST">
<p>キーワードを入力してください</p>
<input type="text" name="keyword">
<input type="submit" value="検索">
</form>
</body>
</html>