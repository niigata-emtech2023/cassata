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
    
    <% 
    	for(BushoBean busho : bushoList){ 
    %>
    <!--顔写真：--><img src="<%=busho.getBushoImg()%>" alt="武将の顔写真"><br>
            <input type="" name="busho_img">
	
    名前：
    <input type="text" name="busho_name" value="<%=busho.getBushoName()%>"><br>
    
    年代：
    <input type="text" name="period_id" value="<%=busho.getPeriodName()%>"><br>
    
    生年月日：
    <input type="text" name="birth_date" value="<%=busho.getBirthDate()%>"><br>
              
    説明文：
    <input type="text" name="commentary" <%=busho.getCommentary()%>><br>
    <% } %>
    
    <input type="submit" value="変更する">
    </form>
    .fewwqfewq qfewpjfｊふぇをいｆｑっふぇｗくぉ>e<><% aaaa%>/%>
</body>
</html>