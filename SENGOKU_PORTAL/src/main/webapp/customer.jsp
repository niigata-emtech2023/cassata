<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顧客管理（管理者専用画面）</title>
</head>
<body>
    <%
		List<UserBean> userList
			= (List<UserBean>) request.getAttribute("userList");
	%>
	<table>
		<tr>
			<th>写真</th>
			<th>ニックネーム</th>
			<th>ID</th>
			<th>好きな武将</th>
			<th></th>
			<th></th>
		</tr>
		<%
			for (UserBean user : userList) {
		%>
		<tr>
			<td><%=user.getBushoImg()%></td>
			<td><%=user.getNickname()%></td>
			<td><%=user.getUserID()%></td>
			<td><%=user.getBushoName()%></td>
			<td>
				<form action="changeCustomer.jsp" method="POST">
					<input type="hidden" name="code" value="<%=user.getCode()%>">
					<input type="submit" value="変更">
				</form>
			</td>
			<td>
				<form action="deleteCustomerConfilm.jsp" method="POST">
					<input type="hidden" name="code" value="<%=user.getCode()%>">
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