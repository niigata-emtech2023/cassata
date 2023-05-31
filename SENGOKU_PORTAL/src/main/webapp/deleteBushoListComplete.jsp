<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.BushoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将の削除確定（管理者専用画面）</title>
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
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<div class="jsp-main-contents">
		<%
			List<BushoBean>bushoList = (List<BushoBean>) request.getAttribute("bushoList");
		%>
		<%
			for(BushoBean busho: bushoList){ 
		%>
		<!--顔写真：--><img src="<%=busho.getBushoImg()%>" alt="武将の顔写真"><br>
		名前：<%=busho.getBushoName() %><br>
		年代：<%=busho.getPeriodID() %><br>
		生年月日：<%=busho.getBirthDate() %><br>
		<!--  紹介文：<%=busho.getCommentary() %> <br>-->
		<%} %>
		以上の武将を削除しました
		<form action="ShowBushoListServlet" method="POST">
			<input type="submit" value="一覧へ">
		</form>
	</div>
</body>
</html>