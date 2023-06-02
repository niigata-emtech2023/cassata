<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将追加確認</title>
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
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<div class="jsp-main-contents">
		<div class="Form">
			<div class="Form-Item">
	    		<h1>武将追加確認</h1>
	    	</div>
	    	
	    	<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">武将の画像</span>
			   </p>
			   <div class="Form-Icon">
			   		<% if(request.getAttribute("busho_img").equals("null") || request.getAttribute("busho_img").equals("")){ %>
			   			<img src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k"  alt="武将の画像">	
			   		<% } else { %>
						<img src="<%= request.getAttribute("busho_img")%>"  alt="武将の画像">	
					<% }  %>
				</div>
			</div>
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">武将ID：</span><div class="Form-Item-Confirm"><%= request.getAttribute("busho_id") %></div>
			   </p>
			</div>
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">名前：</span><div class="Form-Item-Confirm"><%= request.getAttribute("busho_name") %></div>
			   </p>
			</div>
			
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">年代ID：</span><div class="Form-Item-Confirm"><%= request.getAttribute("period_id") %></div>
			   </p>	
			</div>
			
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">生年月日：</span><div class="Form-Item-Confirm"><%= request.getAttribute("birth_date") %></div>
			   </p>
			</div>
			
			
			<div class="Form-Item">
				<%= request.getAttribute("commentary") %>
			</div>

	    	<div class="confirmCheckMessage">以上の内容でよろしいですか？</div>
			<form action="BushoInsertServlet" method="POST">
				<input type="hidden" name="busho_id" value="<%= request.getAttribute("busho_id") %>">
				<input type="hidden" name="busho_name" value="<%= request.getAttribute("busho_name") %>">
				<input type="hidden" name="period_id" value="<%= request.getAttribute("period_id") %>">
				<input type="hidden" name="commentary" value="<%= request.getAttribute("commentary") %>">
				<input type="hidden" name="birth_date" value="<%= request.getAttribute("birth_date") %>">
				<input type="hidden" name="busho_img" value="<%= request.getAttribute("busho_img") %>">
			<input class="formButton" type="submit" value="確定">
		</form>
		</div>
		

	</div>
</body>
</html>