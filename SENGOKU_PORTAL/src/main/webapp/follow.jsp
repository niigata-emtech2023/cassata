<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.FollowBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>フォロー一覧</title>
</head>
<body>
	<% 
		List<FollowBean> followList
			=(List<FollowBean>) request.getAttribute("followList");
	%>
	
	フォロー一覧
	<% for(FollowBean follow: followList){ %>
	<img src="<%=follow.getBushoImg() %>"  alt="武将の顔写真">
	<!-- ニックネーム--><%=follow.getNickname()%><br>
	ID：<%=follow.getFollowUserID() %><br>
	<%} %>
</body>
</html>