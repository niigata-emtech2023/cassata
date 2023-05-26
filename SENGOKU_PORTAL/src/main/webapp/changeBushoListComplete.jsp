<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"import="java.util.List, model.entity.BushoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将の変更確定（管理者専用画面）</title>
</head>
<body>
    <%
	List<UserBean> bushoList = (List<BushoBean>) request.getAttribute("userList");
	%>
	
	顔写真：<img src="<%=busho.getBushoImg()%>"><br>
	名前：<%=busho.getBushoName()%><br>
	年代：<%=busho.getPeriodName()%><br>
	生年月日：<%=busho.getBirthDate()%><br>
	
	以上のデータを変更登録しました。<br>

	<form action="bushoList.jsp" method="POST">
		<input type="submit" value="武将一覧に戻る">
	</form>

</body>
</html>