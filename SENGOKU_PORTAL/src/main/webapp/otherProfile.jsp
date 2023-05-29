<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>他ユーザのページ</title>
</head>
<body>
	<% 
    	List<UserBean> userList=(List<UserBean>) request.getAttribute("userList");
    %>
    <% 
   		for(UserBean user: userList){ 
   	%>
	<img src="<%=user.getBushoImg()%>"  alt="武将の顔写真">
    フォロー フォロワー<br>
	フォロワー<br>
	<!--ニックネーム--><%=user.getNickname() %><br>
	ID：<%=user.getUserID() %><br>
	自己紹介：<%=user.getMyself()%><br>
	性別：<%=user.getGender()%><br>
	生年月日：<%=user.getBirthDate()%><br>
	推しの武将：<%=user.getBushoID()%><br>
	出身地：<%=user.getArea()%><br>
	<% } %>	
	<input type="submit" value="プロフィール変更">		
</body>
</html>