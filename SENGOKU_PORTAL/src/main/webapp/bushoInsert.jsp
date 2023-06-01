<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.BushoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="UTF-8">
    <title>武将登録</title>
    <link rel="icon" href="images/favicon.ico" id="favicon">
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
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<div class="jsp-main-contents">
	    <form action="BushoInsertSendServlet" method="POST">
			武将ID　：<input type="text" placeholder="例：H_000001" name="busho_id" maxlength="8"><br>
			武将名　：<input type="text" placeholder="16文字以下" name="busho_name" maxlength="16"><br>
			時代ID　：<input type="text" placeholder="例：J_000002" name="period_id" maxlength="8"><br>
			説明文　：<textarea id="story" placeholder="500文字以下" name="commentary"rows="5" cols="100" maxlength="500"></textarea><br>
			生年月日：<input type="text" placeholder="例：20010101" name="birth_date" maxlength="8"><br>
			武将画像：<input type="text" name="busho_img"><br>
			<input type="submit" value="確認画面へ">
		</form>
	</div>
</body>
</html>