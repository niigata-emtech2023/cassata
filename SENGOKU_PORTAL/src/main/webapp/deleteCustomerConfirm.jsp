<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顧客の削除確認（管理者専用画面）</title>
</head>
<body>
	<%
		List<UserBean>userList=(List<UserBean>) request.getAttribute("userList");
	%>
	<%
		for(UserBean user : userList){ 
	%>
	<!--プロフィール写真：-->
	<img src="<%=user.getBushoImg() %>" alt="武将の顔写真">	
	ニックネーム：<%=user.getNickname() %><br>
	ID：<%=user.getUserID() %><br>
	自己紹介：<%=user.getMyself() %><br>	
	性別：<%=user.getGender() %><br>
	生年月日：<%=user.getBirthDate() %>	
	推しの武将：<%=user.getBushoName() %>
	出身地：<%=user.getArea() %>
	
	以上のユーザを削除してもよろしいですか？
	<form action="DeleteCustomerServlet" method="POST">
	<input type="hidden" name="user_id" value="<%=user.getUserID() %>">
	<%} %>
	<input type="submit" value="削除">
	</form>
</body>
</html>