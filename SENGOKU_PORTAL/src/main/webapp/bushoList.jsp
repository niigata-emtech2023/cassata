<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将一覧</title>
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
		</tr>
		<%
			for (BushoBean busho : bushoList) {
		%>
		<tr>
			<td><%=busho.getImg()%></td>
			<td><%=busho.getName()%></td>
			<td><%=busho.getName()%></td>
			<td><%=busho.getName()%></td>
		</tr>
		<%
			}
		%>
	</table>
	
</body>
</html>