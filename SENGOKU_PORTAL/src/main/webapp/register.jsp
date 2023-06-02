<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>新規会員登録</title>
    <link rel="icon" href="images/favicon.ico" id="favicon">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/button.css">
	<link rel="stylesheet" href="css/main-jsp.css">
	<link rel="stylesheet" href="css/form.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap"
		rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
 	<div class="jsp-main-contents">
	    <!--  会員登録 -->
	    <%
			request.setCharacterEncoding("UTF-8");
		
			String error = null;
			
			if(request.getAttribute("error") != null){
				error = (String)request.getAttribute("error");
			}
		%>
	    <div class="Form">
	    	<form action="RegisterSendServlet" method="POST">
		    	<div class="Form-Item">
		    		<h1>新規登録</h1>
		    	</div>
				<div class="Form-Item">
				   <p class="Form-Item-Label">
				     <span class="Form-Item-Label-Required">必須</span><span class="formHead">ID</span>
				   </p>
				   	<% if(request.getAttribute("user_id") == null){ %>
				   		<input type="text" name="user_id" class="Form-Item-Input" placeholder="半角英数字、8文字以内" pattern="^[0-9a-zA-Z]+$" maxlength="8" required>
					<% } else {%>
						<input value="<%= request.getAttribute("user_id") %>" type="text" name="user_id" class="Form-Item-Input" placeholder="半角英数字、8文字以内" pattern="^[0-9a-zA-Z]+$" maxlength="8" required>
					<% } %>
				</div>
				<div class="Form-Item">
				   <p class="Form-Item-Label">
				     <span class="Form-Item-Label-Required">必須</span><span class="formHead">パスワード</span>
				   </p>
				   	<% if(request.getAttribute("password") == null){ %>
				   		<input type="password" name="password" class="Form-Item-Input" placeholder="半角英数字、16文字以内" pattern="^[0-9a-zA-Z]+$" maxlength="16" required>
					<% } else {%>
						<input value="<%= request.getAttribute("password") %>" type="password" name="password" class="Form-Item-Input" placeholder="半角英数字、16文字以内" pattern="^[0-9a-zA-Z]+$" maxlength="16" required>
					<% } %>				   
				</div>
				<div class="Form-Item">
				   <p class="Form-Item-Label">
				     <span class="Form-Item-Label-Required">必須</span><span class="formHead">ニックネーム</span>
				   </p>
				   	<% if(request.getAttribute("nickname") == null){ %>
				   		<input type="text" name="nickname" class="Form-Item-Input" placeholder="8文字以内" maxlength="8" required>
					<% } else {%>
						<input value="<%= request.getAttribute("nickname") %>" type="text" name="nickname" class="Form-Item-Input" placeholder="8文字以内" maxlength="8" required>
					<% } %>
				</div>
				<!-- パスワードが一致しなかったら戻される -->
			    <% if(error == null) {%>
			    
			    <% } else { %>
			    	<span class="errorMessage"><%= request.getAttribute("error") %><br></span>
			    <% } %>
				<input class="formButton" type="submit" value="確認画面へ">
			</form>
		</div>
	</div>
</body>
</html>