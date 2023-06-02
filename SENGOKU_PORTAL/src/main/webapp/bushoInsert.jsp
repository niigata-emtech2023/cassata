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
	<link rel="stylesheet" href="css/main-jsp.css">
	<link rel="stylesheet" href="css/form.css">
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
		 <div class="Form">
	    	<form action="BushoInsertSendServlet" method="POST">
		    	<div class="Form-Item">
		    		<h1>武将追加</h1>
		    	</div>
				<div class="Form-Item">
				   <p class="Form-Item-Label">
				     <span class="Form-Item-Label-Required">必須</span><span class="formHead">武将ID</span>
				   </p>
				   <input type="text" name="busho_id" class="Form-Item-Input" placeholder="例：H_000001" maxlength="8" required>
				</div>
				<div class="Form-Item">
				   <p class="Form-Item-Label">
				     <span class="Form-Item-Label-Required">必須</span><span class="formHead">武将名</span>
				   </p>
				   <input type="text" name="busho_name" class="Form-Item-Input" placeholder="16文字以内" maxlength="16" required>
				</div>
				<div class="Form-Item">
				   <p class="Form-Item-Label">
				     <span class="Form-Item-Label-Required">必須</span><span class="formHead">時代ID</span>
				   </p>
				   <input type="text" name="period_id" class="Form-Item-Input" placeholder="1:室町 2:安土桃山 3:江戸 J_00000?" maxlength="8" required>
				</div>
		
				<div class="Form-Item">
				   <p class="Form-Item-Label">
				     <span class="formHead">説明文</span>
				   </p>
				    <textarea class="Form-Item-Textarea" name="commentary" placeholder="500文字以内" maxlength="500"></textarea>
				</div>
				
				<div class="Form-Item">
				   <p class="Form-Item-Label">
				     <span class="formHead">生年月日</span>
				   </p>
				   <input type="text" name="birth_date" class="Form-Item-Input" placeholder="例:2000-01-01">
				</div>
		
				<div class="Form-Item">
				   <p class="Form-Item-Label">
				     <span class="formHead">武将画像</span>
				   </p>
				   <input type="text" name="busho_img" class="Form-Item-Input" placeholder="200px×200px URL形式">
				</div>
				
				<input class="formButton" type="submit" value="確認画面へ">
			</form>
		</div>
	</div>
</body>
</html>