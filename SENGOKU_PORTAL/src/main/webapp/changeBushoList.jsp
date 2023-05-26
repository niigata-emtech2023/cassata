<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将の変更（管理者専用画面）</title>
</head>
<body>
    <jsp:useBean id="busho" class="model.entity.BushoBean" scope="session" />
    <form action="changeBushoConfilm.jsp" method="POST">
    顔写真：<input type="" name="image" 
    	value="<jsp:getProperty name="busho" property="image" />"><br>
    名前：<input type="text" name="busho_name" 
    	value="<jsp:getProperty name="busho" property="busho_name" />"><br>
    年代：<input type="" name="period_id" 
    	value="<jsp:getProperty name="busho" property="period_id" />"><br>
    生年月日：<input type="" name="birth_date" 
    	value="<jsp:getProperty name="busho" property="birth_date" />"><br>
    説明文：<input type="text" name="commentary" 
    	value="<jsp:getProperty name="busho" property="commentary" />"><br>
    <input type="submit" value="変更する">
    </form>
    

</body>
</html>