<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将情報変更確認</title>
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
<p>以下の情報でよろしいですか？</p>
		武将ID：<%= request.getAttribute("busho_id") %><br>
		武将名：<%= request.getAttribute("busho_name") %><br>
		時代ID：<%= request.getAttribute("period_id") %><br>
		説明文：<%= request.getAttribute("commentary") %><br>
		生年月日：<%= request.getAttribute("birth_date") %><br>
		武将画像：<%= request.getAttribute("busho_img") %><br>
	<form action="BushoInsertServlet" method="POST">
		<input type="hidden" name="busho_id" value="<%= request.getAttribute("busho_id") %>">
		<input type="hidden" name="busho_name" value="<%= request.getAttribute("busho_name") %>">
		<input type="hidden" name="period_id" value="<%= request.getAttribute("period_id") %>">
		<input type="hidden" name="commentary" value="<%= request.getAttribute("commentary") %>">
		<input type="hidden" name="birth_date" value="<%= request.getAttribute("birth_date") %>">
		<input type="hidden" name="busho_img" value="<%= request.getAttribute("busho_img") %>">
	<input type="submit" value="確定">
	</form>
</body>
</html>