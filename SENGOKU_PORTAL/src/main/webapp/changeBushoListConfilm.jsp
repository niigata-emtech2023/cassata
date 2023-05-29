<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.BushoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将の変更確認（管理者専用画面）</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
    %>
    
    顔写真：<%request.getParameter("busho_img"); %><br>
    名前：<%request.getParameter("busho_name"); %><br>
    年代：<%request.getParameter("period_id"); %><br>
    生年月日：<%request.getParameter("birth_date"); %><br>
    説明文：<%request.getParameter("commentary"); %><br>
    以上の内容でよろしいですか
    
    <form action="ChangeBushoServlet" method="POST">
    	<input type="submit" value="確定">
    </form>
	<form action="changeBushoList.jsp" method="POST">
		<input type="submit" value="修正する">
	</form>
</body>
</html>