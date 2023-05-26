<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.ChatBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>全体チャット</title>
</head>
<body>
   	<%
	List<ChatBean> chatList = (List<ChatBean>) request.getAttribute("chatList");
	%>
	
	<% for(ChatBean chat: chatList) {%>
		<%= chat.getChatID() %>
		<%= chat.getUserID() %>
		<%= chat.getCreatedAt() %>
		<%= chat.getMessage() %>
		<br>
	<% } %>
</body>
</html>