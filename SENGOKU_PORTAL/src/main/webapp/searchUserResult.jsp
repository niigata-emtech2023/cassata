<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ検索結果</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/button.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap"
	rel="stylesheet">
</head>
<body>
   	<%
	List<UserBean> userList = (List<UserBean>) request.getAttribute("userList");
	%>
	<table>
		<tr>
			<th>プロフィール写真</th>
			<th>ニックネーム</th>
			<th>ID</th>
			<th>好きな武将</th>
		</tr>
		<!-- 武将一覧の表示 -->
		<%
			for (UserBean user : userList) {
		%>
			<tr>
				<% if(user.getBushoImg() != null) {%>
					<td><img src="<%=user.getBushoImg()%>"></td>
				<% } else { %>
					<td><img src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k"></td>
				<% } %>
				
				<td><%=user.getNickname()%></td>
				<td><%=user.getUserID()%></td>
				
				<% if(user.getBushoName() != null) {%>
				<td><%=user.getBushoName()%></td>
				<% } else { %>
				<td>未設定</td>
				<% } %>
				<td>
					<form method="POST" action="ShowOtherProfileServlet">
						<input type="hidden" name="user_id" value="<%=user.getUserID()%>">
						<input type="submit" value="プロフィールへ">
					</form>
				</td>
			</tr>
		<%
		}
		%>
	</table>
</body>
</html>