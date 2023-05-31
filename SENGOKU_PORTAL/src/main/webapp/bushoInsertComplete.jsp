<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将追加の完了</title>
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
	<!--  重複したら失敗  -->
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<div class="jsp-main-contents">
		<% if((Integer)request.getAttribute("count") != 0){ %>
			<p>登録が完了しました。</p>
			<form action="ShowBushoListServlet" method="POST">
			<input type="submit" value="武将一覧へ">
		</form>
		<% } else { %>
			<p>登録に失敗しました。IDが重複している可能性があります。</p>
			武将ID：<%= request.getAttribute("busho_id") %><br>
			武将名：<%= request.getAttribute("busho_name") %><br>
			時代ID：<%= request.getAttribute("period_id") %><br>
			説明文：<%= request.getAttribute("commentary") %><br>
			生年月日：<%= request.getAttribute("birth_date") %><br>
			武将画像：<%= request.getAttribute("busho_img") %><br>
			<form action="bushoInsert.jsp" method="POST">
			<input type="submit" value="入力画面へ">
		</form>
		<% } %>
	</div>	
</body>
</html>