<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.BushoBean, model.entity.PeriodBean" %>
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
    	List<BushoBean> bushoNameList = (List<BushoBean>) request.getAttribute("bushoNameList");
    	List<PeriodBean> periodList = (List<PeriodBean>) request.getAttribute("periodList");
	%>
	
    <form action="BushoSendServlet" method="POST">
		<% for(BushoBean busho : bushoList){ %>
	    <!--顔写真：-->
	    <select name="busho_name">
	    	<% for(BushoBean bushoName : bushoNameList) { %>
	    		<option value="<%=bushoName.getBushoName()%>"></option>
	    	<% } %>
		</select>
		<!-- 武将ID -->
		<input type="hidden" name="busho_id" value="<%=busho.getBushoID() %>">
	    名前：
	    <input type="text" name="busho_name" value="<%=busho.getBushoName()%>"><br>
	    
	    年代：
	   	<select name="busho_name">
	    	<% for(PeriodBean periodName : periodList) { %>
	    		<option value="<%=periodName.getPeriodName()%>"></option>
	    	<% } %>
		</select>
	    
	    
	    生年月日：
	    <input type="text" name="birth_date" value="<%=busho.getBirthDate()%>"><br>
	              
	    説明文：
	    <input type="text" name="commentary" <%=busho.getCommentary()%>><br>
	    

	    <% } %>
	  	<input type="submit" value="変更する">
    </form>
</body>
</html>