<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顧客管理（管理者専用画面）</title>
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
	<!-- ShowCustomerServlet -->
	<!-- ヘッダーを置く -->
    <%
		List<UserBean> userList 
		= (List<UserBean>) request.getAttribute("userList");
	%>
	<form action="SortCustomerServlet" method="POST">
		<select name="sort">
			<option value="user_id">ID順</option>
			<option value="created_at">登録日順</option>
			<option value="u.birth_date">生年月日順</option>
		</select> 
		<select name="order">
			<option value="ASC">昇順</option>
			<option value="DESC">降順</option>
		</select> 
		<input type="submit" value="ソート">
	</form>
	<table>
		<tr>
			<th>アイコン</th>
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
			<td>
			 <% if(user.getBushoImg() == null) {%>
	    		<img src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k"  alt="プロフィール写真">
			<% } else { %>
				<img src="<%=user.getBushoImg()%>"  alt="プロフィール写真">	
			<% } %><br>			
			</td>
			<td><%=user.getNickname()%></td>
			<td><%=user.getUserID()%></td>
			<td><%=user.getBushoName()%></td>
			<td>
			<form action="CustomerChangeSendServlet" method="POST">
				<input type="hidden" name="busho_img" value="<%= user.getBushoImg() %>">
				<input type="hidden" name="nickname" value="<%=user.getNickname() %>">
				<input type="hidden" name="user_id" value="<%=user.getUserID()%>">
				<input type="hidden" name="myself" value="<%=user.getMyself() %>">
				<input type="hidden" name="gender" value="<%=user.getGender() %>">
				<input type="hidden" name="birth_date" value="<%=user.getBirthDate() %>">
				<input type="hidden" name="busho_id" value="<%=user.getBushoID() %>">
				<input type="hidden" name="area" value="<%=user.getArea()%>">
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