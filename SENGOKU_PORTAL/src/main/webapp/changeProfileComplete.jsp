<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プロフィール変更の確定</title>
</head>
<body>
    <%
	List<UserBean> userList = (List<UserBean>) request.getAttribute("userList");
	%>
	
	顔写真：<img src="<%=user.getBushoImg()%>"><br>
	ニックネーム：<%=user.getNickname()%><br>
	ID：<%=user.getUserID()%><br>
	パスワード：<%=user.getPassword()%><br>
	自己紹介：<%=user.getMyself()%><br>
	性別：<%=user.getGender()%><br>
	生年月日：<%=user.getBirthDate()%><br>
	推しの武将：<%=user.getBushoID()%><br>
	出身地：<%=user.getArea()%><br>
	
	以上のデータを変更登録しました。<br>

	<form action="customer.jsp" method="POST">
		<input type="submit" value="顧客一覧に戻る">
	</form>
</body>
</html>