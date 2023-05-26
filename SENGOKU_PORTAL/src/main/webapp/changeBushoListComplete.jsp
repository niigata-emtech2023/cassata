<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将の変更確定（管理者専用画面）</title>
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
	<jsp:useBean id="busho" scope="session" class="model.entity.BushoBean" />
	顔写真：<input type="" name="image" /><br>
    名前：<input type="text" name="bushoName" /><br>
    年代：<input type="" name="period_id" /><br>
    生年月日：<input type="" name="birth_date" /><br>
    説明文：<input type="text" name="commentary" /><br>

	<form action="menu.html" method="POST">
		<input type="submit" value="武将一覧に戻る">
	</form>
	

	<% session.invalidate(); %>

</body>
</html>