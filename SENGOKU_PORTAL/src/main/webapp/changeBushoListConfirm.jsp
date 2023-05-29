<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将の変更確認（管理者専用画面）</title>
</head>
<body>

	<!-- CustomerSendServlet -->

    <%
        request.setCharacterEncoding("UTF-8");
    %>
    
    <img src="<%= request.getAttribute("busho_img")%>"><br>
    名前：<%= request.getAttribute("busho_name") %><br>
    年代：<%= request.getAttribute("period_name") %><br>
    生年月日：<%= request.getAttribute("birth_date") %><br>
    説明文：<%= request.getAttribute("commentary") %><br>
    以上の内容でよろしいですか？
    
    <form action="ChangeBushoServlet" method="POST">
    	<input type="hidden" name="busho_id" value="<%= request.getAttribute("busho_id")%>">
    	<input type="hidden" name="busho_img" value="<%= request.getAttribute("busho_img")%>">
    	<input type="hidden" name="busho_name" value="<%= request.getAttribute("busho_name")%>">
    	<input type="hidden" name="period_id" value="<%= request.getAttribute("period_id")%>">
    	<input type="hidden" name="period_name" value="<%= request.getAttribute("period_name")%>">
    	<input type="hidden" name="birth_date" value="<%= request.getAttribute("birth_date")%>">
    	<input type="hidden" name="commentary" value="<%= request.getAttribute("commentary")%>">
    	<input type="submit" value="確定">
    </form>
	<form action="changeBushoList.jsp" method="POST">
		<input type="submit" value="修正する">
	</form>
</body>
</html>