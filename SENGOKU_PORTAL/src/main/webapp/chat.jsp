<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List, model.entity.ChatBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>全体チャット</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/button.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hina+Mincho&display=swap"
	rel="stylesheet">
</head>
<body>

	<div class="chat">
		<div class="contents-head chat-h">
			<img width="96" height="96"
				src="https://img.icons8.com/bubbles/96/chat.png" alt="chat" />
			<h2>全体チャット</h2>

		</div>
		<div class="main-contents-inner">
			<div class="main-contents-inner-header">
			ここに送信フォームを置きたい
			</div>
			<div class="chat-box">
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
</body>
</html>