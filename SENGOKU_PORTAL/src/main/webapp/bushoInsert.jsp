<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.BushoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将登録</title>
    <meta charset="UTF-8">
    <title>SENGOKU PORTAL</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/button.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap" rel="stylesheet">
</head>
</head>
<body>
	<!--  武将登録 -->
    <form action="BushoInsertSendServlet" method="POST">
		武将ID　：<input type="text" placeholder="例：H_000001" name="busho_id"><br>
		武将名　：<input type="text" placeholder="16文字以下" name="busho_name"><br>
		時代ID　：<input type="text" placeholder="例：J_000002" name="period_id"><br>
		説明文　：<textarea id="story" placeholder="500文字以下" name="commentary"rows="5" cols="100"></textarea><br>
		生年月日：<input type="text" placeholder="例：2000-01-01" name="birth_date"><br>
		武将画像：<input type="text" name="busho_img"><br>
		<input type="submit" value="確認画面へ">
	</form>
</body>
</html>