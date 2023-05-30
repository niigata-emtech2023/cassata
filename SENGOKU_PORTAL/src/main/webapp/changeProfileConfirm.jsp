<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>プロフィール変更確認</title>
</head>
<body>
	<!--ProfileChangeSendServlet-->
    <%
        request.setCharacterEncoding("UTF-8");
    %>
    
   	顔写真：
    <% if(request.getAttribute("busho_img").equals("null")) {%>
    	<img src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k"  alt="プロフィール写真">
	<% } else { %>
		<img src="<%=request.getAttribute("busho_img")%>"  alt="プロフィール写真">	
	<% } %><br>
	
    ニックネーム：<%= request.getAttribute("nickname") %><br>
    
    ID：<%= request.getAttribute("user_id") %><br>
    パスワード：<%= request.getAttribute("password") %><br>
    
    <!-- 自己紹介 -->
    <% if(request.getAttribute("myself").equals("null")){ %>
    	自己紹介：未設定<br>	
    <% } else { %>
    	自己紹介：<%= request.getAttribute("myself") %><br>
    <% } %>
    
    <!-- 性別 -->
    <% if(request.getAttribute("gender").equals("1")){ %>
    	性別：不明<br>
    <% } else if(request.getAttribute("gender").equals("2")){ %>
    	性別：男性<br>
    <% } else { %>
    	性別：女性<br>
    <% } %>
    
 	<% if(request.getAttribute("birth_date").equals("null")){ %>
 		生年月日：<%= request.getAttribute("birth_date") %><br>
 	<% } else { %>
 		生年月日：<%= request.getAttribute("birth_date") %><br>
 	<% } %>
    生年月日：<%= request.getAttribute("birth_date") %><br>
    推しの武将：<%= request.getAttribute("busho_name") %><br>
    出身地：<%= request.getAttribute("area") %><br>
    以上の内容でよろしいですか
    
    <form action="ChangeProfileServlet" method="POST">
    	<input type="submit" value="確定">
    </form>
    <form action="changeProfile" method="POST">
    	<input type="submit" value="修正する">
    </form> 

</body>
</html>