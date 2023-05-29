<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"% import="java.util.List, model.entity.BushoBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将の変更（管理者専用画面）</title>
</head>
<body>
	<!--adminBushoList.jsp-->
    <%
		List<BushoBean> bushoList = (List<BushoBean>) request.getAttribute("bushoList");
	%>
	
    <form action="BushoSendServlet" method="POST">
    
    <%
		BushoBean employee = (BushoBean) request.getAttribute("busho");
	%>
	
	<% for(BushoBean busho : bushoList){ %>
    <!--顔写真：-->
    <select name="busho">
    	<option value="<%=busho.getBushoImg()%>"></option>
	</select>
	<!-- 武将ID -->
	<input type="hidden" name="busho_id" value="<%=busho.getBushoID() %>">
    名前：
    <input type="text" name="busho_name" value="<%=busho.getBushoName()%>"><br>
    
    年代：
    <input type="text" name="period_id" value="<%=busho.getPeriodName()%>"><br>
    
    生年月日：
    <input type="text" name="birth_date" value="<%=busho.getBirthDate()%>"><br>
              
    説明文：
    <input type="text" name="commentary" <%=busho.getCommentary()%>><br>
    
    <input type="submit" value="変更する">
    <% } %>
    </form>
</body>
</html>