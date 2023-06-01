<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顧客管理（管理者専用画面）</title>
<link rel="icon" href="images/favicon.ico" id="favicon">
<link rel="stylesheet" href="css/busholist.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/main-jsp.css">
<link rel="stylesheet" href="css/form.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	
	<div class="jsp-main-contents">
	<div class="busholist">
	
		<!-- ShowCustomerServlet -->
		<!-- ヘッダーを置く -->
	    <%
			List<UserBean> userList 
			= (List<UserBean>) request.getAttribute("userList");
		%>
		<form action="SortCustomerServlet" method="POST">
			<label class="selectbox-003">
			<select name="sort">
				<option value="user_id">ID順</option>
				<option value="created_at">登録日順</option>
				<option value="u.birth_date">生年月日順</option>
			</select> 
			</label>
			<label class="selectbox-003">
			<select name="order">
				<option value="ASC">昇順</option>
				<option value="DESC">降順</option>
			</select> 
			</label>
			<input class="formButton"  type="submit" value="ソート">
		</form>
		<table>
			<tr>
				<th class="image">アイコン</th>
				<th class="nickname">ニックネーム</th>
				<th class="id">ID</th>
				<th class="name">好きな武将</th>
				<th class="change">変更</th>
				<th class="delete">削除</th>
			</tr>
			<!-- 顧客一覧の表示 -->
			
			<%
				for (UserBean user : userList) {
			%>
			<tr>
				<td class="image">
				 <% if(user.getBushoImg() == null) {%>
		    		<img src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k" class="busho-img"  alt="プロフィール写真">
				<% } else { %>
					<img src="<%=user.getBushoImg()%>" class="busho-img"  alt="プロフィール写真">	
				<% } %><br>			
				</td>
				<td class="nickname"><%=user.getNickname()%></td>
				<td class="id"><%=user.getUserID()%></td>
				<td class="name"><%=user.getBushoName()%></td>
				<td class="change">
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
				<td class="delete">
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
    </div>
    </div>
</body>
</html>