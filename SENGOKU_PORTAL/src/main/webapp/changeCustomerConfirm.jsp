<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顧客情報変更確認</title>
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
	        request.setCharacterEncoding("UTF-8");
	    %>
	    
	    <div class="Form">
		    <div class="Form-Item">
	    		<h1>顧客情報変更確認</h1>
	    	</div>
	    	<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">アイコン<br>（推しの武将）</span>
			   </p>
			   <div class="Form-Icon">
			   	<% if(request.getAttribute("busho_img").equals("null")) {%>
		    		<img src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k"  alt="プロフィール写真">
				<% } else { %>
					<img src="<%=request.getAttribute("busho_img")%>"  alt="プロフィール写真">	
				<% } %><br>
				</div>
			</div>
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">ID：</span><div class="Form-Item-Confirm"><%= request.getAttribute("user_id") %></div>
			   </p>
			</div>
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">パスワード：</span><div class="Form-Item-Confirm"><%= request.getAttribute("password") %></div>
			   </p>	
			</div>	  
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">ニックネーム：</span><div class="Form-Item-Confirm"><%= request.getAttribute("nickname") %></div>
			   </p>
			</div>
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">自己紹介：</span>
			     <div class="Form-Item-Confirm">
		     	    <% if(request.getAttribute("myself").equals("")){ %>
				    	未設定
				    <% } else { %>
				    	<%= request.getAttribute("myself") %>
				    <% } %>
			     </div>
			   </p>
			</div>
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">性別：</span>
			     <div class="Form-Item-Confirm">
				    <% if(request.getAttribute("gender").equals("1")){ %>
				    	不明
				    <% } else if(request.getAttribute("gender").equals("2")){ %>
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
				 	<% if(request.getAttribute("birth_date").equals("")){ %>
				 		未設定
				 	<% } else { %>
				 		<%= request.getAttribute("birth_date") %>
				 	<% } %>
			     </div>
			   </p>
			</div>
			
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">推しの武将：</span>
			     <div class="Form-Item-Confirm">
				    <% if(request.getAttribute("busho_name").equals("null")){ %>
				    	未設定
				    <% } else { %>
				    	<%= request.getAttribute("busho_name") %>
				    <% } %>
			     </div>
			   </p>
			</div>
			
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">出身地：</span>
			     <div class="Form-Item-Confirm">
				    <% if(request.getAttribute("area").equals("")){%>
				    	未設定
				   	<% } else { %>
				   		<%= request.getAttribute("area") %>
				   	<% } %>
			     </div>
			   </p>
			</div>
			
			<div class="confirmCheckMessage">以上の内容でよろしいですか？</div>
			<div class="formButtonBox">
			    <form action="ChangeCustomerServlet" method="POST">
			    	<input type="hidden" name="busho_img" value="<%= request.getAttribute("busho_img")%>">
			    	<input type="hidden" name="nickname" value="<%= request.getAttribute("nickname")%>">
			    	<input type="hidden" name="user_id" value="<%= request.getAttribute("user_id")%>">
			    	<input type="hidden" name="password" value="<%= request.getAttribute("password")%>">
			    	<input type="hidden" name="myself" value="<%= request.getAttribute("myself")%>">
			    	<input type="hidden" name="gender" value="<%= request.getAttribute("gender")%>">
			    	<input type="hidden" name="birth_date" value="<%= request.getAttribute("birth_date")%>">
			    	<input type="hidden" name="busho_id" value="<%= request.getAttribute("busho_id")%>">
			    	<input type="hidden" name="area" value="<%= request.getAttribute("area")%>">
			    	<input class="formButton" type="submit" value="確定">
			    </form>
			    <form action="CustomerSendServlet" method="POST">
			        <input type="hidden" name="busho_img" value="<%= request.getAttribute("busho_img")%>">
			        <input type="hidden" name="busho_name" value="<%= request.getAttribute("busho_name")%>">
			    	<input type="hidden" name="nickname" value="<%= request.getAttribute("nickname")%>">
			    	<input type="hidden" name="user_id" value="<%= request.getAttribute("user_id")%>">
			    	<input type="hidden" name="current_password" value="<%= request.getAttribute("password")%>">
			    	<input type="hidden" name="myself" value="<%= request.getAttribute("myself")%>">
			    	<input type="hidden" name="gender" value="<%= request.getAttribute("gender")%>">
			    	<input type="hidden" name="birth_date" value="<%= request.getAttribute("birth_date")%>">
			    	<input type="hidden" name="busho_id" value="<%= request.getAttribute("busho_id")%>">
			    	<input type="hidden" name="area" value="<%= request.getAttribute("area")%>">
			    	<input class="formButton Right" type="submit" value="修正する">
			    </form> 
			</div>
		</div>
	</div>
</body>
</html>