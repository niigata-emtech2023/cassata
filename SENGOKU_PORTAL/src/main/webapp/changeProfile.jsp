<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プロフィール変更</title>
</head>
<body>
    <!-- ProfileChangeSendServlet.javaから転送 -->
    <%
		List<UserBean> userList = (List<UserBean>) request.getAttribute("userList");
	%>
	<% 
		for(UserBean user: userList){ 
	%>
    顔写真：
    <img src="<%=user.getBushoImg()%>" alt="武将の顔写真">
    
    ニックネーム：
    <input type="text" name="nickname" value="<%=user.getNickname()%>"><br>
    
    ID：
    <%=user.getUserID()%><br>
    
    旧パスワードを入力：
    <input type="password" name="password" ><br>
    
    新しいパスワードを入力：
    <input type="password" name="password" ><br>
    もう一度入力：
    <input type="password" name="password" ><br>
    
    自己紹介：
    
    <input type="text" name="myself" value="<%=user.getMyself()%>"><br>
    
    性別：
    <input type="radio" name="gender" value="1">不明
    <input type="radio" name="gender" value="2">男性
    <input type="radio" name="gender" value="3">女性<br>
    
    生年月日：
    <input type="text" name="birth_date" <%=user.getBirthDate()%>><br>
    
    推しの武将：
    <select name="busho_id">
    </select>
    
    出身地：
    <input type="text" name="area" <%=user.getArea()%>><br>
    <% }%>
    
    <form action="ProfileChangeSendServlet" method="POST">
    <input type="submit" value="変更する">
    </form>
</body>
</html>