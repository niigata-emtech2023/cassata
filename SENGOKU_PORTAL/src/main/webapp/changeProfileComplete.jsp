<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プロフィール変更の確定</title>
</head>
<body>
    <%
		int processingNumber = (Integer) request.getAttribute("processingNumber");
		if (processingNumber > 0) {
	%>
	次のデータを変更登録しました。<br>
	<%
		} else {
	%>
	次のデータを変更登録できませんでした。<br>
	<%
		}
	%>
	<jsp:useBean id="user" scope="session" class="model.entity.UserBean" />
	ニックネーム：<jsp:getProperty name="user" property="nickname" /><br>
    ユーザーID：<jsp:getProperty name="user" property="user_id" /><br>
    パスワード：<jsp:getProperty name="user" property="password" /><br>
    自己紹介：<jsp:getProperty name="user" property="myself" /><br>
    性別：<jsp:getProperty name="user" property="gender" /><br>
    生年月日：<jsp:getProperty name="user" property="birth_date" /><br>
    推しの武将：<jsp:getProperty name="user" property="busho_id" /><br>
    アイコン：
    出身地：<jsp:getProperty name="user" property="area" /><br>

	<form action="show-myprofile-servlet" method="POST">
		<input type="submit" value="マイページへ">
	</form>

	<% session.invalidate(); %>

</body>
</html>