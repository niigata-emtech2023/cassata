<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.UserBean, model.entity.BushoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顧客情報変更</title>
<link rel="icon" href="images/favicon.ico" id="favicon">
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
	<!-- CustomerChangeSendServletから転送 -->
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
	    
	    	String error = null;
	    	
	    	if(request.getAttribute("error") != null){
	    		error = (String)request.getAttribute("error");
	    	}
	    	
	    	List<BushoBean> bushoList = (List<BushoBean>) request.getAttribute("bushoList");
	    	
		%>
		
		
		<div class="Form">
			<div class="Form-Item">
		    	<h1>顧客情報変更</h1>
		    </div>
			<form action="CustomerSendServlet" method="POST">
			
			<!-- ニックネーム -->
	    	<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">現在のアイコン<br>（推しの武将）</span>
			   </p>
			   <div class="Form-Icon">
			   	<% if(request.getAttribute("busho_img").equals("null")) {%>
		    		<img src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k"  alt="プロフィール写真">
				<% } else { %>
					<img src="<%=request.getAttribute("busho_img")%>"  alt="プロフィール写真">	
				<% } %><br>
				</div>
			</div>
    
		    <!-- ニックネーム -->
	    	<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">ニックネーム</span>
			   </p>
			   <input type="text" name="nickname" class="Form-Item-Input" value="<%=request.getAttribute("nickname")%>"  placeholder="8文字以内" maxlength="8">
			</div>
			
			<!-- ID -->
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">ID</span><div class="Form-Item-Confirm"><%=request.getAttribute("user_id")%></div>
			   </p>
			   <input type="hidden" name="user_id" value="<%=request.getAttribute("user_id")%>">
			</div>
		    
		    <!-- 現在のパスワード -->
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">現在のパスワード</span><div class="Form-Item-Confirm"><%=request.getAttribute("user_id")%></div>
			   </p>
			   <input type="hidden" name="user_id" value="<%=request.getAttribute("password")%>">
			</div>
			
			<!-- 新しいパスワード(1) -->
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="Form-Item-Label-Required">必須</span><span class="formHead">新しいパスワード</span>
			   </p>
			   <input type="password" name="new_password_1" class="Form-Item-Input" placeholder="変更しない場合は現在のパスワードを入力" pattern="^[0-9a-zA-Z]+$" maxlength="16" required>
			</div>
		    
		    <!-- 新しいパスワード(2) -->
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="Form-Item-Label-Required">必須</span><span class="formHead">もう一度入力</span>
			   </p>
			   <input type="password" name="new_password_2" class="Form-Item-Input" placeholder="変更しない場合は現在のパスワードを入力" pattern="^[0-9a-zA-Z]+$" maxlength="16" required>
			</div>

		    
		    <!-- パスワードが一致しなかったら戻される -->
		    <% if(error == null) {%>
		    
		    <% } else { %>
		    	<span class="errorMessage"><%= request.getAttribute("error") %><br></span>
		    <% } %>
		    
		    
			<!-- 自己紹介 -->
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">自己紹介</span>
			   </p>
			    <% if(request.getAttribute("myself").equals("null")){ %>
			    	<textarea class="Form-Item-Textarea" name="myself" placeholder="100文字以内" maxlength="100"></textarea><br>
			    <% } else { %>
			    	<textarea class="Form-Item-Textarea" name="myself" placeholder="100文字以内" maxlength="100"><%=request.getAttribute("myself")%></textarea><br>
			    <% } %>
			</div>
		    
		    <!-- 性別 -->
		    <div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">性別</span>
			   </p>
			    <% if(request.getAttribute("gender").equals("1")){ %>
				    <input class="Form-Item-Input-Radio" type="radio" name="gender" value="1" checked="checked">不明
				    <input class="Form-Item-Input-Radio" type="radio" name="gender" value="2">男性
				    <input class="Form-Item-Input-Radio" type="radio" name="gender" value="3">女性<br>
				<% } else if (request.getAttribute("gender").equals("2")){ %>
					<input class="Form-Item-Input-Radio" type="radio" name="gender" value="1">不明
				    <input class="Form-Item-Input-Radio" type="radio" name="gender" value="2" checked="checked">男性
				    <input class="Form-Item-Input-Radio" type="radio" name="gender" value="3">女性<br>
				<% } else { %>
					<input class="Form-Item-Input-Radio" type="radio" name="gender" value="1">不明
				    <input class="Form-Item-Input-Radio" type="radio" name="gender" value="2">男性
				    <input class="Form-Item-Input-Radio" type="radio" name="gender" value="3" checked="checked">女性<br>
				<% } %>
			</div>
		    
		   	<!-- 生年月日 -->
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">生年月日</span>
			   </p>
				<% if(request.getAttribute("birth_date").equals("null")){ %>
			    	<input type="text" name="birth_date" class="Form-Item-Input" placeholder="例:2000-01-01">
			    <% } else { %>
			    	<input type="text" name="birth_date" class="Form-Item-Input" placeholder="例:2000/01/01" value="<%=request.getAttribute("birth_date")%>"><br>
			    <% } %>
			</div>

		   	<!-- 推しの武将 -->
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">推しの武将</span>
			   </p>
			    <select class="Form-Item-Input-Select" name="busho_name">
			    	<option value="null" selected>未設定</option>
					<% for(BushoBean busho : bushoList){ %>
						<% if(busho.getBushoName().equals(request.getAttribute("busho_name"))){ %>
							<option value="<%= busho.getBushoName() %>" selected><%= busho.getBushoName() %></option>
						<% } else { %>
							<option value="<%= busho.getBushoName() %>"><%= busho.getBushoName() %></option>
						<% } %>
					<% } %>
			    </select>
			</div>
		    
		    <!-- 出身地 -->
			<div class="Form-Item">
			   <p class="Form-Item-Label">
			     <span class="formHead">出身地</span>
			   </p>
			    <% if(request.getAttribute("area").equals("null")){ %>
			    	<input type="text" name="area" class="Form-Item-Input"><br>
			    <% } else { %>
			    	<input type="text" name="area" class="Form-Item-Input" value="<%=request.getAttribute("area")%>"><br>
			    <% } %>
			</div>
			
		    <input class="formButton" type="submit" value="変更する">
		    </form>
		</div>
	</div>
</body>
</html>