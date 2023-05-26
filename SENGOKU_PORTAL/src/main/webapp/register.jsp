<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規会員登録</title>
    <meta charset="UTF-8">
    <title>SENGOKU PORTAL</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/button.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap" rel="stylesheet">
</head>
<body>
    <header>
    </header>
    <!--  会員登録 -->
    	<form action="RegisterSendServlet" method="POST">
		ID：<input type="text" name="user_id"><br>
		パスワード：<input type="password" name="password">8桁以上<br>
		ニックネーム：<input type="text" name="nickname"><br>
		<input type="submit" value="確認画面へ">
	</form>
</body>
</html>