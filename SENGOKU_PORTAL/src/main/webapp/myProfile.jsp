<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ</title>
</head>
<body>
    <% 
    	List<UserBean> userList
    		=(List<UserBean>) request.getAttribute("userList");
    %>
	<img src=""  alt="プロフィール写真">
    フォロー フォロワー<br>
	フォロワー<br>
	ニックネーム<br>
	ID<br>
	<% for(UserBean user: userList){ %>
	自己紹介：
	<%=user.getMyself()%>
	性別：
	<%=user.getGender()%>
	生年月日：
	<%=user.getBirthDate()%>
	推しの武将
	<%=user.getBushoID()%>
	出身地：
	<%=user.getArea()%>
	<% } %>	
	<input type="submit" value="プロフィール変更">		
</body>
</html>