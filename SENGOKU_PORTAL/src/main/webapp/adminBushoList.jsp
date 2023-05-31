<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.BushoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将一覧（管理者専用画面）</title>
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
	<!-- ShowBushoListServlet  -->
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="busho" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="busho" />
	</jsp:include>
	<div class="jsp-main-contents">
    	<%
		List<BushoBean> bushoList
			= (List<BushoBean>) request.getAttribute("bushoList");
		%>
		<form action="BushoListSortServlet" method="POST">
		<select name="sort">
			<option value="period_id">年代順</option>
			<option value="birth_date">生年月日順</option>
		</select> <select name="order">
			<option value="ASC">昇順</option>
			<option value="DESC">降順</option>
		</select>
		<input type="submit" value="ソート">
	</form>
	<table>
		<tr>
			<th>顔写真</th>
			<th>名前</th>
			<th>年代</th>
			<th>生年月日</th>
			<th></th>
			<th></th>
		</tr>
		<!-- 武将一覧の表示 -->
		<%
			for (BushoBean busho : bushoList) {
		%>
		<tr>
			<td><img src="<%=busho.getBushoImg()%>" alt="武将の顔写真"></td>
			<td><%=busho.getBushoName()%></td>
			<td><%=busho.getPeriodName()%></td>
			<td><%=busho.getBirthDate()%></td>
			<td>
				<form action="BushoChangeSendServlet" method="POST">
					<input type="hidden" name="busho_id" value="<%=busho.getBushoID()%>">
					<input type="submit" value="変更">
				</form>
			</td>
			<td>
				<form action="ShowBushorServlet" method="POST">
					<input type="hidden" name="busho_id" value="<%=busho.getBushoID()%>">
					<input type="submit" value="削除">
				</form>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<form action="bushoInsert.jsp">
		<input type="submit" value="追加">
	</form>
	</div>
</body>
</html>