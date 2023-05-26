<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.BushoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将一覧（管理者専用画面）</title>
</head>
<body>
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
			<td><%=busho.getBushoImg()%></td>
			<td><%=busho.getBushoName()%></td>
			<td><%=busho.getPeriodID()%></td>
			<td><%=busho.getBirthDate()%></td>
			<td>
				<form action="changeBushoList.jsp" method="POST">
					<input type="hidden" name="busho_name" value="<%=busho.getBushoName()%>">
					<input type="submit" value="変更">
				</form>
			</td>
			<td>
				<form action="deleteBushoListConfilm.jsp" method="POST">
					<input type="hidden" name="busho_name" value="<%=busho.getBushoName()%>">
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