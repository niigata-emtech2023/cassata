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
		<%
			List<BushoBean>bushoList = (List<BushoBean>) request.getAttribute("bushoList");
		%>
		<%
			for(BushoBean busho: bushoList){ 
		%>
		<!--顔写真：-->
		<div class="profile_contents" >
		<div class="profile-icon-box">
		<% if(busho.getBushoImg() != null) {%>
						<img class="icon" src="<%=busho.getBushoImg()%>"  alt="武将の顔写真">
					<% } else { %>
						<img class="icon" src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k"  alt="武将の顔写真">
					<% } %>
		</div>
		<div class="profile-box">
		<div class="nickname">
		名前：<%=busho.getBushoName() %><br>
		</div>
		年代：<%=busho.getPeriodID() %><br>
		生年月日：<%=busho.getBirthDate() %><br>
		<!--  紹介文：<%=busho.getCommentary() %> <br>-->
		<%} %>
		以上の武将を削除しました
		<form action="ShowBushoListServlet" method="POST">
		<div class="profile-change">
			<input class="formButton" type="submit" value="一覧へ">
			</div>
		</form>
		</div>
	</div>
	</div>
</body>
</html>