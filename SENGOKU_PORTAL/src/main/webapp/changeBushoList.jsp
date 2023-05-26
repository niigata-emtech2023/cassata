<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"% import="java.util.List, model.entity.BushoBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将の変更（管理者専用画面）</title>
</head>
<body>
    <%
	List<BushoBean> bushoList = (List<BushoBean>) request.getAttribute("bushoList");
	%>
	
    <form action="changeBushoConfilm.jsp" method="POST">
    
    顔写真：<img src="<%=busho.getBushoImg()%>">
            <input type="" name="busho_img"><br>
    名前：<%=busho.getBushoName()%>
    <input type="text" name="busho_name"><br>
    年代：<%=busho.getPeriodName()%>
    <input type="" name="period_id"><br>
    生年月日：<%=busho.getBirthDate()%>
              <select name="birth_date">
    説明文：<%=busho.getCommentary()%>
    <input type="text" name="commentary"><br>
    
    <input type="submit" value="変更する">
    </form>
    
</body>
</html>