<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.BushoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将一覧（管理者専用画面）</title>
<link rel="icon" href="images/favicon.ico" id="favicon">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/main-jsp.css">
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/busholist.css">
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
	
	<!--  <div class="jsp-main-contents">-->
	<div class="busholist">
	
    	<%
		List<BushoBean> bushoList
			= (List<BushoBean>) request.getAttribute("bushoList");
		%>
		<form action="BushoListSortServlet" method="POST">
		<label class="selectbox-003">
		<select name="sort">
			<option value="period_id">年代順</option>
			<option value="birth_date">生年月日順</option>
		</select>
		</label>
		<label class="selectbox-003">
			<select name="order">
				<option value="ASC">昇順</option>
				<option value="DESC">降順</option>
			</select>
		</label>
		<input class="formButton" type="submit" value="ソート">
	</form>
	
	<table border="black">
	<thead>
		<tr>
			<th class="image">アイコン</th>
			<th class="name">名前</th>
			<th class="era">年代</th>
			<th class="birth">生年月日</th>
			<th class="change">変更</th>
			<th class="delete">削除</th>
		</tr>
	</thead>
		<!-- 武将一覧の表示 -->
		<tbody>
		<%
			for (BushoBean busho : bushoList) {
		%>
		<tr>
			<td class="image"><img src="<%=busho.getBushoImg()%>" class="busho-img" alt="武将の顔写真"></td>
			<td class="name"><%=busho.getBushoName()%></td>
			<td class="era"><%=busho.getPeriodName()%></td>
			<td class="birth"><%=busho.getBirthDate()%></td>
			<td class="change">
				<form action="BushoChangeSendServlet" method="POST">
					<input type="hidden" name="busho_id" value="<%=busho.getBushoID()%>">
					<input type="submit" value="変更">
				</form>
			</td>
			<td class="delete">
				<form action="ShowBushorServlet" method="POST">
					<input type="hidden" name="busho_id" value="<%=busho.getBushoID()%>">
					<input type="submit" value="削除">
				</form>
			</td>
		</tr>
		<%
			}
		%>
	</tbody>
	</table>
	
	<form action="bushoInsert.jsp">
		<input class="formButton" type="submit" value="追加">
	</form>
	
	</div>
	<!--  </div>-->
</body>
</html>