<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規会員登録の完了</title>

</head>
<body>

	<!--  重複したら失敗となる  -->
	 <% if((Integer)request.getAttribute("count") != 0){ %>
		<p>登録が完了しました。</p>
	<% } else { %>
		<p>登録に失敗しました。IDが重複している可能性があります。</p>
	<% } %>
	<form action="ShowTopPageServlet" method="POST">
		<input type="submit" value="トップぺージへ">
	</form>

</body>
</html>