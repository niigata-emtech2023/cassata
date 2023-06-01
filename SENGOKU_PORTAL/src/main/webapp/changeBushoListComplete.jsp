<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.BushoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将の変更確定（管理者専用画面）</title>
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
	<!-- ChangeBushoServlet -->
	<!-- ヘッダーを置く -->
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<div class="jsp-main-contents">
	   	<%
	        request.setCharacterEncoding("UTF-8");
	    %>
		<div class="Form">
			<div class="Form-Item">
	    		<h1>武将情報変更確認</h1>
	    	</div>
	    	
	    	<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">武将の画像</span>
			   </p>
			   <div class="Form-Icon">
					<img src="<%= request.getAttribute("busho_img")%>"  alt="武将の画像">	
				</div>
			</div>
			
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">名前：</span><div class="Form-Item-Confirm"><%= request.getAttribute("busho_name") %></div>
			   </p>
			</div>
			
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">年代：</span><div class="Form-Item-Confirm"><%= request.getAttribute("period_name") %></div>
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
			
			<div class="confirmCheckMessage">以上の内容で登録しました。</div>
			
			<form action="ShowBushoListServlet" method="POST">
				<input class="formButton" type="submit" value="武将一覧に戻る">
			</form>
		</div>
	    
	

	</div>
</body>
</html>