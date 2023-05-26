<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顧客の削除確定（管理者専用画面）</title>
</head>
<body>
	<%List<UserBean>UserList
		=(List<UserBean>) request.getAttribute("userList");
	%>
	
	<!--プロフィール写真：--><img src="<%=user.getBushoImg() %>" alt="プロフィール写真">	
	ニックネーム：<%=user.getNickname() %><br>
	ID：<%=user.getUserID() %><br>
	自己紹介：<%=user.getMyself() %><br>	
	性別：<%=user.getGender() %><br>
	生年月日：<%=user.BirthDate() %>	
	推しの武将：<%=user.BushoName() %>
	出身地：<%=user.getArea() %>
	
	以上の武将を削除しました
	<input type="submit" value="一覧へ">
</body>
</html>