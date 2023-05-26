<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>新規会員登録の完了</title>
=======
<title>新規会員登録完了</title>
>>>>>>> branch 'master' of https://github.com/niigata-emtech2023/cassata
</head>
<body>
<<<<<<< HEAD
	ID<%=user. %>	
	パスワード	
	ニックネーム	
	
	以上の情報で登録しました	
	<input type="submit" value="マイページへ">	
=======
	<!--  重複したら失敗  -->
	 <% if((Integer)request.getAttribute("count") != 0){ %>
		<p>登録が完了しました。</p>
	<% } else { %>
		<p>登録に失敗しました。IDが重複している可能性があります。</p>
	<% } %>
	<form action="ShowTopPageServlet" method="POST">
		<input type="submit" value="トップぺージへ">
	</form>
>>>>>>> branch 'master' of https://github.com/niigata-emtech2023/cassata
</body>
</html>