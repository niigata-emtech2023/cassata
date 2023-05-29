<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.BushoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将追加画面</title>
</head>
<body>
	<!--  武将登録 -->
    <form action="BushoInsertServlet" method="POST">
		武将ID：<input type="text" name="busho_id">8文字以下 例：H_000001<br>
		武将名：<input type="text" name="busho_name">16文字以下<br>
		時代ID：<input type="text" name="period_id">8文字以下 例：J_000002<br>
		説明文：<input type="text" name="commentary">500文字以下<br>
		生年月日：<input type="text" name="birth_date">8桁以上 例：1534-06-23<br>
		武将画像：<input type="text" name="busho_img"><br>
		<input type="submit" value="確認画面へ">
	</form>
</body>
</html>