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
		<img src="<%= busho.getBushoImg() %>"><br>
		画像：
	    <select name="busho_name_img">
	    	<% for(BushoBean bushoName : bushoNameList) { %>
	    		<% if(busho.getBushoName().equals(bushoName.getBushoName())) {%>
	    			<option value="<%=bushoName.getBushoName()%>" selected><%=bushoName.getBushoName()%></option>
	    		<% } else { %>
	    			<option value="<%=bushoName.getBushoName()%>"><%=bushoName.getBushoName()%></option>
	    		<% } %>
	    	<% } %>
		</select>
		<!-- 武将ID -->
		<input type="hidden" name="busho_id" value="<%=busho.getBushoID() %>"><br>
	    名前：
	    <input type="text" name="busho_name" value="<%=busho.getBushoName()%>"><br>
	    年代：
	   	<select name="period_name">
	    	<% for(PeriodBean periodName : periodList) { %>
	    	
	    		<% if(periodName.getPeriodName().equals(busho.getPeriodName())){ %>
	    			<option value="<%=periodName.getPeriodName()%>" selected><%=periodName.getPeriodName()%></option>
	    		<% } else { %>
	    			<option value="<%=periodName.getPeriodName()%>"><%=periodName.getPeriodName()%></option>
	    		<% } %>
	    	<% } %>
	    	
		</select><br>
	    
	    
	    生年月日：
	    <input type="text" name="birth_date" value="<%=busho.getBirthDate()%>"><br>
	              
	    説明文：
	    <textarea name="commentary"><%=busho.getCommentary()%></textarea><br>
	    

	    <% } %>
	  	<input type="submit" value="変更する">
    </form>
</body>
</html>