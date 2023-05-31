<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.BushoBean, model.entity.PeriodBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将の変更（管理者専用画面）</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/main-jsp.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap"
	rel="stylesheet">
</head>
<body>
	<!-- adminBushoList.jsp -->
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<div class="jsp-main-contents">
	    <%
			List<BushoBean> bushoList = (List<BushoBean>) request.getAttribute("bushoList");
	    	List<BushoBean> bushoNameList = (List<BushoBean>) request.getAttribute("bushoNameList");
	    	List<PeriodBean> periodList = (List<PeriodBean>) request.getAttribute("periodList");
		%>
		
	    <form action="BushoSendServlet" method="POST">
			<% for(BushoBean busho : bushoList){ %>
			<img src="<%= busho.getBushoImg() %>"><br>
			<input type="hidden" name="busho_id" value="<%=busho.getBushoID() %>"><br>
			<input type="hidden" name="busho_img" value="<%=busho.getBushoImg() %>"><br>
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
    </div>
</body>
</html>