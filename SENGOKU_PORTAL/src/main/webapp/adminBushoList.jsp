<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<th>出身地</th>
			<th></th>
			<th></th>
		</tr>
		<%
			for (BushoBean busho : bushoList) {
		%>
		<tr>
			<td><%=busho.getImg()%></td>
			<td><%=busho.getName()%></td>
			<td><%=busho.get()%></td>
			<td><%=busho.get()%></td>
			<td>
				<form action="changeBushoList.jsp" method="POST">
					<input type="hidden" name="code" value="<%=busho.getCode()%>">
					<input type="submit" value="変更">
				</form>
			</td>
			<td>
				<form action="deleteBushoListConfilm.jsp" method="POST">
					<input type="hidden" name="code" value="<%=busho.getCode()%>">
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