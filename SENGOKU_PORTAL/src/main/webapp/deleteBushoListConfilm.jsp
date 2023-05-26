<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.BushoBean%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>武将の削除確認（管理者専用画面）</title>
</head>
<body>
	<!--顔写真--><img src="<%=busho.getBushoImg%>" alt="武将の顔写真">
	名前：<%=busho.get %>
	年代：	
	生年月日：	
	紹介文：	
	削除してよろしいですか？	
	<input type="submit" value="削除">	
</body>
</html>