<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.BushoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将一覧（管理者専用画面）</title>
</head>
<body>
	<!-- ShowBushoListServlet  -->
	
    	<%
		List<BushoBean> bushoList
			= (List<BushoBean>) request.getAttribute("bushoList");
	%>
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
				<form action="BushoInsertSendServlet" method="POST">
					<input type="hidden" name="busho_id" value="<%=busho.getBushoID()%>">
					<input type="submit" value="削除">
				</form>
			</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>