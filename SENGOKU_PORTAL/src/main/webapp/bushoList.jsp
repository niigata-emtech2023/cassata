<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List, model.entity.BushoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将一覧</title>
</head>
<body>


	<%
	List<BushoBean> bushoList = (List<BushoBean>) request.getAttribute("bushoList");
	%>
	ソート
	<form action="BushoListSortServlet" method="POST">
		<select name="sort">
			<option value="busho_name">五十音順</option>
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
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>