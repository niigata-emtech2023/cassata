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
		<form action="bushoInsert.jsp" method="POST">
		<input type="submit" value="入力画面へ">
	</form>
	<% } %>
	
</body>
</html>