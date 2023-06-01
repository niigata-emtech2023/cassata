<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/button.css">
	<link rel="stylesheet" href="css/main-jsp.css">
	<link rel="stylesheet" href="css/form.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<div class="jsp-main-contents">
		 <div class="Form">
	    	<form action="LoginServlet" method="POST">
		    	<div class="Form-Item">
		    		<h1>ログイン</h1>
		    	</div>
				<div class="Form-Item">
				   <p class="Form-Item-Label">
				     <span class="Form-Item-Label-Required">必須</span><span class="formHead">ID</span>
				   </p>
				   <input type="text" name="user_id" class="Form-Item-Input" placeholder="半角英数字、8文字以内" pattern="^[0-9a-zA-Z]+$" maxlength="8" required>
				</div>
				<div class="Form-Item">
				   <p class="Form-Item-Label">
				     <span class="Form-Item-Label-Required">必須</span><span class="formHead">パスワード</span>
				   </p>
				   <input type="password" name="password" class="Form-Item-Input" placeholder="半角英数字、16文字以内" pattern="^[0-9a-zA-Z]+$" maxlength="16" required>
				</div>
				<input class="formButton" type="submit" value="ログイン">
			</form>
		</div>
	</div>
</body>
</html>