<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.BushoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将の削除確認（管理者専用画面）</title>
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
	<%
		List<BushoBean> bushoList = (List<BushoBean>)request.getAttribute("bushoList");
	%>
	<%
		for(BushoBean busho : bushoList){ 
	%>
	<!--顔写真-->
	<form action="DeleteBushoServlet" method="POST">
	<img src="<%=busho.getBushoImg() %>" alt="武将の顔写真"><br>
	名前：<%=busho.getBushoName() %><br>
	年代：<%=busho.getPeriodID() %><br>	
	生年月日：<%=busho.getBirthDate() %><br>
	紹介文：<%=busho.getCommentary() %><br>	
	
	以上の武将を削除してもよろしいですか？<br>
	<input type="hidden" name="busho_id" value="<%= busho.getBushoID() %>">
	<%} %>
	<input type="submit" value="削除">	
	</form>
</body>
</html>