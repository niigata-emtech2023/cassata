<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将追加の完了</title>
</head>
<body>
	<!--  重複したら失敗  -->
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
	
</body>
</html>