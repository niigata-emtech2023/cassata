<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.UserBean, model.entity.BushoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プロフィール変更（管理者専用画面）</title>
</head>
<body>
<!-- CustomerChangeSendServletから転送 -->
	<%
    	request.setCharacterEncoding("UTF-8");
	%>
	
	<%
		List<UserBean> userList = (List<UserBean>) request.getAttribute("userList");
		List<BushoBean> bushoList = (List<BushoBean>) request.getAttribute("bushoList");
    	List<BushoBean> bushoNameList = (List<BushoBean>) request.getAttribute("bushoNameList");
	%>
	
    
    <!-- 顔写真 -->
    <img src="<%=request.getAttribute("busho_img")%>" alt="武将の顔写真">
		
		<%-- 画像：
	    <select name="busho_name_img">
	    	<% for(BushoBean bushoName : bushoNameList) { %>
	    		<% if(busho.getBushoName().equals(bushoName.getBushoName())) {%>
	    			<option value="<%=bushoName.getBushoName()%>" selected><%=bushoName.getBushoName()%></option>
	    		<% } else { %>
	    			<option value="<%=bushoName.getBushoName()%>"><%=bushoName.getBushoName()%></option>
	    		<% } %>
	    	<% } %>
		</select>--%>
	
    
    ID：
    <%=request.getAttribute("user_id")%><br>
    
    旧パスワードを入力：
    <input type="password" name="password" ><br>
    
    新しいパスワードを入力：
    <input type="password" name="password" ><br>
    もう一度入力：
    <input type="password" name="password" ><br>
    
    
    自己紹介：
    <input type="text" name="myself" value="<%=request.getAttribute("myself")%>"><br>
    
    性別：
    <input type="radio" name="gender" value="1">不明
    <input type="radio" name="gender" value="2">男性
    <input type="radio" name="gender" value="3">女性<br>
    
    生年月日：
    <input type="text" name="birth_date" <%=request.getAttribute("birth_date")%>><br>
    
    <%-- 好きなの武将：
    <select name="buso_name">
	    	<% for(BushoBean bushoName : bushoList) { %>
	    		<% if(busho.getBushoName().equals(bushoName.getBushoName())) {%>
	    			<option value="<%=bushoName.getBushoName()%>" selected><%=bushoName.getBushoName()%></option>
	    		<% } else { %>
	    			<option value="<%=bushoName.getBushoName()%>"><%=bushoName.getBushoName()%></option>
	    		<% } %>
	    	<% } %>
		</select><br>--%>
    
    出身地：
    <input type="text" name="area" <%=request.getAttribute("area")%>><br>
    
    <form action="CustomerSendServlet" method="POST">
    <input type="submit" value="変更する">
    </form>
</body>
</html>