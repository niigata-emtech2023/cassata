<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.PeriodBean, model.entity.BushoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将情報変更の修正</title>
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
	<!-- ヘッダーを置く -->
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<div class="jsp-main-contents">
	    <%
			request.setCharacterEncoding("UTF-8");
			List<BushoBean> bushoList = (List<BushoBean>) request.getAttribute("bushoList");
			List<BushoBean> bushoNameList = (List<BushoBean>) request.getAttribute("bushoNameList");
			List<PeriodBean> periodList = (List<PeriodBean>) request.getAttribute("periodList");
		%>	
	    <form action="BushoSendServlet" method="POST">
			<% for(BushoBean busho : bushoList){ %>
			<img src="<%= request.getAttribute("busho_img") %>"><br>
			<input type="hidden" name="busho_id" value="<%= request.getAttribute("busho_id") %>"><br>
			<input type="hidden" name="busho_img" value="<%= request.getAttribute("busho_img") %>"><br>
		    名前：
		    <input type="text" name="busho_name" value="<%= request.getAttribute("busho_name") %>"><br>
		    年代：
		   	<select name="period_name">
		    	<% for(PeriodBean periodName : periodList) { %>
		    	
		    		<% if(periodName.getPeriodName().equals(request.getAttribute("period_name"))){ %>
		    			<option value="<%=periodName.getPeriodName()%>" selected><%=periodName.getPeriodName()%></option>
		    		<% } else { %>
		    			<option value="<%=periodName.getPeriodName()%>"><%=periodName.getPeriodName()%></option>
		    		<% } %>
		    	<% } %>
		    	
			</select><br>
		    
		    
		    生年月日：
		    <input type="text" name="birth_date" value="<%= request.getAttribute("birth_date") %>"><br>
		              
		    説明文：
		    <textarea name="commentary"><%= request.getAttribute("commentary") %></textarea><br>
		    <% } %>
		    
	
		  	<input type="submit" value="変更する">
	    </form>
    </div>
</body>
</html>