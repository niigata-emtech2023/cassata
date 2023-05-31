<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プロフィール変更確認（管理者専用画面）</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
    %>
    
    顔写真：<%= request.getAttribute("busho_img") %><br>
    ニックネーム：<%= request.getAttribute("nickname") %><br>
    ID：<%= request.getAttribute("user_id") %><br>
    パスワード：<%= request.getAttribute("password") %><br>
    自己紹介：<%= request.getAttribute("myself") %><br>
    性別：<%= request.getAttribute("gender") %><br>
    生年月日：<%= request.getAttribute("birth_date") %><br>
    推しの武将：<%= request.getAttribute("busho_id") %><br>
    出身地：<%= request.getAttribute("area") %><br>
    以上の内容でよろしいですか
    
     <form action="ChangeCustomerServlet" method="POST">
    	<input type="hidden" name="busho_img" value="<%= request.getAttribute("busho_img")%>">
    	<input type="hidden" name="nickname" value="<%= request.getAttribute("nickname")%>">
    	<input type="hidden" name=user_id value="<%= request.getAttribute("user_id")%>">
    	<input type="hidden" name="password" value="<%= request.getAttribute("password")%>">
    	<input type="hidden" name="myself" value="<%= request.getAttribute("myself")%>">
    	<input type="hidden" name="gender" value="<%= request.getAttribute("gender")%>">
    	<input type="hidden" name="birth_date" value="<%= request.getAttribute("birth_date")%>">
    	<input type="hidden" name="busho_id" value="<%= request.getAttribute("busho_id")%>">
    	<input type="hidden" name="area" value="<%= request.getAttribute("area")%>">
    	<input type="submit" value="確定">
    </form>
	<form action="CustomerChangeSendServlet" method="POST">
	   	<input type="hidden" name="busho_img" value="<%= request.getAttribute("busho_img")%>">
    	<input type="hidden" name="nickname" value="<%= request.getAttribute("nickname")%>">
    	<input type="hidden" name=user_id value="<%= request.getAttribute("user_id")%>">
    	<input type="hidden" name="password" value="<%= request.getAttribute("password")%>">
    	<input type="hidden" name="myself" value="<%= request.getAttribute("myself")%>">
    	<input type="hidden" name="gender" value="<%= request.getAttribute("gender")%>">
    	<input type="hidden" name="birth_date" value="<%= request.getAttribute("birth_date")%>">
    	<input type="hidden" name="busho_id" value="<%= request.getAttribute("busho_id")%>">
    	<input type="hidden" name="area" value="<%= request.getAttribute("area")%>">
		<input type="submit" value="修正する">
	</form>

</body>
</html>