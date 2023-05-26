<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>フォロワー一覧</title>
</head>
<body>
	<% 
		List<FollowBean> followList
			=(List<FollowBean>) request.getAttribute("followList");
	%>
	
	フォロー一覧
	<% for(FollowBean follow: followList){ %>
	<img src="<%=follow.getBushoImg() %>"  alt="プロフィール写真">
	<!-- ニックネーム--><%=follow.getNickname()%><br>
	ID：<%=follow.getFollowUserID() %><br>
	<!-- 好きな武将のFollwBeanがまだない -->
	好きな武将<%=follow.get??????()%><br>
</body>
</html>