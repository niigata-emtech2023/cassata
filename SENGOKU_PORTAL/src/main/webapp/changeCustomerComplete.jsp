<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顧客情報変更完了</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/button.css">
<link rel="stylesheet" href="css/main-jsp.css">
<link rel="stylesheet" href="css/form.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap"
	rel="stylesheet">
</head>
<body>
	<!-- ヘッダーを置く -->
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="" />
	</jsp:include>
	<div class="jsp-main-contents">
	
		<%
			List<UserBean> userList = (List<UserBean>) request.getAttribute("userList");
		%>
		<% 
			for(UserBean user: userList){ 
		%>
		
		<div class="Form">
		    <div class="Form-Item">
	    		<h1>顧客情報変更完了</h1>
	    	</div>
	    	<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">アイコン<br>（推しの武将）</span>
			   </p>
			   <div class="Form-Icon">
			    	<% if(user.getBushoImg() == null) {%>
			    		<img src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k"  alt="プロフィール写真">
					<% } else { %>
						<img src="<%=user.getBushoImg()%>"  alt="プロフィール写真">	
					<% } %>
				</div>
			</div>
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">ID：</span><div class="Form-Item-Confirm"><%= user.getUserID() %></div>
			   </p>
			</div>
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">パスワード：</span><div class="Form-Item-Confirm"><%= user.getPassword() %></div>
			   </p>	
			</div>	  
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">ニックネーム：</span><div class="Form-Item-Confirm"><%= user.getNickname() %></div>
			   </p>
			</div>
			
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">自己紹介：</span>
			     <div class="Form-Item-Confirm">
				    <% if(user.getMyself() == null){ %>
				    	未設定
				    <% } else { %>
				    	<%= user.getMyself() %>
				    <% } %>
			     </div>
			   </p>
			</div>
			
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">性別：</span>
			     <div class="Form-Item-Confirm">
			    	<% if(user.getGender() == 1){ %>
			    		不明
			    	<% } else if(user.getGender() == 2){ %>
			    		男性
			    	<% } else { %>
			    		女性
			    	<% } %>
			     </div>
			   </p>
			</div>
			
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">生年月日：</span>
			     <div class="Form-Item-Confirm">
			 		<% if(user.getBirthDate() == null){ %>
			 			未設定
			 		<% } else { %>
			 			<%= user.getBirthDate() %>
			 		<% } %>
			     </div>
			   </p>
			</div>
			
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">推しの武将：</span>
			     <div class="Form-Item-Confirm">
			    	<% if(user.getBushoID() == null){ %>
			    		未設定
			    	<% } else { %>
			    		<%= user.getBushoName() %>
			    	<% } %>
			     </div>
			   </p>
			</div>
			
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">出身地：</span>
			     <div class="Form-Item-Confirm">
				    <% if(user.getArea() == null || user.getArea().equals("")){%>
				    	未設定
				   	<% } else { %>
				   		<%= user.getArea() %>
				   	<% } %>
			     </div>
			   </p>
			</div>
			
			<div class="confirmCheckMessage">以上の内容で変更しました。</div>
			<form action="ShowCustomerServlet" method="POST">
				<input type="hidden" name="user_id" value="<%=user.getUserID()%>">
				<input class="formButton" type="submit" value="ユーザ管理へ">
			</form>
			</div>
		</div>
		
		<% } %>

</body>
</html>