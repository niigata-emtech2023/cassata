<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.UserBean"%>
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
		<!-- 顧客一覧の表示 -->
		
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
					<input type="hidden" name="user_id" value="<%=user.getUserID()%>">
					<input type="submit" value="変更">
				</form>
			</td>
			<td>
				<form action="DeleteCustomerSelectServlet" method="POST">
					<input type="hidden" name="user_id" value="<%=user.getUserID()%>">
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