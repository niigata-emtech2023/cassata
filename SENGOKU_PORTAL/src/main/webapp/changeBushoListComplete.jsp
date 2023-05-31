<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.BushoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将の変更確定（管理者専用画面）</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/main-jsp.css">
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
	    
		顔写真：<img src="<%= request.getAttribute("busho_img") %>" alt="武将の顔写真"><br>
		名前：<%= request.getAttribute("busho_name") %><br>
		年代：<%= request.getAttribute("period_name") %><br>
		生年月日：<%= request.getAttribute("birth_date") %><br>
		説明文：<%= request.getAttribute("commentary") %><br>
		
		以上のデータを変更登録しました。<br>
	
		<form action="ShowBushoListServlet" method="POST">
			<input type="submit" value="武将一覧に戻る">
		</form>
	</div>
</body>
</html>