<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将追加の完了</title>
<link rel="icon" href="images/favicon.ico" id="favicon">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/main-jsp.css">
<link rel="stylesheet" href="css/profile.css">
<link rel="stylesheet" href="css/form.css">
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
		<div class="Form">
		    <div class="Form-Item">
		    	<% if((Integer)request.getAttribute("count") != 0){ %>
	    		<h1>新規登録完了</h1>
	    		<% } else { %>
	    		<h1>新規登録失敗</h1>
	    		<% } %>
	    	</div>
	    	
			<% if((Integer)request.getAttribute("count") != 0){ %>
				<div class="completeMessage"><p>登録が完了しました。</p></div>
			<form action="ShowBushoListServlet" method="POST">
				<input class="formButton" type="submit" value="武将一覧へ">
			</form>
			<% } else { %>
				<div class="completeMessage"><p>登録に失敗しました。IDが重複している可能性があります。</p></div>
			<form action="bushoInsert.jsp" method="POST">
				<input class="formButton" type="submit" value="入力画面へ">
			</form>
			<% } %>
		</div>
	</div>	
</body>
</html>