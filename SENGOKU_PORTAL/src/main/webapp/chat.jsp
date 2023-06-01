<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List, model.entity.ChatBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>全体チャット</title>
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
<body class="chat-body">
	<jsp:include page="header.jsp">
		<jsp:param name="current_page" value="chat" />
	</jsp:include>
	<jsp:include page="navigation-bar.jsp">
		<jsp:param name="current_page" value="chat" />
	</jsp:include>
	<div class="jsp-main-contents">
		<div class="chat chat-all">
			<div class="contents-head chat-h">
				<img width="96" height="96"
					src="https://img.icons8.com/bubbles/96/chat.png" alt="chat" />
				<h2>全体チャット</h2>
	
			</div>
			<div class="main-contents-inner">
				<div class="main-contents-inner-header">
				
				<!-- チャット入力・送信 -->
				<% if(session.getAttribute("user_id") != null){ %>
					<form action="SendChatServlet" method="POST">
					<input type="hidden" name="user_id" value="<%=session.getAttribute("user_id") %>">
						<div class="chat-send-box">
							<textarea class="Form-Item-Textarea chat-form" placeholder="140文字以内（公序良俗に反する発言はお控えください）" name="message"rows="2" cols="70" maxlength="140"></textarea>
							<input class="formButton" type="submit" value="送信">
						</div>
					</form>
				<% } else { %>
				
				<% } %>
				</div>
				<div class="chat-box chat-box-all">
					<ul class="chat-list">
	
						<!-- 最新10件を受け取る -->
						<%
						List<ChatBean> chatList = (List<ChatBean>) request.getAttribute("chatList");
						%>
	
						<%
						for (ChatBean chat : chatList) {
						%>
						<li>
							<div class="chat-head">
								<p><%=chat.getNickname()%></p>
								<p class="chat-date"><%=chat.getCreatedAt()%></p>
							</div>
							<div class="chat-contents">
	
								<!-- 推しの武将が設定されていなければデフォルトの画像を設定する -->
								<%
								if (chat.getBushoImg() == null) {
								%>
								<img class="chat-icon"
									src="https://lh3.googleusercontent.com/831pz4j2408xtqvwk3iOIPkzDxXSW_5HrOlTSE-5Pxj9x55WWTMvOUJfoPQLuS7cQWq9xmC4HBdt-nVBoRNjExqLHC5snkP-4uOehzX4cC7Li9elnXUWilEgGaIqWdu7TMVrbGsq=s200-p-k">
								<%
								} else {
								%>
								<img class="chat-icon" src="<%=chat.getBushoImg()%>">
								<%
								}
								%>
								<p><%=chat.getMessage()%></p>
							</div>
						</li>
						<%
						}
						%>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>