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
<!-- ヘッダーを置く -->
    <%
    	request.setCharacterEncoding("UTF-8");
    
    	String error = null;
    	
    	if(request.getAttribute("error") != null){
    		error = (String)request.getAttribute("error");
    	}
    	
    	List<BushoBean> bushoList = (List<BushoBean>) request.getAttribute("bushoList");
    	
	%>
	
	<form action="CustomerSendServlet" method="POST">
	
    顔写真：
    <% if(request.getAttribute("busho_img").equals("null")) {%>
    	<img src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k"  alt="プロフィール写真">
	<% } else { %>
		<img src="<%=request.getAttribute("busho_img")%>"  alt="プロフィール写真">	
	<% } %><br>
    
    ニックネーム：
    <input type="text" name="nickname" value="<%=request.getAttribute("nickname")%>"><br>
    
    ID：
    <%=request.getAttribute("user_id")%><br>
    <input type="hidden" name="user_id" value="<%=request.getAttribute("user_id")%>">
    
    現在のパスワード：<%=request.getAttribute("password")%>
    <input type="hidden" name="<%=request.getAttribute("password")%>"><br>
    
    新しいパスワードを入力：
    <input type="password" name="new_password_1"><br>
    新しいパスワードをもう一度入力：
    <input type="password" name="new_password_2"><br>
    
    <!-- パスワードが一致しなかったら戻される -->
    <% if(error == null) {%>
    
    <% } else { %>
    	<%= request.getAttribute("error") %><br>
    <% } %>

    自己紹介：
    <% if(request.getAttribute("myself").equals("null")){ %>
    	<textarea name="myself"></textarea><br>
    <% } else { %>
    	<textarea name="myself"><%=request.getAttribute("myself")%></textarea><br>
    <% } %>
    
    性別：
    <% if(request.getAttribute("gender").equals("1")){ %>
	    <input type="radio" name="gender" value="1" checked="checked">不明
	    <input type="radio" name="gender" value="2">男性
	    <input type="radio" name="gender" value="3">女性<br>
	<% } else if (request.getAttribute("gender").equals("2")){ %>
		<input type="radio" name="gender" value="1">不明
	    <input type="radio" name="gender" value="2" checked="checked">男性
	    <input type="radio" name="gender" value="3">女性<br>
	<% } else { %>
		<input type="radio" name="gender" value="1">不明
	    <input type="radio" name="gender" value="2">男性
	    <input type="radio" name="gender" value="3" checked="checked">女性<br>
	<% } %>
    
    生年月日：
    <% if(request.getAttribute("birth_date").equals("null")){ %>
    	<input type="text" name="birth_date" placeholder="例:2000/01/01"><br>
    <% } else { %>
    	<input type="text" name="birth_date" placeholder="例:2000/01/01" value="<%=request.getAttribute("birth_date")%>"><br>
    <% } %>
    
    推しの武将：
    <select name="busho_name">
    	<option value="null" selected>未設定</option>
		<% for(BushoBean busho : bushoList){ %>
			<% if(busho.getBushoName().equals(request.getAttribute("busho_name"))){ %>
				<option value="<%= busho.getBushoName() %>" selected><%= busho.getBushoName() %></option>
			<% } else { %>
				<option value="<%= busho.getBushoName() %>"><%= busho.getBushoName() %></option>
			<% } %>
		<% } %>
    </select><br>
    
    <!-- 出身地がnullの場合は何も表示しない　 -->
    出身地：
    <% if(request.getAttribute("area").equals("null")){ %>
    <input type="text" name="area">未設定<br>
    <% } else { %>
    <input type="text" name="area" value="<%=request.getAttribute("area")%>"><br>
    <% } %>
    
    
    <input type="submit" value="変更する">
    </form>
</body>
</html>